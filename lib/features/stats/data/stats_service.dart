import 'package:graphql/client.dart' as graphql;

import '../../../core/services/graphql_client_factory.dart';
import '../../../graphql/operations/stats.graphql.dart';
import '../../../graphql/schema.graphql.dart';
import '../domain/models/game_stat.dart';

class StatsException implements Exception {
  const StatsException(this.message);
  final String message;
  @override
  String toString() => 'StatsException: $message';
}

class StatsService {
  StatsService({graphql.GraphQLClient? client})
      : _client = client ?? GraphQLClientFactory.authenticatedClient;

  final graphql.GraphQLClient _client;

  // ── Queries ─────────────────────────────────────────────────────

  /// Fetch game stats for an event (includes plays and player stats).
  Future<GameStat> getGameStats({required String eventId}) async {
    final result = await _client.query$GetGameStats(
      Options$Query$GetGameStats(
        variables: Variables$Query$GetGameStats(eventId: eventId),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned for game stats');
    }

    return GameStat.fromFragmentWithPlays(data.gameStats);
  }

  /// Fetch all game stats for a team.
  Future<List<GameStat>> getTeamStats({required String teamId}) async {
    final result = await _client.query$GetTeamStats(
      Options$Query$GetTeamStats(
        variables: Variables$Query$GetTeamStats(teamId: teamId),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned for team stats');
    }

    return data.teamStats.map((s) => GameStat.fromFragment(s)).toList();
  }

  /// Fetch all plays for a game.
  Future<List<GamePlay>> getGamePlays({required String gameStatsId}) async {
    final result = await _client.query$GetGamePlays(
      Options$Query$GetGamePlays(
        variables: Variables$Query$GetGamePlays(gameStatsId: gameStatsId),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned for game plays');
    }

    return data.gamePlays.map((p) => GamePlay.fromFragment(p)).toList();
  }

  // ── Mutations ───────────────────────────────────────────────────

  /// Create a new game stats record for a GAME-type event.
  Future<GameStat> recordGameStats({
    required String eventId,
    required String teamId,
    String? opponentName,
    String? notes,
  }) async {
    final result = await _client.mutate$RecordGameStats(
      Options$Mutation$RecordGameStats(
        variables: Variables$Mutation$RecordGameStats(
          input: Input$RecordGameStatsInput(
            eventId: eventId,
            teamId: teamId,
            opponentName: opponentName,
            notes: notes,
          ),
        ),
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned from recordGameStats');
    }

    return GameStat.fromFragment(data.recordGameStats);
  }

  /// Record a single play-by-play action.
  Future<GamePlay> recordPlay({
    required String gameStatsId,
    String? playerId,
    String? assistPlayerId,
    required String playType,
    String? playResult,
    required int pointsScored,
    bool forTeam = true,
    int? period,
    String? gameClock,
    String? description,
  }) async {
    final result = await _client.mutate$RecordPlay(
      Options$Mutation$RecordPlay(
        variables: Variables$Mutation$RecordPlay(
          input: Input$RecordPlayInput(
            gameStatsId: gameStatsId,
            playerId: playerId,
            assistPlayerId: assistPlayerId,
            playType: playType,
            playResult: playResult,
            pointsScored: pointsScored,
            forTeam: forTeam,
            period: period,
            gameClock: gameClock,
            description: description,
          ),
        ),
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned from recordPlay');
    }

    return GamePlay.fromFragment(data.recordPlay);
  }

  /// Undo the most recent play.
  Future<GamePlay?> undoLastPlay({required String gameStatsId}) async {
    final result = await _client.mutate$UndoLastPlay(
      Options$Mutation$UndoLastPlay(
        variables: Variables$Mutation$UndoLastPlay(gameStatsId: gameStatsId),
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data?.undoLastPlay == null) return null;

    return GamePlay.fromFragment(data!.undoLastPlay!);
  }

  /// Update game metadata or manually override scores.
  Future<GameStat> updateGameStats({
    required String id,
    String? opponentName,
    int? homeScore,
    int? awayScore,
    bool? scoreOverride,
    String? notes,
  }) async {
    final result = await _client.mutate$UpdateGameStats(
      Options$Mutation$UpdateGameStats(
        variables: Variables$Mutation$UpdateGameStats(
          input: Input$UpdateGameStatsInput(
            id: id,
            opponentName: opponentName,
            homeScore: homeScore,
            awayScore: awayScore,
            scoreOverride: scoreOverride,
            notes: notes,
          ),
        ),
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned from updateGameStats');
    }

    return GameStat.fromFragment(data.updateGameStats);
  }

  /// Transition game status between NOT_STARTED, IN_PROGRESS, and FINAL.
  Future<GameStat> updateGameStatus({
    required String gameStatsId,
    required GameStatus status,
    int? currentPeriod,
  }) async {
    final result = await _client.mutate$UpdateGameStatus(
      Options$Mutation$UpdateGameStatus(
        variables: Variables$Mutation$UpdateGameStatus(
          input: Input$UpdateGameStatusInput(
            gameStatsId: gameStatsId,
            status: status.toGraphQL(),
            currentPeriod: currentPeriod,
          ),
        ),
      ),
    );

    if (result.hasException) {
      throw StatsException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw StatsException('No data returned from updateGameStatus');
    }

    return GameStat.fromFragment(data.updateGameStatus);
  }

  // ── Helpers ─────────────────────────────────────────────────────

  String _formatException(graphql.OperationException? exception) {
    if (exception == null) return 'Unknown error';

    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.map((e) => e.message).join(', ');
    }

    if (exception.linkException != null) {
      return 'Network error: ${exception.linkException.toString()}';
    }

    return exception.toString();
  }
}
