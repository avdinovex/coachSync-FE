import '../../../../graphql/operations/stats.graphql.dart';
import '../../../../graphql/schema.graphql.dart';

// ─── Game Status ─────────────────────────────────────────────────

enum GameStatus {
  notStarted,
  inProgress,
  isFinal;

  String get label {
    switch (this) {
      case GameStatus.notStarted:
        return 'Not Started';
      case GameStatus.inProgress:
        return 'In Progress';
      case GameStatus.isFinal:
        return 'Final';
    }
  }

  String get apiValue {
    switch (this) {
      case GameStatus.notStarted:
        return 'NOT_STARTED';
      case GameStatus.inProgress:
        return 'IN_PROGRESS';
      case GameStatus.isFinal:
        return 'FINAL';
    }
  }

  Enum$GameStatus toGraphQL() {
    switch (this) {
      case GameStatus.notStarted:
        return Enum$GameStatus.NOT_STARTED;
      case GameStatus.inProgress:
        return Enum$GameStatus.IN_PROGRESS;
      case GameStatus.isFinal:
        return Enum$GameStatus.FINAL;
    }
  }

  static GameStatus fromGraphQL(Enum$GameStatus status) {
    switch (status) {
      case Enum$GameStatus.NOT_STARTED:
        return GameStatus.notStarted;
      case Enum$GameStatus.IN_PROGRESS:
        return GameStatus.inProgress;
      case Enum$GameStatus.FINAL:
        return GameStatus.isFinal;
      default:
        return GameStatus.notStarted;
    }
  }

  static GameStatus fromString(String value) {
    switch (value.toUpperCase()) {
      case 'NOT_STARTED':
        return GameStatus.notStarted;
      case 'IN_PROGRESS':
        return GameStatus.inProgress;
      case 'FINAL':
        return GameStatus.isFinal;
      default:
        return GameStatus.notStarted;
    }
  }
}

// ─── Game Play ───────────────────────────────────────────────────

class GamePlay {
  final String id;
  final String gameStatsId;
  final String? playerId;
  final String? assistPlayerId;
  final String playType;
  final String? playResult;
  final int pointsScored;
  final bool forTeam;
  final int period;
  final String? gameClock;
  final String? description;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;

  const GamePlay({
    required this.id,
    required this.gameStatsId,
    this.playerId,
    this.assistPlayerId,
    required this.playType,
    this.playResult,
    required this.pointsScored,
    required this.forTeam,
    required this.period,
    this.gameClock,
    this.description,
    this.metadata,
    required this.createdAt,
  });

  factory GamePlay.fromFragment(Fragment$GamePlayFields f) {
    return GamePlay(
      id: f.id,
      gameStatsId: f.gameStatsId,
      playerId: f.playerId,
      assistPlayerId: f.assistPlayerId,
      playType: f.playType,
      playResult: f.playResult,
      pointsScored: f.pointsScored,
      forTeam: f.forTeam,
      period: f.period,
      gameClock: f.gameClock,
      description: f.description,
      metadata: f.metadata != null
          ? Map<String, dynamic>.from(f.metadata as Map)
          : null,
      createdAt: f.createdAt,
    );
  }

  /// Human-readable description of what happened
  String get displayText {
    final parts = <String>[];

    if (playResult != null) {
      parts.add('$playType ${playResult!}');
    } else {
      parts.add(playType);
    }

    if (pointsScored > 0) {
      parts.add('+$pointsScored pts');
    }

    if (!forTeam) {
      parts.add('(opponent)');
    }

    return parts.join(' · ');
  }

  /// Short play label for UI chips
  String get shortLabel {
    switch (playType) {
      case '2PT_FG':
        return '2PT';
      case '3PT_FG':
        return '3PT';
      case 'FREE_THROW':
        return 'FT';
      case 'GOAL':
        return 'GOAL';
      case 'RUN':
        return 'RUN';
      case 'TOUCHDOWN':
        return 'TD';
      default:
        return playType;
    }
  }
}

// ─── Player Stat ─────────────────────────────────────────────────

