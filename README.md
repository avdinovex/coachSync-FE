# CoachSync (Flutter)

GraphQL-enabled mobile/web client for the Coach-Sync NestJS backend. The app currently focuses on the authentication flow (login/sign-up) using the backend's GraphQL API and typed Dart code generated via `graphql_codegen`.

## Prerequisites

- Flutter 3.24+ (or the version declared in `pubspec.yaml`)
- Dart 3.10+
- Backend running locally at `http://localhost:3000/graphql` (or supply your own URL via `--dart-define`)
- Node.js (optional) if you want the schema sync script to fetch SDL via `get-graphql-schema`

## Setup

```powershell
cd coachsync
flutter pub get

# Copy backend schema (from local repo or live endpoint)
./scripts/sync-schema.ps1 -GraphQLEndpoint http://localhost:3000/graphql

# Generate typed operations (login/signup + teams)
dart run build_runner build --delete-conflicting-outputs
```

Run the Flutter app, overriding the GraphQL endpoint when needed (Android emulator uses `10.0.2.2`).

```powershell
flutter run --dart-define=GRAPHQL_ENDPOINT=http://10.0.2.2:3000/graphql
```

## Authentication Flow

- `lib/graphql/operations/auth.graphql` contains the `login` and `signup` mutations. Running codegen produces strongly typed helpers under `lib/graphql/operations/auth.graphql.dart`.
- `lib/core/services/auth_service.dart` calls those mutations through `graphql`'s `GraphQLClient`, stores JWTs in `FlutterSecureStorage`, and returns a typed `AuthResult`.
- UI widgets in `lib/features/auth/presentation/pages/*` use `AuthService.login` / `signup` to authenticate users and provide simple navigation feedback. The sign-up screen now collects **first name**, **last name**, **email**, **password**, and a **role (Player or Coach)** to match the backend contract.

Tokens are persisted under the `access_token` key, so subsequent requests can add authorization headers once additional modules are wired up.

## Teams Flow

- Team-related operations live in `lib/graphql/operations/teams.graphql` (queries: `GetMyTeams`; mutations: `CreateTeam`, `AddTeamMember`). Run codegen after editing these definitions.
- `lib/core/services/graphql_client_factory.dart` builds a shared `GraphQLClient` that injects the stored JWT via an `AuthLink`. All team APIs use this client to ensure the `Authorization` header is present.
- `lib/features/team/data/team_service.dart` wraps the generated operations into simple methods (`fetchMyTeams`, `createTeam`, `joinTeam`).
- UI: `TeamSelectionPage` now loads data from the backend, displays the user's teams (with empty/error states), and exposes create/join actions. `CreateTeamPage` and `JoinTeamPage` call `TeamService` directly and return to the selection screen when successful.
- The legacy `AddMembersPage` and mock `DataStorage` are deprecated placeholders; the real data source is the NestJS GraphQL backend.

## Useful Commands

```powershell
# Watch mode for codegen while editing .graphql files
dart run build_runner watch --delete-conflicting-outputs
```

Refer to `GRAPHQL_CODEGEN_SETUP.md` in the backend repo for shared guidance on schema/codegen conventions.
