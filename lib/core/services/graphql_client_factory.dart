import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

import '../constants/environment.dart';
import 'auth_service.dart';
import 'timeout_http_client.dart';

/// Provides GraphQL clients that automatically attach the latest auth token.
class GraphQLClientFactory {
  GraphQLClientFactory._();

  static final graphql.HttpLink _httpLink = graphql.HttpLink(
    kGraphqlEndpoint,
    httpClient: TimeoutHttpClient(timeout: const Duration(seconds: 60)),
    defaultHeaders: {
      'Content-Type': 'application/json',
    },
  );

  static final graphql.GraphQLClient _authedClient = graphql.GraphQLClient(
    cache: graphql.GraphQLCache(store: graphql.InMemoryStore()),
    link: graphql_flutter.AuthLink(
      getToken: () async {
        final token = await AuthService.getStoredToken();
        return token != null ? 'Bearer $token' : null;
      },
    ).concat(_httpLink),
    defaultPolicies: graphql.DefaultPolicies(
      query: graphql.Policies(
        fetch: graphql.FetchPolicy.noCache,
      ),
      mutate: graphql.Policies(
        fetch: graphql.FetchPolicy.noCache,
      ),
    ),
  );

  /// Client for authenticated requests (adds Authorization header per request).
  static graphql.GraphQLClient get authenticatedClient => _authedClient;
}
