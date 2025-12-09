/// Environment / configuration constants for API access.
/// Override at build time with --dart-define=GRAPHQL_ENDPOINT=... if needed.
const String kGraphqlEndpoint = String.fromEnvironment(
  'GRAPHQL_ENDPOINT',
  defaultValue: 'http://10.0.2.2:3000/graphql',
);

/// For Android emulator: 10.0.2.2 maps to host machine's localhost
/// For physical device: Use your computer's IP address (e.g., http://192.168.1.x:3000/graphql)
