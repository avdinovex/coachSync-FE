/// Environment / configuration constants for API access.
/// Override at build time with --dart-define=GRAPHQL_ENDPOINT=... if needed.
const String kGraphqlEndpoint = String.fromEnvironment(
  'GRAPHQL_ENDPOINT',
  defaultValue: 'http://192.168.1.74:3000/graphql',
);

/// For Android emulator: Use your computer's local IP address (192.168.1.55)
/// For physical device: Use your computer's IP address on the same network
/// Note: 10.0.2.2 sometimes doesn't work reliably on all emulators
