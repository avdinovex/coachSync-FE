import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/environment.dart';
import '../../graphql/schema.graphql.dart';
import '../../graphql/operations/auth.graphql.dart';
import 'graphql_client_factory.dart';

class AuthService {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'access_token';
  static AuthUser? _currentUser;
  static final graphql.GraphQLClient _graphQLClient = graphql.GraphQLClient(
    cache: graphql.GraphQLCache(store: graphql.InMemoryStore()),
    link: graphql.HttpLink(kGraphqlEndpoint),
  );

  static AuthUser? get currentUser => _currentUser;

  /// Performs GraphQL login mutation.
  static Future<AuthResult> login({required String email, required String password}) async {
    final result = await _graphQLClient.mutate$Login(
      Options$Mutation$Login(
        variables: Variables$Mutation$Login(
          input: Input$LoginInput(email: email, password: password),
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    final payload = _extractLoginPayload(result);
    final user = AuthUser.fromLoginUser(payload.user);
    await _storage.write(key: _tokenKey, value: payload.accessToken);
    _currentUser = user;
    return AuthResult(token: payload.accessToken, user: user);
  }

  /// Performs GraphQL signup mutation.
  static Future<AuthResult> signup({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    Enum$UserRole role = Enum$UserRole.USER,
  }) async {
    final input = Input$SignupInput(
      email: email,
      password: password,
      firstName: firstName?.isNotEmpty == true ? firstName : null,
      lastName: lastName?.isNotEmpty == true ? lastName : null,
      role: role,
    );

    final result = await _graphQLClient.mutate$Signup(
      Options$Mutation$Signup(
        variables: Variables$Mutation$Signup(input: input),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    final payload = _extractSignupPayload(result);
    final user = AuthUser.fromSignupUser(payload.user);
    await _storage.write(key: _tokenKey, value: payload.accessToken);
    _currentUser = user;
    return AuthResult(token: payload.accessToken, user: user);
  }

  /// Performs Google login via REST endpoint.
  static Future<AuthResult> loginWithGoogle(String idToken) async {
    final uri = Uri.parse(kGraphqlEndpoint.replaceFirst('/graphql', '/auth/google'));
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idToken': idToken}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final token = data['accessToken'] as String;
      // Assuming the backend returns the user object as well, or we decode the token.
      // For now, we might need to fetch the user or trust the backend response structure.
      // Let's assume the backend returns { accessToken: "...", user: { ... } } matching the GraphQL structure roughly.
      
      // If the backend only returns a token, we might need to decode it or fetch user profile.
      // Given I can't see the backend implementation, I'll assume a standard structure.
      // If the backend returns just the token, we'll need to decode it.
      
      // Let's assume the backend returns the same structure as login mutation for consistency if I were implementing it.
      // But since I didn't implement it, I'll assume it returns at least an accessToken.
      
      // We need to construct an AuthUser. 
      // If the backend returns the user object:
      if (data.containsKey('user')) {
        final userData = data['user'];
        final user = AuthUser(
          id: userData['id'],
          email: userData['email'],
          firstName: userData['firstName'],
          lastName: userData['lastName'],
          role: Enum$UserRole.values.firstWhere((e) => e.name == userData['role'], orElse: () => Enum$UserRole.USER),
        );
        await _storage.write(key: _tokenKey, value: token);
        _currentUser = user;
        return AuthResult(token: token, user: user);
      } else {
         throw AuthException('Invalid response from server');
      }
    } else {
      throw AuthException('Google login failed: ${response.body}');
    }
  }

  static Future<String?> getStoredToken() => _storage.read(key: _tokenKey);
  static Future<void> clearToken() async {
    _currentUser = null;
    await _storage.delete(key: _tokenKey);
    // Reset cached GraphQL client so the new session gets a clean client.
    GraphQLClientFactory.resetClient();
  }

  static Mutation$Login$login _extractLoginPayload(
    graphql.QueryResult<Mutation$Login> result,
  ) {
    if (result.hasException) {
      throw AuthException(_formatException(result.exception));
    }
    final payload = result.parsedData?.login;
    if (payload == null) {
      throw AuthException('Login response missing data');
    }
    return payload;
  }

  static Mutation$Signup$signup _extractSignupPayload(
    graphql.QueryResult<Mutation$Signup> result,
  ) {
    if (result.hasException) {
      throw AuthException(_formatException(result.exception));
    }
    final payload = result.parsedData?.signup;
    if (payload == null) {
      throw AuthException('Signup response missing data');
    }
    return payload;
  }

  static String _formatException(graphql.OperationException? exception) {
    if (exception == null) return 'Unknown error';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    if (exception.linkException != null) {
      final linkEx = exception.linkException;
      // Handle timeout exceptions
      if (linkEx.toString().contains('TimeoutException') || 
          linkEx.toString().contains('timeout') ||
          linkEx.toString().contains('No stream event')) {
        return 'Connection timeout. Please check your network and try again.';
      }
      // Handle connection errors
      if (linkEx.toString().contains('SocketException') ||
          linkEx.toString().contains('connection') ||
          linkEx.toString().contains('abort')) {
        return 'Cannot connect to server. Please check if the server is running.';
      }
      return 'Network error. Please try again.';
    }
    return 'Unknown error';
  }
}

class AuthResult {
  final String token;
  final AuthUser user;
  AuthResult({required this.token, required this.user});
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
  @override
  String toString() => 'AuthException: $message';
}

class AuthUser {
  final String id;
  final String email;
  final String? firstName;
  final String? lastName;
  final Enum$UserRole role;

  const AuthUser({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.role,
  });

  factory AuthUser.fromLoginUser(Mutation$Login$login$user user) => AuthUser(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        role: user.role,
      );

  factory AuthUser.fromSignupUser(Mutation$Signup$signup$user user) => AuthUser(
        id: user.id,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        role: user.role,
      );
}
