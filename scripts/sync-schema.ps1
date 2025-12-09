Param(
  [string]$BackendSchemaPath,
  [string]$BackendRoot,
  [string]$FlutterSchemaPath = "lib/graphql/schema.graphql",
  [string]$GraphQLEndpoint,
  [string[]]$GraphQLHeaders,
  [ValidateSet('npx', 'pnpm', 'yarn')]
  [string]$PackageManagerPreference
)

function Resolve-PathOrNull {
  param([string]$Path)
  if (-not $Path) { return $null }
  if (Test-Path $Path) {
    return (Resolve-Path $Path).Path
  }
  return $null
}

function Resolve-BackendSchemaPath {
  param(
    [string]$ExplicitSchema,
    [string]$ExplicitRoot
  )

  $sources = @(
    @{ Type = 'param-schema'; Path = $ExplicitSchema },
    @{ Type = 'env-schema'; Path = $env:COACH_SYNC_BACKEND_SCHEMA }
  )

  foreach ($source in $sources) {
    $candidate = Resolve-PathOrNull $source.Path
    if ($candidate) {
      return $candidate
    }
    if ($source.Path) {
      Write-Verbose "${($source.Type)} provided but path not found: $($source.Path)"
    }
  }

  $roots = New-Object System.Collections.Generic.List[string]
  foreach ($rootSource in @(
      $ExplicitRoot,
      $env:COACH_SYNC_BACKEND_ROOT
    )) {
    $resolvedRoot = Resolve-PathOrNull $rootSource
    if ($resolvedRoot) { $roots.Add($resolvedRoot) }
  }

  $current = Get-Item $PSScriptRoot
  for ($i = 0; $i -lt 5 -and $current; $i++) {
    $roots.Add($current.FullName)
    $current = $current.Parent
  }

  $visited = New-Object System.Collections.Generic.HashSet[string]

  foreach ($rootPath in $roots | Where-Object { $_ } | Sort-Object -Unique) {
    $resolvedRoot = Resolve-PathOrNull $rootPath
    if (-not $resolvedRoot) { continue }
    $result = Find-SchemaUnderRoot -Root $resolvedRoot -MaxDepth 4 -Visited $visited
    if ($result) { return $result }
  }

  Write-Error "Unable to locate schema.gql. Supply -BackendSchemaPath or set COACH_SYNC_BACKEND_SCHEMA."
  exit 1
}

function Find-SchemaUnderRoot {
  param(
    [string]$Root,
    [int]$MaxDepth = 4,
    [System.Collections.Generic.HashSet[string]]$Visited
  )

  if ($Visited.Contains($Root)) { return $null }
  $Visited.Add($Root) | Out-Null

  $queue = New-Object System.Collections.Queue
  $queue.Enqueue([pscustomobject]@{ Path = $Root; Depth = 0 })

  while ($queue.Count -gt 0) {
    $item = $queue.Dequeue()
    $dir = $item.Path
    $depth = $item.Depth

    foreach ($suffix in @('schema.gql', 'src\schema.gql')) {
      $candidate = Join-Path $dir $suffix
      $resolved = Resolve-PathOrNull $candidate
      if ($resolved) { return $resolved }
    }

    if ($depth -ge $MaxDepth) { continue }

    try {
      $children = Get-ChildItem -Path $dir -Directory -ErrorAction SilentlyContinue
    } catch {
      continue
    }

    foreach ($child in $children) {
      if (-not $Visited.Contains($child.FullName)) {
        $Visited.Add($child.FullName) | Out-Null
        $queue.Enqueue([pscustomobject]@{ Path = $child.FullName; Depth = $depth + 1 })
      }
    }
  }

  return $null
}

$resolvedFlutterSchema = [System.IO.Path]::GetFullPath($FlutterSchemaPath)
$flutterDir = Split-Path -Parent $resolvedFlutterSchema
if (-not (Test-Path $flutterDir)) {
  New-Item -ItemType Directory -Force -Path $flutterDir | Out-Null
}

$resolvedEndpoint = if ($GraphQLEndpoint) { $GraphQLEndpoint } elseif ($env:COACH_SYNC_GRAPHQL_ENDPOINT) { $env:COACH_SYNC_GRAPHQL_ENDPOINT } else { $null }
$headers = if ($GraphQLHeaders) { $GraphQLHeaders } elseif ($env:COACH_SYNC_GRAPHQL_HEADERS) { $env:COACH_SYNC_GRAPHQL_HEADERS -split ';' } else { @() }

if ($resolvedEndpoint) {
  Write-Host "Attempting to download schema from $resolvedEndpoint"
  $downloaded = Get-GraphQLSchemaFromEndpoint -Endpoint $resolvedEndpoint -OutputPath $resolvedFlutterSchema -Headers $headers -PackageManagerPreference $PackageManagerPreference
  if ($downloaded) {
    Write-Host "Schema downloaded to $resolvedFlutterSchema"
    exit 0
  }
  Write-Warning "Failed to download schema from endpoint. Falling back to local file copy."
}

