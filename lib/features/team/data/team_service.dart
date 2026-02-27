import 'package:graphql/client.dart' as graphql;

import '../../../core/services/graphql_client_factory.dart';
import '../../../graphql/operations/teams.graphql.dart';
import '../../../graphql/schema.graphql.dart';
import '../domain/models/team.dart';

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
