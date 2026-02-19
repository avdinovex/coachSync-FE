import 'dart:convert';

import 'package:graphql/client.dart' as graphql;
import 'package:http/http.dart' as http;

import '../../../core/constants/environment.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/graphql_client_factory.dart';
import '../../../graphql/operations/teams.graphql.dart';
import '../../../graphql/schema.graphql.dart';
import '../domain/models/team.dart';

/// Base REST API URL derived from the GraphQL endpoint.
String get _baseUrl => kGraphqlEndpoint.replaceFirst('/graphql', '');

class TeamService {
  TeamService({graphql.GraphQLClient? client})
    : _client = client ?? GraphQLClientFactory.authenticatedClient;

  final graphql.GraphQLClient _client;

  Future<List<Team>> fetchMyTeams() async {
    print('🔵 [TeamService] fetchMyTeams called');
    try {
      print('🔵 [TeamService] Sending GraphQL query to fetch teams...');
      final result = await _client.query$GetMyTeams(
        Options$Query$GetMyTeams(fetchPolicy: graphql.FetchPolicy.noCache),
      );
      print('🔵 [TeamService] GraphQL query completed');
      
      if (result.hasException) {
        print('🔴 [TeamService] GraphQL exception: ${result.exception}');
        throw TeamException(_formatException(result.exception));
      }
      
      final data = result.parsedData;
      if (data == null) {
        print('🔴 [TeamService] No data returned');
        throw TeamException('No data returned for my teams');
      }
      
      final teams = data.myTeams.map(Team.fromMyTeamsQuery).toList();
      print('🟢 [TeamService] Successfully fetched ${teams.length} teams');
      return teams;
    } catch (e) {
      print('🔴 [TeamService] Error in fetchMyTeams: $e');
      rethrow;
    }
  }

  Future<Team> createTeam({
    required String name,
    required String sport,
    String? description,
  }) async {
    print('🔵 [TeamService] createTeam called: name=$name, sport=$sport');
    try {
      print('🔵 [TeamService] Sending GraphQL mutation to create team...');
      final result = await _client.mutate$CreateTeam(
        Options$Mutation$CreateTeam(
          variables: Variables$Mutation$CreateTeam(
            input: Input$CreateTeamInput(
              name: name,
              sport: sport,
              description: description,
            ),
          ),
          fetchPolicy: graphql.FetchPolicy.noCache,
        ),
      );
      print('🔵 [TeamService] GraphQL mutation completed');
      
      if (result.hasException) {
        print('🔴 [TeamService] GraphQL exception: ${result.exception}');
        throw TeamException(_formatException(result.exception));
      }
      
      final created = result.parsedData?.createTeam;
      if (created == null) {
        print('🔴 [TeamService] Team creation returned empty payload');
        throw TeamException('Team creation returned empty payload');
      }
      
      print('🟢 [TeamService] Team created successfully: ${created.id}');
      return Team.fromCreateMutation(created);
    } catch (e) {
      print('🔴 [TeamService] Error in createTeam: $e');
      rethrow;
    }
  }

  // ─────────────────────────── REST helpers ───────────────────────────

  Future<Map<String, String>> _authHeaders() async {
    final token = await AuthService.getStoredToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  void _throwIfError(http.Response response, String context) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      String msg;
      try {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        msg = body['message']?.toString() ?? response.reasonPhrase ?? 'Unknown error';
      } catch (_) {
        msg = response.reasonPhrase ?? 'Unknown error';
      }
      throw TeamException('$context failed (${response.statusCode}): $msg');
    }
  }

  // ─────────────────────────── GET /teams/{id} ─────────────────────────

  Future<Team> getTeamById(String id) async {
    print('🔵 [TeamService] getTeamById: $id');
    final response = await http.get(
      Uri.parse('$_baseUrl/teams/$id'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'getTeamById');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [TeamService] getTeamById success');
    return Team.fromJson(json);
  }

  // ─────────────────────────── PATCH /teams/{id} ───────────────────────

  Future<Team> updateTeam(
    String id, {
    String? name,
    String? sport,
    String? description,
  }) async {
    print('🔵 [TeamService] updateTeam: $id');
    final body = <String, dynamic>{
      'id': id,
      if (name != null) 'name': name,
      if (sport != null) 'sport': sport,
      if (description != null) 'description': description,
    };
    final response = await http.patch(
      Uri.parse('$_baseUrl/teams/$id'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'updateTeam');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [TeamService] updateTeam success');
    return Team.fromJson(json);
  }

  // ─────────────────────────── DELETE /teams/{id} ──────────────────────

  Future<bool> deleteTeam(String id) async {
    print('🔵 [TeamService] deleteTeam: $id');
    final response = await http.delete(
      Uri.parse('$_baseUrl/teams/$id'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'deleteTeam');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [TeamService] deleteTeam success');
    return json['deleted'] == true;
  }

  // ─────────────────────────── GET /teams/{id}/members ────────────────

  Future<List<TeamMember>> getTeamMembers(String id) async {
    print('🔵 [TeamService] getTeamMembers: $id');
    final response = await http.get(
      Uri.parse('$_baseUrl/teams/$id/members'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'getTeamMembers');
    final list = jsonDecode(response.body) as List<dynamic>;
    print('🟢 [TeamService] getTeamMembers: ${list.length} members');
    return list.map((e) => TeamMember.fromJson(e as Map<String, dynamic>)).toList();
  }

  // ─────────────────────────── POST /teams/{id}/members ───────────────

  Future<TeamMember> addMember({
    required String teamId,
    required String userId,
    required List<MemberRole> roles,
  }) async {
    print('🔵 [TeamService] addMember: teamId=$teamId userId=$userId');
    final body = {
      'userId': userId,
      'role': roles.map((r) => r.name).toList(),
    };
    final response = await http.post(
      Uri.parse('$_baseUrl/teams/$teamId/members'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'addMember');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [TeamService] addMember success');
    return TeamMember.fromJson(json);
  }

  // ─────────────────────────── GraphQL operations ──────────────────────

  Future<void> joinTeam({required String joinCode}) async {
    final result = await _client.mutate$JoinTeam(
      Options$Mutation$JoinTeam(
        variables: Variables$Mutation$JoinTeam(
          joinCode: joinCode,
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );
    if (result.hasException) {
      throw TeamException(_formatException(result.exception));
    }
    if (result.parsedData?.joinTeam == null) {
      throw TeamException('Join team response missing data');
    }
  }

  String _formatException(graphql.OperationException? exception) {
    if (exception == null) return 'Unknown error occurred';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    if (exception.linkException != null) {
      final linkEx = exception.linkException;
      if (linkEx.toString().contains('TimeoutException')) {
        return 'Connection timeout. Please check your internet and try again.';
      }
      if (linkEx.toString().contains('SocketException')) {
        return 'Cannot connect to server. Please check your connection.';
      }
      return linkEx?.originalException?.toString() ??
          'Network error occurred';
    }
    return 'Unknown error occurred';
  }
}

class TeamException implements Exception {
  TeamException(this.message);
  final String message;
  @override
  String toString() => 'TeamException: $message';
}