$resolvedBackendSchema = Resolve-BackendSchemaPath $BackendSchemaPath $BackendRoot

Copy-Item -Force $resolvedBackendSchema $resolvedFlutterSchema
Write-Host "Schema copied from $resolvedBackendSchema to $resolvedFlutterSchema"

function Get-GraphQLSchemaFromEndpoint {
  param(
    [Parameter(Mandatory = $true)][string]$Endpoint,
    [Parameter(Mandatory = $true)][string]$OutputPath,
    [string[]]$Headers,
    [string]$PackageManagerPreference
  )

  $headerArgs = @()
  foreach ($header in $Headers) {
    if (-not [string]::IsNullOrWhiteSpace($header)) {
      $headerArgs += @('--header', $header)
    }
  }

  $candidates = @(
    @{ Command = 'npx'; Args = @('get-graphql-schema'); Needs='node' },
    @{ Command = 'pnpm'; Args = @('dlx', 'get-graphql-schema'); Needs='node' },
    @{ Command = 'yarn'; Args = @('dlx', 'get-graphql-schema'); Needs='node' }
  )

  if ($PackageManagerPreference) {
    $candidates = $candidates | Where-Object { $_.Command -eq $PackageManagerPreference }
  }

  foreach ($candidate in $candidates) {
    $command = $candidate.Command
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
      continue
    }

    $args = @($candidate.Args + $Endpoint + $headerArgs)

    try {
      $result = & $command @args 2>&1
      if ($LASTEXITCODE -eq 0 -and $result) {
        $result | Set-Content -Path $OutputPath -Encoding utf8
        return $true
      }
      Write-Warning "$command failed to download schema: $result"
    } catch {
      Write-Warning ("Error running {0}: {1}" -f $command, $_)
    }
  }

  try {
    $body = @{ query = (Get-IntrospectionQuery) } | ConvertTo-Json -Depth 100
    $response = Invoke-WebRequest -Uri $Endpoint -Method Post -ContentType 'application/json' -Body $body -Headers (Convert-Headers $Headers) -ErrorAction Stop
    $json = $response.Content | ConvertFrom-Json -Depth 100
    if ($json.data) {
      $sdl = Convert-IntrospectionToSDL -Introspection $json.data
      if ($sdl) {
        $sdl | Set-Content -Path $OutputPath -Encoding utf8
        return $true
      }
    }
    Write-Warning "Introspection query succeeded but SDL conversion failed."
  } catch {
    Write-Warning "Direct introspection failed: $_"
  }

  return $false
}

function Convert-Headers {
  param([string[]]$Headers)
  $hash = @{}
  foreach ($header in $Headers) {
    if ($header -match '^(?<key>[^:]+):\s*(?<value>.+)$') {
      $hash[$matches['key']] = $matches['value']
    }
  }
  return $hash
}

function Get-IntrospectionQuery {
  @"
query IntrospectionQuery {
  __schema {
    queryType { name }
    mutationType { name }
    subscriptionType { name }
    types {
      ...FullType
    }
    directives {
      name
      description
      locations
      args {
        ...InputValue
      }
    }
  }
}

fragment FullType on __Type {
  kind
  name
  description
  fields(includeDeprecated: true) {
    name
    description
    args {
      ...InputValue
    }
    type {
      ...TypeRef
    }
    isDeprecated
    deprecationReason
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...TypeRef
  }
  enumValues(includeDeprecated: true) {
    name
    description
    isDeprecated
    deprecationReason
  }
  possibleTypes {
    ...TypeRef
  }
}

fragment InputValue on __InputValue {
  name
  description
  type { ...TypeRef }
  defaultValue
}

fragment TypeRef on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
            }
          }
        }
      }
    }
  }
}
"@
}

function Convert-IntrospectionToSDL {
  param($Introspection)

  try {
    $temp = New-TemporaryFile
    $json = @{ data = $Introspection } | ConvertTo-Json -Depth 100
    $json | Set-Content -Path $temp -Encoding utf8
    if (Get-Command node -ErrorAction SilentlyContinue) {
      $script = @"
const fs = require('fs');
const { buildClientSchema, printSchema } = require('graphql');
const introspection = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const schema = buildClientSchema(introspection.data ? introspection : { data: introspection });
process.stdout.write(printSchema(schema));
"@
      $nodeScript = New-TemporaryFile
      $script | Set-Content -Path $nodeScript -Encoding utf8
      $output = & node $nodeScript $temp 2>&1
      Remove-Item $nodeScript -Force
      Remove-Item $temp -Force
      if ($LASTEXITCODE -eq 0 -and $output) {
        return $output
      }
      Write-Warning "Node-based SDL conversion failed: $output"
    } else {
      Write-Warning "Node is not available to convert introspection to SDL."
    }
  } catch {
    Write-Warning "Failed to convert introspection result to SDL: $_"
  }
  return $null
}
