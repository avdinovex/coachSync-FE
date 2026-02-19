import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:gql_exec/gql_exec.dart';
import 'package:gql_link/gql_link.dart';
import 'dart:async';

import '../constants/environment.dart';
import 'auth_service.dart';
import 'timeout_http_client.dart';

/// Custom HTTP link with extended timeout
class CustomHttpLink extends Link {
  CustomHttpLink(this.uri, {this.httpClient, this.defaultHeaders});

  final String uri;
  final TimeoutHttpClient? httpClient;
  final Map<String, String>? defaultHeaders;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final client = httpClient ?? TimeoutHttpClient();
    final httpLink = graphql.HttpLink(
      uri,
      httpClient: client,
      defaultHeaders: defaultHeaders ?? {},
    );
    
    // Use a longer timeout for the stream
    yield* httpLink.request(request, forward).timeout(
      const Duration(seconds: 120),
      onTimeout: (sink) {
        sink.addError(TimeoutException('GraphQL request timed out after 120 seconds'));
        sink.close();
      },
    );
  }
}

/// Provides GraphQL clients that automatically attach the latest auth token.
class GraphQLClientFactory {
  GraphQLClientFactory._();

  /// Singleton instance — reused across the app to avoid repeated WebSocket
  /// connection attempts on every service instantiation.
  static graphql.GraphQLClient? _cachedClient;

  static CustomHttpLink _createHttpLink() {
    return CustomHttpLink(
      kGraphqlEndpoint,
      httpClient: TimeoutHttpClient(timeout: const Duration(seconds: 120)),
      defaultHeaders: {
        'Content-Type': 'application/json',
      },
    );
  }

  static graphql.GraphQLClient _createClient() {
    return graphql.GraphQLClient(
      cache: graphql.GraphQLCache(store: graphql.InMemoryStore()),
      link: graphql_flutter.AuthLink(
        getToken: () async {
          final token = await AuthService.getStoredToken();
          return token != null ? 'Bearer $token' : null;
        },
      ).concat(_createHttpLink()),
      defaultPolicies: graphql.DefaultPolicies(
        query: graphql.Policies(
          fetch: graphql.FetchPolicy.noCache,
        ),
        mutate: graphql.Policies(
          fetch: graphql.FetchPolicy.noCache,
        ),
      ),
      queryRequestTimeout: const Duration(seconds: 120),
    );
  }

  /// Singleton authenticated client — created once and reused.
  /// Call [resetClient] after logout so a fresh client is created on next use.
  static graphql.GraphQLClient get authenticatedClient {
    _cachedClient ??= _createClient();
    return _cachedClient!;
  }

  /// Call this on logout / token change to force a new client next time.
  static void resetClient() {
    _cachedClient = null;
  }
}
