import 'package:graphql/client.dart' as graphql;

import '../../../core/services/auth_service.dart';
import '../../../core/services/graphql_client_factory.dart';
import '../../../graphql/operations/teams.graphql.dart';
import '../../../graphql/schema.graphql.dart';
import '../domain/models/team.dart';

class TeamService {
  TeamService({graphql.GraphQLClient? client})
    : _client = client ?? GraphQLClientFactory.authenticatedClient;

  final graphql.GraphQLClient _client;

  Future<List<Team>> fetchMyTeams() async {
    final result = await _client.query$GetMyTeams(
      Options$Query$GetMyTeams(fetchPolicy: graphql.FetchPolicy.noCache),
    );
    if (result.hasException) {
      throw TeamException(_formatException(result.exception));
    }
    final data = result.parsedData;
    if (data == null) {
      throw TeamException('No data returned for my teams');
    }
    return data.myTeams.map(Team.fromMyTeamsQuery).toList();
  }

  Future<Team> createTeam({
    required String name,
    required String sport,
    String? description,
  }) async {
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
    if (result.hasException) {
      throw TeamException(_formatException(result.exception));
    }
    final created = result.parsedData?.createTeam;
    if (created == null) {
      throw TeamException('Team creation returned empty payload');
    }
    return Team.fromCreateMutation(created);
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
    if (exception == null) return 'Unknown error';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    if (exception.linkException != null) {
      return exception.linkException!.originalException?.toString() ??
          exception.linkException.toString();
    }
    return 'Unknown error';
  }
}

class TeamException implements Exception {
  TeamException(this.message);
  final String message;
  @override
  String toString() => 'TeamException: $message';
}
