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
          print('🔵 [GraphQLClientFactory] Getting auth token...');
          final token = await AuthService.getStoredToken();
          if (token != null) {
            print('🟢 [GraphQLClientFactory] Auth token found (length: ${token.length})');
          } else {
            print('⚠️ [GraphQLClientFactory] No auth token found');
          }
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

  /// Client for authenticated requests (adds Authorization header per request).
  /// Creates a fresh client instance to avoid connection reuse issues.
  static graphql.GraphQLClient get authenticatedClient {
    print('🔵 [GraphQLClientFactory] Creating fresh authenticated client for endpoint: $kGraphqlEndpoint');
    return _createClient();
  }
}