class PlayerStat {
  final String id;
  final String gameStatsId;
  final String userId;
  final int? points;
  final int? assists;
  final int? rebounds;
  final int? minutesPlayed;
  final Map<String, dynamic> stats;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PlayerStat({
    required this.id,
    required this.gameStatsId,
    required this.userId,
    this.points,
    this.assists,
    this.rebounds,
    this.minutesPlayed,
    this.stats = const {},
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlayerStat.fromFragment(Fragment$PlayerStatFields f) {
    return PlayerStat(
      id: f.id,
      gameStatsId: f.gameStatsId,
      userId: f.userId,
      points: f.points,
      assists: f.assists,
      rebounds: f.rebounds,
      minutesPlayed: f.minutesPlayed,
      stats: f.stats != null
          ? Map<String, dynamic>.from(f.stats as Map)
          : {},
      createdAt: f.createdAt,
      updatedAt: f.updatedAt,
    );
  }

  /// Get the total points (from stats JSON or legacy field)
  int get totalPoints => (stats['PTS'] as num?)?.toInt() ?? points ?? 0;

  /// Get total assists
  int get totalAssists => (stats['AST'] as num?)?.toInt() ?? assists ?? 0;
}

// ─── Game Stat ───────────────────────────────────────────────────

class GameStat {
  final String id;
  final String eventId;
  final String teamId;
  final String? opponentName;
  final String? finalScore;
  final int homeScore;
  final int awayScore;
  final GameStatus gameStatus;
  final int currentPeriod;
  final bool scoreOverride;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<PlayerStat> playerStats;
  final List<GamePlay> plays;

  const GameStat({
    required this.id,
    required this.eventId,
    required this.teamId,
    this.opponentName,
    this.finalScore,
    this.homeScore = 0,
    this.awayScore = 0,
    this.gameStatus = GameStatus.notStarted,
    this.currentPeriod = 1,
    this.scoreOverride = false,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.playerStats = const [],
    this.plays = const [],
  });

  factory GameStat.fromFragment(Fragment$GameStatFields f) {
    return GameStat(
      id: f.id,
      eventId: f.eventId,
      teamId: f.teamId,
      opponentName: f.opponentName,
      finalScore: f.finalScore,
      homeScore: f.homeScore,
      awayScore: f.awayScore,
      gameStatus: GameStatus.fromGraphQL(f.gameStatus),
      currentPeriod: f.currentPeriod,
      scoreOverride: f.scoreOverride,
      notes: f.notes,
      createdAt: f.createdAt,
      updatedAt: f.updatedAt,
      playerStats: f.playerStats
              ?.map((ps) => PlayerStat.fromFragment(ps))
              .toList() ??
          [],
    );
  }

  factory GameStat.fromFragmentWithPlays(Fragment$GameStatWithPlays f) {
    return GameStat(
      id: f.id,
      eventId: f.eventId,
      teamId: f.teamId,
      opponentName: f.opponentName,
      finalScore: f.finalScore,
      homeScore: f.homeScore,
      awayScore: f.awayScore,
      gameStatus: GameStatus.fromGraphQL(f.gameStatus),
      currentPeriod: f.currentPeriod,
      scoreOverride: f.scoreOverride,
      notes: f.notes,
      createdAt: f.createdAt,
      updatedAt: f.updatedAt,
      playerStats: f.playerStats
              ?.map((ps) => PlayerStat.fromFragment(ps))
              .toList() ??
          [],
      plays: f.plays?.map((p) => GamePlay.fromFragment(p)).toList() ?? [],
    );
  }

  /// Score display string like "42 - 38"
  String get scoreDisplay => '$homeScore - $awayScore';

  /// Whether the game is currently live
  bool get isLive => gameStatus == GameStatus.inProgress;

  /// Whether the game hasn't started yet
  bool get isNotStarted => gameStatus == GameStatus.notStarted;

  /// Whether the game is finished
  bool get isFinal => gameStatus == GameStatus.isFinal;

  /// Whether we're winning
  bool get isWinning => homeScore > awayScore;

  /// Whether we're losing
  bool get isLosing => homeScore < awayScore;

  /// Whether the game is tied
  bool get isTied => homeScore == awayScore;

  /// Result label
  String get resultLabel {
    if (!isFinal) return gameStatus.label;
    if (isWinning) return 'WIN';
    if (isLosing) return 'LOSS';
    return 'TIE';
  }
}
