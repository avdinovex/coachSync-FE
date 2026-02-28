import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$GamePlayFields {
  Fragment$GamePlayFields({
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
    this.$__typename = 'GamePlay',
  });

  factory Fragment$GamePlayFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$gameStatsId = json['gameStatsId'];
    final l$playerId = json['playerId'];
    final l$assistPlayerId = json['assistPlayerId'];
    final l$playType = json['playType'];
    final l$playResult = json['playResult'];
    final l$pointsScored = json['pointsScored'];
    final l$forTeam = json['forTeam'];
    final l$period = json['period'];
    final l$gameClock = json['gameClock'];
    final l$description = json['description'];
    final l$metadata = json['metadata'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Fragment$GamePlayFields(
      id: (l$id as String),
      gameStatsId: (l$gameStatsId as String),
      playerId: (l$playerId as String?),
      assistPlayerId: (l$assistPlayerId as String?),
      playType: (l$playType as String),
      playResult: (l$playResult as String?),
      pointsScored: (l$pointsScored as int),
      forTeam: (l$forTeam as bool),
      period: (l$period as int),
      gameClock: (l$gameClock as String?),
      description: (l$description as String?),
      metadata: (l$metadata as Map<String, dynamic>?),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

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

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$gameStatsId = gameStatsId;
    _resultData['gameStatsId'] = l$gameStatsId;
    final l$playerId = playerId;
    _resultData['playerId'] = l$playerId;
    final l$assistPlayerId = assistPlayerId;
    _resultData['assistPlayerId'] = l$assistPlayerId;
    final l$playType = playType;
    _resultData['playType'] = l$playType;
    final l$playResult = playResult;
    _resultData['playResult'] = l$playResult;
    final l$pointsScored = pointsScored;
    _resultData['pointsScored'] = l$pointsScored;
    final l$forTeam = forTeam;
    _resultData['forTeam'] = l$forTeam;
    final l$period = period;
    _resultData['period'] = l$period;
    final l$gameClock = gameClock;
    _resultData['gameClock'] = l$gameClock;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$gameStatsId = gameStatsId;
    final l$playerId = playerId;
    final l$assistPlayerId = assistPlayerId;
    final l$playType = playType;
    final l$playResult = playResult;
    final l$pointsScored = pointsScored;
    final l$forTeam = forTeam;
    final l$period = period;
    final l$gameClock = gameClock;
    final l$description = description;
    final l$metadata = metadata;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$gameStatsId,
      l$playerId,
      l$assistPlayerId,
      l$playType,
      l$playResult,
      l$pointsScored,
      l$forTeam,
      l$period,
      l$gameClock,
      l$description,
      l$metadata,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$GamePlayFields || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$gameStatsId = gameStatsId;
    final lOther$gameStatsId = other.gameStatsId;
    if (l$gameStatsId != lOther$gameStatsId) {
      return false;
    }
    final l$playerId = playerId;
    final lOther$playerId = other.playerId;
    if (l$playerId != lOther$playerId) {
      return false;
    }
    final l$assistPlayerId = assistPlayerId;
    final lOther$assistPlayerId = other.assistPlayerId;
    if (l$assistPlayerId != lOther$assistPlayerId) {
      return false;
    }
    final l$playType = playType;
    final lOther$playType = other.playType;
    if (l$playType != lOther$playType) {
      return false;
    }
    final l$playResult = playResult;
    final lOther$playResult = other.playResult;
    if (l$playResult != lOther$playResult) {
      return false;
    }
    final l$pointsScored = pointsScored;
    final lOther$pointsScored = other.pointsScored;
    if (l$pointsScored != lOther$pointsScored) {
      return false;
    }
    final l$forTeam = forTeam;
    final lOther$forTeam = other.forTeam;
    if (l$forTeam != lOther$forTeam) {
      return false;
    }
    final l$period = period;
    final lOther$period = other.period;
    if (l$period != lOther$period) {
      return false;
    }
    final l$gameClock = gameClock;
    final lOther$gameClock = other.gameClock;
    if (l$gameClock != lOther$gameClock) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GamePlayFields on Fragment$GamePlayFields {
  CopyWith$Fragment$GamePlayFields<Fragment$GamePlayFields> get copyWith =>
      CopyWith$Fragment$GamePlayFields(this, (i) => i);
}

abstract class CopyWith$Fragment$GamePlayFields<TRes> {
  factory CopyWith$Fragment$GamePlayFields(
    Fragment$GamePlayFields instance,
    TRes Function(Fragment$GamePlayFields) then,
  ) = _CopyWithImpl$Fragment$GamePlayFields;

  factory CopyWith$Fragment$GamePlayFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GamePlayFields;

  TRes call({
    String? id,
    String? gameStatsId,
    String? playerId,
    String? assistPlayerId,
    String? playType,
    String? playResult,
    int? pointsScored,
    bool? forTeam,
    int? period,
    String? gameClock,
    String? description,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$GamePlayFields<TRes>
    implements CopyWith$Fragment$GamePlayFields<TRes> {
  _CopyWithImpl$Fragment$GamePlayFields(this._instance, this._then);

  final Fragment$GamePlayFields _instance;

  final TRes Function(Fragment$GamePlayFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? gameStatsId = _undefined,
    Object? playerId = _undefined,
    Object? assistPlayerId = _undefined,
    Object? playType = _undefined,
    Object? playResult = _undefined,
    Object? pointsScored = _undefined,
    Object? forTeam = _undefined,
    Object? period = _undefined,
    Object? gameClock = _undefined,
    Object? description = _undefined,
    Object? metadata = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$GamePlayFields(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      gameStatsId: gameStatsId == _undefined || gameStatsId == null
          ? _instance.gameStatsId
          : (gameStatsId as String),
      playerId: playerId == _undefined
          ? _instance.playerId
          : (playerId as String?),
      assistPlayerId: assistPlayerId == _undefined
          ? _instance.assistPlayerId
          : (assistPlayerId as String?),
      playType: playType == _undefined || playType == null
          ? _instance.playType
          : (playType as String),
      playResult: playResult == _undefined
          ? _instance.playResult
          : (playResult as String?),
      pointsScored: pointsScored == _undefined || pointsScored == null
          ? _instance.pointsScored
          : (pointsScored as int),
      forTeam: forTeam == _undefined || forTeam == null
          ? _instance.forTeam
          : (forTeam as bool),
      period: period == _undefined || period == null
          ? _instance.period
          : (period as int),
      gameClock: gameClock == _undefined
          ? _instance.gameClock
          : (gameClock as String?),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$GamePlayFields<TRes>
    implements CopyWith$Fragment$GamePlayFields<TRes> {
  _CopyWithStubImpl$Fragment$GamePlayFields(this._res);

  TRes _res;

  call({
    String? id,
    String? gameStatsId,
    String? playerId,
    String? assistPlayerId,
    String? playType,
    String? playResult,
    int? pointsScored,
    bool? forTeam,
    int? period,
    String? gameClock,
    String? description,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}

const fragmentDefinitionGamePlayFields = FragmentDefinitionNode(
  name: NameNode(value: 'GamePlayFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'GamePlay'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'gameStatsId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'playerId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'assistPlayerId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'playType'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'playResult'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'pointsScored'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'forTeam'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'period'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'gameClock'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'description'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'metadata'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentGamePlayFields = DocumentNode(
  definitions: [fragmentDefinitionGamePlayFields],
);

extension ClientExtension$Fragment$GamePlayFields on graphql.GraphQLClient {
  void writeFragment$GamePlayFields({
    required Fragment$GamePlayFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'GamePlayFields',
        document: documentNodeFragmentGamePlayFields,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$GamePlayFields? readFragment$GamePlayFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GamePlayFields',
          document: documentNodeFragmentGamePlayFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$GamePlayFields.fromJson(result);
  }
}

class Fragment$PlayerStatFields {
  Fragment$PlayerStatFields({
    required this.id,
    required this.gameStatsId,
    required this.userId,
    this.points,
    this.assists,
    this.rebounds,
    this.minutesPlayed,
    required this.stats,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'PlayerStat',
  });

  factory Fragment$PlayerStatFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$gameStatsId = json['gameStatsId'];
    final l$userId = json['userId'];
    final l$points = json['points'];
    final l$assists = json['assists'];
    final l$rebounds = json['rebounds'];
    final l$minutesPlayed = json['minutesPlayed'];
    final l$stats = json['stats'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Fragment$PlayerStatFields(
      id: (l$id as String),
      gameStatsId: (l$gameStatsId as String),
      userId: (l$userId as String),
      points: (l$points as int?),
      assists: (l$assists as int?),
      rebounds: (l$rebounds as int?),
      minutesPlayed: (l$minutesPlayed as int?),
      stats: (l$stats as Map<String, dynamic>),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String gameStatsId;

  final String userId;

  @Deprecated('Use stats JSON instead')
  final int? points;

  @Deprecated('Use stats JSON instead')
  final int? assists;

  @Deprecated('Use stats JSON instead')
  final int? rebounds;

  @Deprecated('Use stats JSON instead')
  final int? minutesPlayed;

  final Map<String, dynamic> stats;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$gameStatsId = gameStatsId;
    _resultData['gameStatsId'] = l$gameStatsId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$points = points;
    _resultData['points'] = l$points;
    final l$assists = assists;
    _resultData['assists'] = l$assists;
    final l$rebounds = rebounds;
    _resultData['rebounds'] = l$rebounds;
    final l$minutesPlayed = minutesPlayed;
    _resultData['minutesPlayed'] = l$minutesPlayed;
    final l$stats = stats;
    _resultData['stats'] = l$stats;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$gameStatsId = gameStatsId;
    final l$userId = userId;
    final l$points = points;
    final l$assists = assists;
    final l$rebounds = rebounds;
    final l$minutesPlayed = minutesPlayed;
    final l$stats = stats;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$gameStatsId,
      l$userId,
      l$points,
      l$assists,
      l$rebounds,
      l$minutesPlayed,
      l$stats,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$PlayerStatFields ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$gameStatsId = gameStatsId;
    final lOther$gameStatsId = other.gameStatsId;
    if (l$gameStatsId != lOther$gameStatsId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$points = points;
    final lOther$points = other.points;
    if (l$points != lOther$points) {
      return false;
    }
    final l$assists = assists;
    final lOther$assists = other.assists;
    if (l$assists != lOther$assists) {
      return false;
    }
    final l$rebounds = rebounds;
    final lOther$rebounds = other.rebounds;
    if (l$rebounds != lOther$rebounds) {
      return false;
    }
    final l$minutesPlayed = minutesPlayed;
    final lOther$minutesPlayed = other.minutesPlayed;
    if (l$minutesPlayed != lOther$minutesPlayed) {
      return false;
    }
    final l$stats = stats;
    final lOther$stats = other.stats;
    if (l$stats != lOther$stats) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$PlayerStatFields
    on Fragment$PlayerStatFields {
  CopyWith$Fragment$PlayerStatFields<Fragment$PlayerStatFields> get copyWith =>
      CopyWith$Fragment$PlayerStatFields(this, (i) => i);
}

abstract class CopyWith$Fragment$PlayerStatFields<TRes> {
  factory CopyWith$Fragment$PlayerStatFields(
    Fragment$PlayerStatFields instance,
    TRes Function(Fragment$PlayerStatFields) then,
  ) = _CopyWithImpl$Fragment$PlayerStatFields;

  factory CopyWith$Fragment$PlayerStatFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$PlayerStatFields;

  TRes call({
    String? id,
    String? gameStatsId,
    String? userId,
    int? points,
    int? assists,
    int? rebounds,
    int? minutesPlayed,
    Map<String, dynamic>? stats,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$PlayerStatFields<TRes>
    implements CopyWith$Fragment$PlayerStatFields<TRes> {
  _CopyWithImpl$Fragment$PlayerStatFields(this._instance, this._then);

  final Fragment$PlayerStatFields _instance;

  final TRes Function(Fragment$PlayerStatFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? gameStatsId = _undefined,
    Object? userId = _undefined,
    Object? points = _undefined,
    Object? assists = _undefined,
    Object? rebounds = _undefined,
    Object? minutesPlayed = _undefined,
    Object? stats = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$PlayerStatFields(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      gameStatsId: gameStatsId == _undefined || gameStatsId == null
          ? _instance.gameStatsId
          : (gameStatsId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      points: points == _undefined ? _instance.points : (points as int?),
      assists: assists == _undefined ? _instance.assists : (assists as int?),
      rebounds: rebounds == _undefined
          ? _instance.rebounds
          : (rebounds as int?),
      minutesPlayed: minutesPlayed == _undefined
          ? _instance.minutesPlayed
          : (minutesPlayed as int?),
      stats: stats == _undefined || stats == null
          ? _instance.stats
          : (stats as Map<String, dynamic>),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Fragment$PlayerStatFields<TRes>
    implements CopyWith$Fragment$PlayerStatFields<TRes> {
  _CopyWithStubImpl$Fragment$PlayerStatFields(this._res);

  TRes _res;

  call({
    String? id,
    String? gameStatsId,
    String? userId,
    int? points,
    int? assists,
    int? rebounds,
    int? minutesPlayed,
    Map<String, dynamic>? stats,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? $__typename,
  }) => _res;
}

const fragmentDefinitionPlayerStatFields = FragmentDefinitionNode(
  name: NameNode(value: 'PlayerStatFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'PlayerStat'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'gameStatsId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'userId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'assists'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'rebounds'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'minutesPlayed'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'stats'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentPlayerStatFields = DocumentNode(
  definitions: [fragmentDefinitionPlayerStatFields],
);

extension ClientExtension$Fragment$PlayerStatFields on graphql.GraphQLClient {
  void writeFragment$PlayerStatFields({
    required Fragment$PlayerStatFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'PlayerStatFields',
        document: documentNodeFragmentPlayerStatFields,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$PlayerStatFields? readFragment$PlayerStatFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'PlayerStatFields',
          document: documentNodeFragmentPlayerStatFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$PlayerStatFields.fromJson(result);
  }
}

class Fragment$GameStatFields {
  Fragment$GameStatFields({
    required this.id,
    required this.eventId,
    required this.teamId,
    this.opponentName,
    this.finalScore,
    required this.homeScore,
    required this.awayScore,
    required this.gameStatus,
    required this.currentPeriod,
    required this.scoreOverride,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.playerStats,
    this.$__typename = 'GameStat',
  });

  factory Fragment$GameStatFields.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$eventId = json['eventId'];
    final l$teamId = json['teamId'];
    final l$opponentName = json['opponentName'];
    final l$finalScore = json['finalScore'];
    final l$homeScore = json['homeScore'];
    final l$awayScore = json['awayScore'];
    final l$gameStatus = json['gameStatus'];
    final l$currentPeriod = json['currentPeriod'];
    final l$scoreOverride = json['scoreOverride'];
    final l$notes = json['notes'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$playerStats = json['playerStats'];
    final l$$__typename = json['__typename'];
    return Fragment$GameStatFields(
      id: (l$id as String),
      eventId: (l$eventId as String),
      teamId: (l$teamId as String),
      opponentName: (l$opponentName as String?),
      finalScore: (l$finalScore as String?),
      homeScore: (l$homeScore as int),
      awayScore: (l$awayScore as int),
      gameStatus: fromJson$Enum$GameStatus((l$gameStatus as String)),
      currentPeriod: (l$currentPeriod as int),
      scoreOverride: (l$scoreOverride as bool),
      notes: (l$notes as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      playerStats: (l$playerStats as List<dynamic>?)
          ?.map(
            (e) =>
                Fragment$PlayerStatFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String eventId;

  final String teamId;

  final String? opponentName;

  @Deprecated('Use homeScore/awayScore instead')
  final String? finalScore;

  final int homeScore;

  final int awayScore;

  final Enum$GameStatus gameStatus;

  final int currentPeriod;

  final bool scoreOverride;

  final String? notes;

  final DateTime createdAt;

  final DateTime updatedAt;

  final List<Fragment$PlayerStatFields>? playerStats;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$eventId = eventId;
    _resultData['eventId'] = l$eventId;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$opponentName = opponentName;
    _resultData['opponentName'] = l$opponentName;
    final l$finalScore = finalScore;
    _resultData['finalScore'] = l$finalScore;
    final l$homeScore = homeScore;
    _resultData['homeScore'] = l$homeScore;
    final l$awayScore = awayScore;
    _resultData['awayScore'] = l$awayScore;
    final l$gameStatus = gameStatus;
    _resultData['gameStatus'] = toJson$Enum$GameStatus(l$gameStatus);
    final l$currentPeriod = currentPeriod;
    _resultData['currentPeriod'] = l$currentPeriod;
    final l$scoreOverride = scoreOverride;
    _resultData['scoreOverride'] = l$scoreOverride;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$playerStats = playerStats;
    _resultData['playerStats'] = l$playerStats?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$eventId = eventId;
    final l$teamId = teamId;
    final l$opponentName = opponentName;
    final l$finalScore = finalScore;
    final l$homeScore = homeScore;
    final l$awayScore = awayScore;
    final l$gameStatus = gameStatus;
    final l$currentPeriod = currentPeriod;
    final l$scoreOverride = scoreOverride;
    final l$notes = notes;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$playerStats = playerStats;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$eventId,
      l$teamId,
      l$opponentName,
      l$finalScore,
      l$homeScore,
      l$awayScore,
      l$gameStatus,
      l$currentPeriod,
      l$scoreOverride,
      l$notes,
      l$createdAt,
      l$updatedAt,
      l$playerStats == null
          ? null
          : Object.hashAll(l$playerStats.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$GameStatFields || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$opponentName = opponentName;
    final lOther$opponentName = other.opponentName;
    if (l$opponentName != lOther$opponentName) {
      return false;
    }
    final l$finalScore = finalScore;
    final lOther$finalScore = other.finalScore;
    if (l$finalScore != lOther$finalScore) {
      return false;
    }
    final l$homeScore = homeScore;
    final lOther$homeScore = other.homeScore;
    if (l$homeScore != lOther$homeScore) {
      return false;
    }
    final l$awayScore = awayScore;
    final lOther$awayScore = other.awayScore;
    if (l$awayScore != lOther$awayScore) {
      return false;
    }
    final l$gameStatus = gameStatus;
    final lOther$gameStatus = other.gameStatus;
    if (l$gameStatus != lOther$gameStatus) {
      return false;
    }
    final l$currentPeriod = currentPeriod;
    final lOther$currentPeriod = other.currentPeriod;
    if (l$currentPeriod != lOther$currentPeriod) {
      return false;
    }
    final l$scoreOverride = scoreOverride;
    final lOther$scoreOverride = other.scoreOverride;
    if (l$scoreOverride != lOther$scoreOverride) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$playerStats = playerStats;
    final lOther$playerStats = other.playerStats;
    if (l$playerStats != null && lOther$playerStats != null) {
      if (l$playerStats.length != lOther$playerStats.length) {
        return false;
      }
      for (int i = 0; i < l$playerStats.length; i++) {
        final l$playerStats$entry = l$playerStats[i];
        final lOther$playerStats$entry = lOther$playerStats[i];
        if (l$playerStats$entry != lOther$playerStats$entry) {
          return false;
        }
      }
    } else if (l$playerStats != lOther$playerStats) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GameStatFields on Fragment$GameStatFields {
  CopyWith$Fragment$GameStatFields<Fragment$GameStatFields> get copyWith =>
      CopyWith$Fragment$GameStatFields(this, (i) => i);
}

abstract class CopyWith$Fragment$GameStatFields<TRes> {
  factory CopyWith$Fragment$GameStatFields(
    Fragment$GameStatFields instance,
    TRes Function(Fragment$GameStatFields) then,
  ) = _CopyWithImpl$Fragment$GameStatFields;

  factory CopyWith$Fragment$GameStatFields.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GameStatFields;

  TRes call({
    String? id,
    String? eventId,
    String? teamId,
    String? opponentName,
    String? finalScore,
    int? homeScore,
    int? awayScore,
    Enum$GameStatus? gameStatus,
    int? currentPeriod,
    bool? scoreOverride,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Fragment$PlayerStatFields>? playerStats,
    String? $__typename,
  });
  TRes playerStats(
    Iterable<Fragment$PlayerStatFields>? Function(
      Iterable<CopyWith$Fragment$PlayerStatFields<Fragment$PlayerStatFields>>?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$GameStatFields<TRes>
    implements CopyWith$Fragment$GameStatFields<TRes> {
  _CopyWithImpl$Fragment$GameStatFields(this._instance, this._then);

  final Fragment$GameStatFields _instance;

  final TRes Function(Fragment$GameStatFields) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? eventId = _undefined,
    Object? teamId = _undefined,
    Object? opponentName = _undefined,
    Object? finalScore = _undefined,
    Object? homeScore = _undefined,
    Object? awayScore = _undefined,
    Object? gameStatus = _undefined,
    Object? currentPeriod = _undefined,
    Object? scoreOverride = _undefined,
    Object? notes = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? playerStats = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Fragment$GameStatFields(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      eventId: eventId == _undefined || eventId == null
          ? _instance.eventId
          : (eventId as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      opponentName: opponentName == _undefined
          ? _instance.opponentName
          : (opponentName as String?),
      finalScore: finalScore == _undefined
          ? _instance.finalScore
          : (finalScore as String?),
      homeScore: homeScore == _undefined || homeScore == null
          ? _instance.homeScore
          : (homeScore as int),
      awayScore: awayScore == _undefined || awayScore == null
          ? _instance.awayScore
          : (awayScore as int),
      gameStatus: gameStatus == _undefined || gameStatus == null
          ? _instance.gameStatus
          : (gameStatus as Enum$GameStatus),
      currentPeriod: currentPeriod == _undefined || currentPeriod == null
          ? _instance.currentPeriod
          : (currentPeriod as int),
      scoreOverride: scoreOverride == _undefined || scoreOverride == null
          ? _instance.scoreOverride
          : (scoreOverride as bool),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      playerStats: playerStats == _undefined
          ? _instance.playerStats
          : (playerStats as List<Fragment$PlayerStatFields>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes playerStats(
    Iterable<Fragment$PlayerStatFields>? Function(
      Iterable<CopyWith$Fragment$PlayerStatFields<Fragment$PlayerStatFields>>?,
    )
    _fn,
  ) => call(
    playerStats: _fn(
      _instance.playerStats?.map(
        (e) => CopyWith$Fragment$PlayerStatFields(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$GameStatFields<TRes>
    implements CopyWith$Fragment$GameStatFields<TRes> {
  _CopyWithStubImpl$Fragment$GameStatFields(this._res);

  TRes _res;

  call({
    String? id,
    String? eventId,
    String? teamId,
    String? opponentName,
    String? finalScore,
    int? homeScore,
    int? awayScore,
    Enum$GameStatus? gameStatus,
    int? currentPeriod,
    bool? scoreOverride,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Fragment$PlayerStatFields>? playerStats,
    String? $__typename,
  }) => _res;

  playerStats(_fn) => _res;
}

const fragmentDefinitionGameStatFields = FragmentDefinitionNode(
  name: NameNode(value: 'GameStatFields'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'GameStat'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'eventId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'teamId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'opponentName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'finalScore'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'homeScore'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'awayScore'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'gameStatus'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currentPeriod'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'scoreOverride'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'notes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'playerStats'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FragmentSpreadNode(
              name: NameNode(value: 'PlayerStatFields'),
              directives: [],
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentGameStatFields = DocumentNode(
  definitions: [
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
  ],
);

extension ClientExtension$Fragment$GameStatFields on graphql.GraphQLClient {
  void writeFragment$GameStatFields({
    required Fragment$GameStatFields data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'GameStatFields',
        document: documentNodeFragmentGameStatFields,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$GameStatFields? readFragment$GameStatFields({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GameStatFields',
          document: documentNodeFragmentGameStatFields,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$GameStatFields.fromJson(result);
  }
}

class Fragment$GameStatWithPlays implements Fragment$GameStatFields {
  Fragment$GameStatWithPlays({
    required this.id,
    required this.eventId,
    required this.teamId,
    this.opponentName,
    this.finalScore,
    required this.homeScore,
    required this.awayScore,
    required this.gameStatus,
    required this.currentPeriod,
    required this.scoreOverride,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.playerStats,
    this.$__typename = 'GameStat',
    this.plays,
  });

  factory Fragment$GameStatWithPlays.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$eventId = json['eventId'];
    final l$teamId = json['teamId'];
    final l$opponentName = json['opponentName'];
    final l$finalScore = json['finalScore'];
    final l$homeScore = json['homeScore'];
    final l$awayScore = json['awayScore'];
    final l$gameStatus = json['gameStatus'];
    final l$currentPeriod = json['currentPeriod'];
    final l$scoreOverride = json['scoreOverride'];
    final l$notes = json['notes'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$playerStats = json['playerStats'];
    final l$$__typename = json['__typename'];
    final l$plays = json['plays'];
    return Fragment$GameStatWithPlays(
      id: (l$id as String),
      eventId: (l$eventId as String),
      teamId: (l$teamId as String),
      opponentName: (l$opponentName as String?),
      finalScore: (l$finalScore as String?),
      homeScore: (l$homeScore as int),
      awayScore: (l$awayScore as int),
      gameStatus: fromJson$Enum$GameStatus((l$gameStatus as String)),
      currentPeriod: (l$currentPeriod as int),
      scoreOverride: (l$scoreOverride as bool),
      notes: (l$notes as String?),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      playerStats: (l$playerStats as List<dynamic>?)
          ?.map(
            (e) =>
                Fragment$PlayerStatFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
      plays: (l$plays as List<dynamic>?)
          ?.map(
            (e) =>
                Fragment$GamePlayFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
    );
  }

  final String id;

  final String eventId;

  final String teamId;

  final String? opponentName;

  @Deprecated('Use homeScore/awayScore instead')
  final String? finalScore;

  final int homeScore;

  final int awayScore;

  final Enum$GameStatus gameStatus;

  final int currentPeriod;

  final bool scoreOverride;

  final String? notes;

  final DateTime createdAt;

  final DateTime updatedAt;

  final List<Fragment$PlayerStatFields>? playerStats;

  final String $__typename;

  final List<Fragment$GamePlayFields>? plays;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$eventId = eventId;
    _resultData['eventId'] = l$eventId;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$opponentName = opponentName;
    _resultData['opponentName'] = l$opponentName;
    final l$finalScore = finalScore;
    _resultData['finalScore'] = l$finalScore;
    final l$homeScore = homeScore;
    _resultData['homeScore'] = l$homeScore;
    final l$awayScore = awayScore;
    _resultData['awayScore'] = l$awayScore;
    final l$gameStatus = gameStatus;
    _resultData['gameStatus'] = toJson$Enum$GameStatus(l$gameStatus);
    final l$currentPeriod = currentPeriod;
    _resultData['currentPeriod'] = l$currentPeriod;
    final l$scoreOverride = scoreOverride;
    _resultData['scoreOverride'] = l$scoreOverride;
    final l$notes = notes;
    _resultData['notes'] = l$notes;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$playerStats = playerStats;
    _resultData['playerStats'] = l$playerStats?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    final l$plays = plays;
    _resultData['plays'] = l$plays?.map((e) => e.toJson()).toList();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$eventId = eventId;
    final l$teamId = teamId;
    final l$opponentName = opponentName;
    final l$finalScore = finalScore;
    final l$homeScore = homeScore;
    final l$awayScore = awayScore;
    final l$gameStatus = gameStatus;
    final l$currentPeriod = currentPeriod;
    final l$scoreOverride = scoreOverride;
    final l$notes = notes;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$playerStats = playerStats;
    final l$$__typename = $__typename;
    final l$plays = plays;
    return Object.hashAll([
      l$id,
      l$eventId,
      l$teamId,
      l$opponentName,
      l$finalScore,
      l$homeScore,
      l$awayScore,
      l$gameStatus,
      l$currentPeriod,
      l$scoreOverride,
      l$notes,
      l$createdAt,
      l$updatedAt,
      l$playerStats == null
          ? null
          : Object.hashAll(l$playerStats.map((v) => v)),
      l$$__typename,
      l$plays == null ? null : Object.hashAll(l$plays.map((v) => v)),
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Fragment$GameStatWithPlays ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$opponentName = opponentName;
    final lOther$opponentName = other.opponentName;
    if (l$opponentName != lOther$opponentName) {
      return false;
    }
    final l$finalScore = finalScore;
    final lOther$finalScore = other.finalScore;
    if (l$finalScore != lOther$finalScore) {
      return false;
    }
    final l$homeScore = homeScore;
    final lOther$homeScore = other.homeScore;
    if (l$homeScore != lOther$homeScore) {
      return false;
    }
    final l$awayScore = awayScore;
    final lOther$awayScore = other.awayScore;
    if (l$awayScore != lOther$awayScore) {
      return false;
    }
    final l$gameStatus = gameStatus;
    final lOther$gameStatus = other.gameStatus;
    if (l$gameStatus != lOther$gameStatus) {
      return false;
    }
    final l$currentPeriod = currentPeriod;
    final lOther$currentPeriod = other.currentPeriod;
    if (l$currentPeriod != lOther$currentPeriod) {
      return false;
    }
    final l$scoreOverride = scoreOverride;
    final lOther$scoreOverride = other.scoreOverride;
    if (l$scoreOverride != lOther$scoreOverride) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$playerStats = playerStats;
    final lOther$playerStats = other.playerStats;
    if (l$playerStats != null && lOther$playerStats != null) {
      if (l$playerStats.length != lOther$playerStats.length) {
        return false;
      }
      for (int i = 0; i < l$playerStats.length; i++) {
        final l$playerStats$entry = l$playerStats[i];
        final lOther$playerStats$entry = lOther$playerStats[i];
        if (l$playerStats$entry != lOther$playerStats$entry) {
          return false;
        }
      }
    } else if (l$playerStats != lOther$playerStats) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$plays = plays;
    final lOther$plays = other.plays;
    if (l$plays != null && lOther$plays != null) {
      if (l$plays.length != lOther$plays.length) {
        return false;
      }
      for (int i = 0; i < l$plays.length; i++) {
        final l$plays$entry = l$plays[i];
        final lOther$plays$entry = lOther$plays[i];
        if (l$plays$entry != lOther$plays$entry) {
          return false;
        }
      }
    } else if (l$plays != lOther$plays) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$GameStatWithPlays
    on Fragment$GameStatWithPlays {
  CopyWith$Fragment$GameStatWithPlays<Fragment$GameStatWithPlays>
  get copyWith => CopyWith$Fragment$GameStatWithPlays(this, (i) => i);
}

abstract class CopyWith$Fragment$GameStatWithPlays<TRes> {
  factory CopyWith$Fragment$GameStatWithPlays(
    Fragment$GameStatWithPlays instance,
    TRes Function(Fragment$GameStatWithPlays) then,
  ) = _CopyWithImpl$Fragment$GameStatWithPlays;

  factory CopyWith$Fragment$GameStatWithPlays.stub(TRes res) =
      _CopyWithStubImpl$Fragment$GameStatWithPlays;

  TRes call({
    String? id,
    String? eventId,
    String? teamId,
    String? opponentName,
    String? finalScore,
    int? homeScore,
    int? awayScore,
    Enum$GameStatus? gameStatus,
    int? currentPeriod,
    bool? scoreOverride,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Fragment$PlayerStatFields>? playerStats,
    String? $__typename,
    List<Fragment$GamePlayFields>? plays,
  });
  TRes playerStats(
    Iterable<Fragment$PlayerStatFields>? Function(
      Iterable<CopyWith$Fragment$PlayerStatFields<Fragment$PlayerStatFields>>?,
    )
    _fn,
  );
  TRes plays(
    Iterable<Fragment$GamePlayFields>? Function(
      Iterable<CopyWith$Fragment$GamePlayFields<Fragment$GamePlayFields>>?,
    )
    _fn,
  );
}

class _CopyWithImpl$Fragment$GameStatWithPlays<TRes>
    implements CopyWith$Fragment$GameStatWithPlays<TRes> {
  _CopyWithImpl$Fragment$GameStatWithPlays(this._instance, this._then);

  final Fragment$GameStatWithPlays _instance;

  final TRes Function(Fragment$GameStatWithPlays) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? eventId = _undefined,
    Object? teamId = _undefined,
    Object? opponentName = _undefined,
    Object? finalScore = _undefined,
    Object? homeScore = _undefined,
    Object? awayScore = _undefined,
    Object? gameStatus = _undefined,
    Object? currentPeriod = _undefined,
    Object? scoreOverride = _undefined,
    Object? notes = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? playerStats = _undefined,
    Object? $__typename = _undefined,
    Object? plays = _undefined,
  }) => _then(
    Fragment$GameStatWithPlays(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      eventId: eventId == _undefined || eventId == null
          ? _instance.eventId
          : (eventId as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      opponentName: opponentName == _undefined
          ? _instance.opponentName
          : (opponentName as String?),
      finalScore: finalScore == _undefined
          ? _instance.finalScore
          : (finalScore as String?),
      homeScore: homeScore == _undefined || homeScore == null
          ? _instance.homeScore
          : (homeScore as int),
      awayScore: awayScore == _undefined || awayScore == null
          ? _instance.awayScore
          : (awayScore as int),
      gameStatus: gameStatus == _undefined || gameStatus == null
          ? _instance.gameStatus
          : (gameStatus as Enum$GameStatus),
      currentPeriod: currentPeriod == _undefined || currentPeriod == null
          ? _instance.currentPeriod
          : (currentPeriod as int),
      scoreOverride: scoreOverride == _undefined || scoreOverride == null
          ? _instance.scoreOverride
          : (scoreOverride as bool),
      notes: notes == _undefined ? _instance.notes : (notes as String?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      playerStats: playerStats == _undefined
          ? _instance.playerStats
          : (playerStats as List<Fragment$PlayerStatFields>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
      plays: plays == _undefined
          ? _instance.plays
          : (plays as List<Fragment$GamePlayFields>?),
    ),
  );

  TRes playerStats(
    Iterable<Fragment$PlayerStatFields>? Function(
      Iterable<CopyWith$Fragment$PlayerStatFields<Fragment$PlayerStatFields>>?,
    )
    _fn,
  ) => call(
    playerStats: _fn(
      _instance.playerStats?.map(
        (e) => CopyWith$Fragment$PlayerStatFields(e, (i) => i),
      ),
    )?.toList(),
  );

  TRes plays(
    Iterable<Fragment$GamePlayFields>? Function(
      Iterable<CopyWith$Fragment$GamePlayFields<Fragment$GamePlayFields>>?,
    )
    _fn,
  ) => call(
    plays: _fn(
      _instance.plays?.map(
        (e) => CopyWith$Fragment$GamePlayFields(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Fragment$GameStatWithPlays<TRes>
    implements CopyWith$Fragment$GameStatWithPlays<TRes> {
  _CopyWithStubImpl$Fragment$GameStatWithPlays(this._res);

  TRes _res;

  call({
    String? id,
    String? eventId,
    String? teamId,
    String? opponentName,
    String? finalScore,
    int? homeScore,
    int? awayScore,
    Enum$GameStatus? gameStatus,
    int? currentPeriod,
    bool? scoreOverride,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Fragment$PlayerStatFields>? playerStats,
    String? $__typename,
    List<Fragment$GamePlayFields>? plays,
  }) => _res;

  playerStats(_fn) => _res;

  plays(_fn) => _res;
}

const fragmentDefinitionGameStatWithPlays = FragmentDefinitionNode(
  name: NameNode(value: 'GameStatWithPlays'),
  typeCondition: TypeConditionNode(
    on: NamedTypeNode(name: NameNode(value: 'GameStat'), isNonNull: false),
  ),
  directives: [],
  selectionSet: SelectionSetNode(
    selections: [
      FragmentSpreadNode(
        name: NameNode(value: 'GameStatFields'),
        directives: [],
      ),
      FieldNode(
        name: NameNode(value: 'plays'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(
          selections: [
            FragmentSpreadNode(
              name: NameNode(value: 'GamePlayFields'),
              directives: [],
            ),
            FieldNode(
              name: NameNode(value: '__typename'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ],
        ),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ],
  ),
);
const documentNodeFragmentGameStatWithPlays = DocumentNode(
  definitions: [
    fragmentDefinitionGameStatWithPlays,
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
    fragmentDefinitionGamePlayFields,
  ],
);

extension ClientExtension$Fragment$GameStatWithPlays on graphql.GraphQLClient {
  void writeFragment$GameStatWithPlays({
    required Fragment$GameStatWithPlays data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) => this.writeFragment(
    graphql.FragmentRequest(
      idFields: idFields,
      fragment: const graphql.Fragment(
        fragmentName: 'GameStatWithPlays',
        document: documentNodeFragmentGameStatWithPlays,
      ),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Fragment$GameStatWithPlays? readFragment$GameStatWithPlays({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'GameStatWithPlays',
          document: documentNodeFragmentGameStatWithPlays,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$GameStatWithPlays.fromJson(result);
  }
}

class Variables$Query$GetGameStats {
  factory Variables$Query$GetGameStats({required String eventId}) =>
      Variables$Query$GetGameStats._({r'eventId': eventId});

  Variables$Query$GetGameStats._(this._$data);

  factory Variables$Query$GetGameStats.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    return Variables$Query$GetGameStats._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    return result$data;
  }

  CopyWith$Variables$Query$GetGameStats<Variables$Query$GetGameStats>
  get copyWith => CopyWith$Variables$Query$GetGameStats(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetGameStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    return Object.hashAll([l$eventId]);
  }
}

abstract class CopyWith$Variables$Query$GetGameStats<TRes> {
  factory CopyWith$Variables$Query$GetGameStats(
    Variables$Query$GetGameStats instance,
    TRes Function(Variables$Query$GetGameStats) then,
  ) = _CopyWithImpl$Variables$Query$GetGameStats;

  factory CopyWith$Variables$Query$GetGameStats.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetGameStats;

  TRes call({String? eventId});
}

class _CopyWithImpl$Variables$Query$GetGameStats<TRes>
    implements CopyWith$Variables$Query$GetGameStats<TRes> {
  _CopyWithImpl$Variables$Query$GetGameStats(this._instance, this._then);

  final Variables$Query$GetGameStats _instance;

  final TRes Function(Variables$Query$GetGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eventId = _undefined}) => _then(
    Variables$Query$GetGameStats._({
      ..._instance._$data,
      if (eventId != _undefined && eventId != null)
        'eventId': (eventId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetGameStats<TRes>
    implements CopyWith$Variables$Query$GetGameStats<TRes> {
  _CopyWithStubImpl$Variables$Query$GetGameStats(this._res);

  TRes _res;

  call({String? eventId}) => _res;
}

class Query$GetGameStats {
  Query$GetGameStats({required this.gameStats, this.$__typename = 'Query'});

  factory Query$GetGameStats.fromJson(Map<String, dynamic> json) {
    final l$gameStats = json['gameStats'];
    final l$$__typename = json['__typename'];
    return Query$GetGameStats(
      gameStats: Fragment$GameStatWithPlays.fromJson(
        (l$gameStats as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GameStatWithPlays gameStats;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gameStats = gameStats;
    _resultData['gameStats'] = l$gameStats.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gameStats = gameStats;
    final l$$__typename = $__typename;
    return Object.hashAll([l$gameStats, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetGameStats || runtimeType != other.runtimeType) {
      return false;
    }
    final l$gameStats = gameStats;
    final lOther$gameStats = other.gameStats;
    if (l$gameStats != lOther$gameStats) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetGameStats on Query$GetGameStats {
  CopyWith$Query$GetGameStats<Query$GetGameStats> get copyWith =>
      CopyWith$Query$GetGameStats(this, (i) => i);
}

abstract class CopyWith$Query$GetGameStats<TRes> {
  factory CopyWith$Query$GetGameStats(
    Query$GetGameStats instance,
    TRes Function(Query$GetGameStats) then,
  ) = _CopyWithImpl$Query$GetGameStats;

  factory CopyWith$Query$GetGameStats.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGameStats;

  TRes call({Fragment$GameStatWithPlays? gameStats, String? $__typename});
  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStats;
}

class _CopyWithImpl$Query$GetGameStats<TRes>
    implements CopyWith$Query$GetGameStats<TRes> {
  _CopyWithImpl$Query$GetGameStats(this._instance, this._then);

  final Query$GetGameStats _instance;

  final TRes Function(Query$GetGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? gameStats = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetGameStats(
      gameStats: gameStats == _undefined || gameStats == null
          ? _instance.gameStats
          : (gameStats as Fragment$GameStatWithPlays),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStats {
    final local$gameStats = _instance.gameStats;
    return CopyWith$Fragment$GameStatWithPlays(
      local$gameStats,
      (e) => call(gameStats: e),
    );
  }
}

class _CopyWithStubImpl$Query$GetGameStats<TRes>
    implements CopyWith$Query$GetGameStats<TRes> {
  _CopyWithStubImpl$Query$GetGameStats(this._res);

  TRes _res;

  call({Fragment$GameStatWithPlays? gameStats, String? $__typename}) => _res;

  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStats =>
      CopyWith$Fragment$GameStatWithPlays.stub(_res);
}

const documentNodeQueryGetGameStats = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetGameStats'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'eventId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'gameStats'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'eventId'),
                value: VariableNode(name: NameNode(value: 'eventId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatWithPlays'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatWithPlays,
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
    fragmentDefinitionGamePlayFields,
  ],
);
Query$GetGameStats _parserFn$Query$GetGameStats(Map<String, dynamic> data) =>
    Query$GetGameStats.fromJson(data);
typedef OnQueryComplete$Query$GetGameStats =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetGameStats?);

class Options$Query$GetGameStats
    extends graphql.QueryOptions<Query$GetGameStats> {
  Options$Query$GetGameStats({
    String? operationName,
    required Variables$Query$GetGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGameStats? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetGameStats? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetGameStats(data),
               ),
         onError: onError,
         document: documentNodeQueryGetGameStats,
         parserFn: _parserFn$Query$GetGameStats,
       );

  final OnQueryComplete$Query$GetGameStats? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetGameStats
    extends graphql.WatchQueryOptions<Query$GetGameStats> {
  WatchOptions$Query$GetGameStats({
    String? operationName,
    required Variables$Query$GetGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGameStats? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetGameStats,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetGameStats,
       );
}

class FetchMoreOptions$Query$GetGameStats extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetGameStats({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetGameStats variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetGameStats,
       );
}

extension ClientExtension$Query$GetGameStats on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetGameStats>> query$GetGameStats(
    Options$Query$GetGameStats options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetGameStats> watchQuery$GetGameStats(
    WatchOptions$Query$GetGameStats options,
  ) => this.watchQuery(options);

  void writeQuery$GetGameStats({
    required Query$GetGameStats data,
    required Variables$Query$GetGameStats variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetGameStats),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetGameStats? readQuery$GetGameStats({
    required Variables$Query$GetGameStats variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetGameStats),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetGameStats.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetGameStats> useQuery$GetGameStats(
  Options$Query$GetGameStats options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetGameStats> useWatchQuery$GetGameStats(
  WatchOptions$Query$GetGameStats options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetGameStats$Widget
    extends graphql_flutter.Query<Query$GetGameStats> {
  Query$GetGameStats$Widget({
    widgets.Key? key,
    required Options$Query$GetGameStats options,
    required graphql_flutter.QueryBuilder<Query$GetGameStats> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetTeamStats {
  factory Variables$Query$GetTeamStats({required String teamId}) =>
      Variables$Query$GetTeamStats._({r'teamId': teamId});

  Variables$Query$GetTeamStats._(this._$data);

  factory Variables$Query$GetTeamStats.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    return Variables$Query$GetTeamStats._(result$data);
  }

  Map<String, dynamic> _$data;

  String get teamId => (_$data['teamId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    return result$data;
  }

  CopyWith$Variables$Query$GetTeamStats<Variables$Query$GetTeamStats>
  get copyWith => CopyWith$Variables$Query$GetTeamStats(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetTeamStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$teamId = teamId;
    return Object.hashAll([l$teamId]);
  }
}

abstract class CopyWith$Variables$Query$GetTeamStats<TRes> {
  factory CopyWith$Variables$Query$GetTeamStats(
    Variables$Query$GetTeamStats instance,
    TRes Function(Variables$Query$GetTeamStats) then,
  ) = _CopyWithImpl$Variables$Query$GetTeamStats;

  factory CopyWith$Variables$Query$GetTeamStats.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetTeamStats;

  TRes call({String? teamId});
}

class _CopyWithImpl$Variables$Query$GetTeamStats<TRes>
    implements CopyWith$Variables$Query$GetTeamStats<TRes> {
  _CopyWithImpl$Variables$Query$GetTeamStats(this._instance, this._then);

  final Variables$Query$GetTeamStats _instance;

  final TRes Function(Variables$Query$GetTeamStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? teamId = _undefined}) => _then(
    Variables$Query$GetTeamStats._({
      ..._instance._$data,
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetTeamStats<TRes>
    implements CopyWith$Variables$Query$GetTeamStats<TRes> {
  _CopyWithStubImpl$Variables$Query$GetTeamStats(this._res);

  TRes _res;

  call({String? teamId}) => _res;
}

class Query$GetTeamStats {
  Query$GetTeamStats({required this.teamStats, this.$__typename = 'Query'});

  factory Query$GetTeamStats.fromJson(Map<String, dynamic> json) {
    final l$teamStats = json['teamStats'];
    final l$$__typename = json['__typename'];
    return Query$GetTeamStats(
      teamStats: (l$teamStats as List<dynamic>)
          .map(
            (e) =>
                Fragment$GameStatFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$GameStatFields> teamStats;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$teamStats = teamStats;
    _resultData['teamStats'] = l$teamStats.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$teamStats = teamStats;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$teamStats.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetTeamStats || runtimeType != other.runtimeType) {
      return false;
    }
    final l$teamStats = teamStats;
    final lOther$teamStats = other.teamStats;
    if (l$teamStats.length != lOther$teamStats.length) {
      return false;
    }
    for (int i = 0; i < l$teamStats.length; i++) {
      final l$teamStats$entry = l$teamStats[i];
      final lOther$teamStats$entry = lOther$teamStats[i];
      if (l$teamStats$entry != lOther$teamStats$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetTeamStats on Query$GetTeamStats {
  CopyWith$Query$GetTeamStats<Query$GetTeamStats> get copyWith =>
      CopyWith$Query$GetTeamStats(this, (i) => i);
}

abstract class CopyWith$Query$GetTeamStats<TRes> {
  factory CopyWith$Query$GetTeamStats(
    Query$GetTeamStats instance,
    TRes Function(Query$GetTeamStats) then,
  ) = _CopyWithImpl$Query$GetTeamStats;

  factory CopyWith$Query$GetTeamStats.stub(TRes res) =
      _CopyWithStubImpl$Query$GetTeamStats;

  TRes call({List<Fragment$GameStatFields>? teamStats, String? $__typename});
  TRes teamStats(
    Iterable<Fragment$GameStatFields> Function(
      Iterable<CopyWith$Fragment$GameStatFields<Fragment$GameStatFields>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetTeamStats<TRes>
    implements CopyWith$Query$GetTeamStats<TRes> {
  _CopyWithImpl$Query$GetTeamStats(this._instance, this._then);

  final Query$GetTeamStats _instance;

  final TRes Function(Query$GetTeamStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? teamStats = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetTeamStats(
      teamStats: teamStats == _undefined || teamStats == null
          ? _instance.teamStats
          : (teamStats as List<Fragment$GameStatFields>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes teamStats(
    Iterable<Fragment$GameStatFields> Function(
      Iterable<CopyWith$Fragment$GameStatFields<Fragment$GameStatFields>>,
    )
    _fn,
  ) => call(
    teamStats: _fn(
      _instance.teamStats.map(
        (e) => CopyWith$Fragment$GameStatFields(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetTeamStats<TRes>
    implements CopyWith$Query$GetTeamStats<TRes> {
  _CopyWithStubImpl$Query$GetTeamStats(this._res);

  TRes _res;

  call({List<Fragment$GameStatFields>? teamStats, String? $__typename}) => _res;

  teamStats(_fn) => _res;
}

const documentNodeQueryGetTeamStats = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetTeamStats'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'teamId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'teamStats'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'teamId'),
                value: VariableNode(name: NameNode(value: 'teamId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
  ],
);
Query$GetTeamStats _parserFn$Query$GetTeamStats(Map<String, dynamic> data) =>
    Query$GetTeamStats.fromJson(data);
typedef OnQueryComplete$Query$GetTeamStats =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetTeamStats?);

class Options$Query$GetTeamStats
    extends graphql.QueryOptions<Query$GetTeamStats> {
  Options$Query$GetTeamStats({
    String? operationName,
    required Variables$Query$GetTeamStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTeamStats? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetTeamStats? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetTeamStats(data),
               ),
         onError: onError,
         document: documentNodeQueryGetTeamStats,
         parserFn: _parserFn$Query$GetTeamStats,
       );

  final OnQueryComplete$Query$GetTeamStats? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetTeamStats
    extends graphql.WatchQueryOptions<Query$GetTeamStats> {
  WatchOptions$Query$GetTeamStats({
    String? operationName,
    required Variables$Query$GetTeamStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetTeamStats? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetTeamStats,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetTeamStats,
       );
}

class FetchMoreOptions$Query$GetTeamStats extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetTeamStats({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetTeamStats variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetTeamStats,
       );
}

extension ClientExtension$Query$GetTeamStats on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetTeamStats>> query$GetTeamStats(
    Options$Query$GetTeamStats options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetTeamStats> watchQuery$GetTeamStats(
    WatchOptions$Query$GetTeamStats options,
  ) => this.watchQuery(options);

  void writeQuery$GetTeamStats({
    required Query$GetTeamStats data,
    required Variables$Query$GetTeamStats variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetTeamStats),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetTeamStats? readQuery$GetTeamStats({
    required Variables$Query$GetTeamStats variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetTeamStats),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetTeamStats.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetTeamStats> useQuery$GetTeamStats(
  Options$Query$GetTeamStats options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetTeamStats> useWatchQuery$GetTeamStats(
  WatchOptions$Query$GetTeamStats options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetTeamStats$Widget
    extends graphql_flutter.Query<Query$GetTeamStats> {
  Query$GetTeamStats$Widget({
    widgets.Key? key,
    required Options$Query$GetTeamStats options,
    required graphql_flutter.QueryBuilder<Query$GetTeamStats> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Query$GetGamePlays {
  factory Variables$Query$GetGamePlays({required String gameStatsId}) =>
      Variables$Query$GetGamePlays._({r'gameStatsId': gameStatsId});

  Variables$Query$GetGamePlays._(this._$data);

  factory Variables$Query$GetGamePlays.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$gameStatsId = data['gameStatsId'];
    result$data['gameStatsId'] = (l$gameStatsId as String);
    return Variables$Query$GetGamePlays._(result$data);
  }

  Map<String, dynamic> _$data;

  String get gameStatsId => (_$data['gameStatsId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$gameStatsId = gameStatsId;
    result$data['gameStatsId'] = l$gameStatsId;
    return result$data;
  }

  CopyWith$Variables$Query$GetGamePlays<Variables$Query$GetGamePlays>
  get copyWith => CopyWith$Variables$Query$GetGamePlays(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetGamePlays ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gameStatsId = gameStatsId;
    final lOther$gameStatsId = other.gameStatsId;
    if (l$gameStatsId != lOther$gameStatsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$gameStatsId = gameStatsId;
    return Object.hashAll([l$gameStatsId]);
  }
}

abstract class CopyWith$Variables$Query$GetGamePlays<TRes> {
  factory CopyWith$Variables$Query$GetGamePlays(
    Variables$Query$GetGamePlays instance,
    TRes Function(Variables$Query$GetGamePlays) then,
  ) = _CopyWithImpl$Variables$Query$GetGamePlays;

  factory CopyWith$Variables$Query$GetGamePlays.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetGamePlays;

  TRes call({String? gameStatsId});
}

class _CopyWithImpl$Variables$Query$GetGamePlays<TRes>
    implements CopyWith$Variables$Query$GetGamePlays<TRes> {
  _CopyWithImpl$Variables$Query$GetGamePlays(this._instance, this._then);

  final Variables$Query$GetGamePlays _instance;

  final TRes Function(Variables$Query$GetGamePlays) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? gameStatsId = _undefined}) => _then(
    Variables$Query$GetGamePlays._({
      ..._instance._$data,
      if (gameStatsId != _undefined && gameStatsId != null)
        'gameStatsId': (gameStatsId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetGamePlays<TRes>
    implements CopyWith$Variables$Query$GetGamePlays<TRes> {
  _CopyWithStubImpl$Variables$Query$GetGamePlays(this._res);

  TRes _res;

  call({String? gameStatsId}) => _res;
}

class Query$GetGamePlays {
  Query$GetGamePlays({required this.gamePlays, this.$__typename = 'Query'});

  factory Query$GetGamePlays.fromJson(Map<String, dynamic> json) {
    final l$gamePlays = json['gamePlays'];
    final l$$__typename = json['__typename'];
    return Query$GetGamePlays(
      gamePlays: (l$gamePlays as List<dynamic>)
          .map(
            (e) =>
                Fragment$GamePlayFields.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$GamePlayFields> gamePlays;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gamePlays = gamePlays;
    _resultData['gamePlays'] = l$gamePlays.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gamePlays = gamePlays;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$gamePlays.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetGamePlays || runtimeType != other.runtimeType) {
      return false;
    }
    final l$gamePlays = gamePlays;
    final lOther$gamePlays = other.gamePlays;
    if (l$gamePlays.length != lOther$gamePlays.length) {
      return false;
    }
    for (int i = 0; i < l$gamePlays.length; i++) {
      final l$gamePlays$entry = l$gamePlays[i];
      final lOther$gamePlays$entry = lOther$gamePlays[i];
      if (l$gamePlays$entry != lOther$gamePlays$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetGamePlays on Query$GetGamePlays {
  CopyWith$Query$GetGamePlays<Query$GetGamePlays> get copyWith =>
      CopyWith$Query$GetGamePlays(this, (i) => i);
}

abstract class CopyWith$Query$GetGamePlays<TRes> {
  factory CopyWith$Query$GetGamePlays(
    Query$GetGamePlays instance,
    TRes Function(Query$GetGamePlays) then,
  ) = _CopyWithImpl$Query$GetGamePlays;

  factory CopyWith$Query$GetGamePlays.stub(TRes res) =
      _CopyWithStubImpl$Query$GetGamePlays;

  TRes call({List<Fragment$GamePlayFields>? gamePlays, String? $__typename});
  TRes gamePlays(
    Iterable<Fragment$GamePlayFields> Function(
      Iterable<CopyWith$Fragment$GamePlayFields<Fragment$GamePlayFields>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetGamePlays<TRes>
    implements CopyWith$Query$GetGamePlays<TRes> {
  _CopyWithImpl$Query$GetGamePlays(this._instance, this._then);

  final Query$GetGamePlays _instance;

  final TRes Function(Query$GetGamePlays) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? gamePlays = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetGamePlays(
      gamePlays: gamePlays == _undefined || gamePlays == null
          ? _instance.gamePlays
          : (gamePlays as List<Fragment$GamePlayFields>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes gamePlays(
    Iterable<Fragment$GamePlayFields> Function(
      Iterable<CopyWith$Fragment$GamePlayFields<Fragment$GamePlayFields>>,
    )
    _fn,
  ) => call(
    gamePlays: _fn(
      _instance.gamePlays.map(
        (e) => CopyWith$Fragment$GamePlayFields(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetGamePlays<TRes>
    implements CopyWith$Query$GetGamePlays<TRes> {
  _CopyWithStubImpl$Query$GetGamePlays(this._res);

  TRes _res;

  call({List<Fragment$GamePlayFields>? gamePlays, String? $__typename}) => _res;

  gamePlays(_fn) => _res;
}

const documentNodeQueryGetGamePlays = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetGamePlays'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'gameStatsId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'gamePlays'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'gameStatsId'),
                value: VariableNode(name: NameNode(value: 'gameStatsId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GamePlayFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGamePlayFields,
  ],
);
Query$GetGamePlays _parserFn$Query$GetGamePlays(Map<String, dynamic> data) =>
    Query$GetGamePlays.fromJson(data);
typedef OnQueryComplete$Query$GetGamePlays =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetGamePlays?);

class Options$Query$GetGamePlays
    extends graphql.QueryOptions<Query$GetGamePlays> {
  Options$Query$GetGamePlays({
    String? operationName,
    required Variables$Query$GetGamePlays variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGamePlays? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetGamePlays? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         pollInterval: pollInterval,
         context: context,
         onComplete: onComplete == null
             ? null
             : (data) => onComplete(
                 data,
                 data == null ? null : _parserFn$Query$GetGamePlays(data),
               ),
         onError: onError,
         document: documentNodeQueryGetGamePlays,
         parserFn: _parserFn$Query$GetGamePlays,
       );

  final OnQueryComplete$Query$GetGamePlays? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetGamePlays
    extends graphql.WatchQueryOptions<Query$GetGamePlays> {
  WatchOptions$Query$GetGamePlays({
    String? operationName,
    required Variables$Query$GetGamePlays variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetGamePlays? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetGamePlays,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetGamePlays,
       );
}

class FetchMoreOptions$Query$GetGamePlays extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetGamePlays({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetGamePlays variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetGamePlays,
       );
}

extension ClientExtension$Query$GetGamePlays on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetGamePlays>> query$GetGamePlays(
    Options$Query$GetGamePlays options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetGamePlays> watchQuery$GetGamePlays(
    WatchOptions$Query$GetGamePlays options,
  ) => this.watchQuery(options);

  void writeQuery$GetGamePlays({
    required Query$GetGamePlays data,
    required Variables$Query$GetGamePlays variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetGamePlays),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetGamePlays? readQuery$GetGamePlays({
    required Variables$Query$GetGamePlays variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetGamePlays),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetGamePlays.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetGamePlays> useQuery$GetGamePlays(
  Options$Query$GetGamePlays options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetGamePlays> useWatchQuery$GetGamePlays(
  WatchOptions$Query$GetGamePlays options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetGamePlays$Widget
    extends graphql_flutter.Query<Query$GetGamePlays> {
  Query$GetGamePlays$Widget({
    widgets.Key? key,
    required Options$Query$GetGamePlays options,
    required graphql_flutter.QueryBuilder<Query$GetGamePlays> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Variables$Mutation$RecordGameStats {
  factory Variables$Mutation$RecordGameStats({
    required Input$RecordGameStatsInput input,
  }) => Variables$Mutation$RecordGameStats._({r'input': input});

  Variables$Mutation$RecordGameStats._(this._$data);

  factory Variables$Mutation$RecordGameStats.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$RecordGameStatsInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$RecordGameStats._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RecordGameStatsInput get input =>
      (_$data['input'] as Input$RecordGameStatsInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$RecordGameStats<
    Variables$Mutation$RecordGameStats
  >
  get copyWith => CopyWith$Variables$Mutation$RecordGameStats(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RecordGameStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$RecordGameStats<TRes> {
  factory CopyWith$Variables$Mutation$RecordGameStats(
    Variables$Mutation$RecordGameStats instance,
    TRes Function(Variables$Mutation$RecordGameStats) then,
  ) = _CopyWithImpl$Variables$Mutation$RecordGameStats;

  factory CopyWith$Variables$Mutation$RecordGameStats.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RecordGameStats;

  TRes call({Input$RecordGameStatsInput? input});
}

class _CopyWithImpl$Variables$Mutation$RecordGameStats<TRes>
    implements CopyWith$Variables$Mutation$RecordGameStats<TRes> {
  _CopyWithImpl$Variables$Mutation$RecordGameStats(this._instance, this._then);

  final Variables$Mutation$RecordGameStats _instance;

  final TRes Function(Variables$Mutation$RecordGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$RecordGameStats._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$RecordGameStatsInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$RecordGameStats<TRes>
    implements CopyWith$Variables$Mutation$RecordGameStats<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RecordGameStats(this._res);

  TRes _res;

  call({Input$RecordGameStatsInput? input}) => _res;
}

class Mutation$RecordGameStats {
  Mutation$RecordGameStats({
    required this.recordGameStats,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RecordGameStats.fromJson(Map<String, dynamic> json) {
    final l$recordGameStats = json['recordGameStats'];
    final l$$__typename = json['__typename'];
    return Mutation$RecordGameStats(
      recordGameStats: Fragment$GameStatFields.fromJson(
        (l$recordGameStats as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GameStatFields recordGameStats;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordGameStats = recordGameStats;
    _resultData['recordGameStats'] = l$recordGameStats.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordGameStats = recordGameStats;
    final l$$__typename = $__typename;
    return Object.hashAll([l$recordGameStats, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RecordGameStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordGameStats = recordGameStats;
    final lOther$recordGameStats = other.recordGameStats;
    if (l$recordGameStats != lOther$recordGameStats) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$RecordGameStats
    on Mutation$RecordGameStats {
  CopyWith$Mutation$RecordGameStats<Mutation$RecordGameStats> get copyWith =>
      CopyWith$Mutation$RecordGameStats(this, (i) => i);
}

abstract class CopyWith$Mutation$RecordGameStats<TRes> {
  factory CopyWith$Mutation$RecordGameStats(
    Mutation$RecordGameStats instance,
    TRes Function(Mutation$RecordGameStats) then,
  ) = _CopyWithImpl$Mutation$RecordGameStats;

  factory CopyWith$Mutation$RecordGameStats.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RecordGameStats;

  TRes call({Fragment$GameStatFields? recordGameStats, String? $__typename});
  CopyWith$Fragment$GameStatFields<TRes> get recordGameStats;
}

class _CopyWithImpl$Mutation$RecordGameStats<TRes>
    implements CopyWith$Mutation$RecordGameStats<TRes> {
  _CopyWithImpl$Mutation$RecordGameStats(this._instance, this._then);

  final Mutation$RecordGameStats _instance;

  final TRes Function(Mutation$RecordGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordGameStats = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RecordGameStats(
      recordGameStats: recordGameStats == _undefined || recordGameStats == null
          ? _instance.recordGameStats
          : (recordGameStats as Fragment$GameStatFields),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GameStatFields<TRes> get recordGameStats {
    final local$recordGameStats = _instance.recordGameStats;
    return CopyWith$Fragment$GameStatFields(
      local$recordGameStats,
      (e) => call(recordGameStats: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$RecordGameStats<TRes>
    implements CopyWith$Mutation$RecordGameStats<TRes> {
  _CopyWithStubImpl$Mutation$RecordGameStats(this._res);

  TRes _res;

  call({Fragment$GameStatFields? recordGameStats, String? $__typename}) => _res;

  CopyWith$Fragment$GameStatFields<TRes> get recordGameStats =>
      CopyWith$Fragment$GameStatFields.stub(_res);
}

const documentNodeMutationRecordGameStats = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RecordGameStats'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'RecordGameStatsInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'recordGameStats'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'recordGameStatsInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
  ],
);
Mutation$RecordGameStats _parserFn$Mutation$RecordGameStats(
  Map<String, dynamic> data,
) => Mutation$RecordGameStats.fromJson(data);
typedef OnMutationCompleted$Mutation$RecordGameStats =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$RecordGameStats?);

class Options$Mutation$RecordGameStats
    extends graphql.MutationOptions<Mutation$RecordGameStats> {
  Options$Mutation$RecordGameStats({
    String? operationName,
    required Variables$Mutation$RecordGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordGameStats? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RecordGameStats? onCompleted,
    graphql.OnMutationUpdate<Mutation$RecordGameStats>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$RecordGameStats(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRecordGameStats,
         parserFn: _parserFn$Mutation$RecordGameStats,
       );

  final OnMutationCompleted$Mutation$RecordGameStats? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$RecordGameStats
    extends graphql.WatchQueryOptions<Mutation$RecordGameStats> {
  WatchOptions$Mutation$RecordGameStats({
    String? operationName,
    required Variables$Mutation$RecordGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordGameStats? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRecordGameStats,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$RecordGameStats,
       );
}

extension ClientExtension$Mutation$RecordGameStats on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RecordGameStats>> mutate$RecordGameStats(
    Options$Mutation$RecordGameStats options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$RecordGameStats>
  watchMutation$RecordGameStats(
    WatchOptions$Mutation$RecordGameStats options,
  ) => this.watchMutation(options);
}

class Mutation$RecordGameStats$HookResult {
  Mutation$RecordGameStats$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$RecordGameStats runMutation;

  final graphql.QueryResult<Mutation$RecordGameStats> result;
}

Mutation$RecordGameStats$HookResult useMutation$RecordGameStats([
  WidgetOptions$Mutation$RecordGameStats? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$RecordGameStats(),
  );
  return Mutation$RecordGameStats$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RecordGameStats>
useWatchMutation$RecordGameStats(
  WatchOptions$Mutation$RecordGameStats options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RecordGameStats
    extends graphql.MutationOptions<Mutation$RecordGameStats> {
  WidgetOptions$Mutation$RecordGameStats({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordGameStats? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RecordGameStats? onCompleted,
    graphql.OnMutationUpdate<Mutation$RecordGameStats>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$RecordGameStats(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRecordGameStats,
         parserFn: _parserFn$Mutation$RecordGameStats,
       );

  final OnMutationCompleted$Mutation$RecordGameStats? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$RecordGameStats =
    graphql.MultiSourceResult<Mutation$RecordGameStats> Function(
      Variables$Mutation$RecordGameStats, {
      Object? optimisticResult,
      Mutation$RecordGameStats? typedOptimisticResult,
    });
typedef Builder$Mutation$RecordGameStats =
    widgets.Widget Function(
      RunMutation$Mutation$RecordGameStats,
      graphql.QueryResult<Mutation$RecordGameStats>?,
    );

class Mutation$RecordGameStats$Widget
    extends graphql_flutter.Mutation<Mutation$RecordGameStats> {
  Mutation$RecordGameStats$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RecordGameStats? options,
    required Builder$Mutation$RecordGameStats builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$RecordGameStats(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$RecordPlay {
  factory Variables$Mutation$RecordPlay({
    required Input$RecordPlayInput input,
  }) => Variables$Mutation$RecordPlay._({r'input': input});

  Variables$Mutation$RecordPlay._(this._$data);

  factory Variables$Mutation$RecordPlay.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$RecordPlayInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$RecordPlay._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$RecordPlayInput get input => (_$data['input'] as Input$RecordPlayInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$RecordPlay<Variables$Mutation$RecordPlay>
  get copyWith => CopyWith$Variables$Mutation$RecordPlay(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$RecordPlay ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$RecordPlay<TRes> {
  factory CopyWith$Variables$Mutation$RecordPlay(
    Variables$Mutation$RecordPlay instance,
    TRes Function(Variables$Mutation$RecordPlay) then,
  ) = _CopyWithImpl$Variables$Mutation$RecordPlay;

  factory CopyWith$Variables$Mutation$RecordPlay.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$RecordPlay;

  TRes call({Input$RecordPlayInput? input});
}

class _CopyWithImpl$Variables$Mutation$RecordPlay<TRes>
    implements CopyWith$Variables$Mutation$RecordPlay<TRes> {
  _CopyWithImpl$Variables$Mutation$RecordPlay(this._instance, this._then);

  final Variables$Mutation$RecordPlay _instance;

  final TRes Function(Variables$Mutation$RecordPlay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$RecordPlay._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$RecordPlayInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$RecordPlay<TRes>
    implements CopyWith$Variables$Mutation$RecordPlay<TRes> {
  _CopyWithStubImpl$Variables$Mutation$RecordPlay(this._res);

  TRes _res;

  call({Input$RecordPlayInput? input}) => _res;
}

class Mutation$RecordPlay {
  Mutation$RecordPlay({
    required this.recordPlay,
    this.$__typename = 'Mutation',
  });

  factory Mutation$RecordPlay.fromJson(Map<String, dynamic> json) {
    final l$recordPlay = json['recordPlay'];
    final l$$__typename = json['__typename'];
    return Mutation$RecordPlay(
      recordPlay: Fragment$GamePlayFields.fromJson(
        (l$recordPlay as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GamePlayFields recordPlay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$recordPlay = recordPlay;
    _resultData['recordPlay'] = l$recordPlay.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$recordPlay = recordPlay;
    final l$$__typename = $__typename;
    return Object.hashAll([l$recordPlay, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$RecordPlay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$recordPlay = recordPlay;
    final lOther$recordPlay = other.recordPlay;
    if (l$recordPlay != lOther$recordPlay) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$RecordPlay on Mutation$RecordPlay {
  CopyWith$Mutation$RecordPlay<Mutation$RecordPlay> get copyWith =>
      CopyWith$Mutation$RecordPlay(this, (i) => i);
}

abstract class CopyWith$Mutation$RecordPlay<TRes> {
  factory CopyWith$Mutation$RecordPlay(
    Mutation$RecordPlay instance,
    TRes Function(Mutation$RecordPlay) then,
  ) = _CopyWithImpl$Mutation$RecordPlay;

  factory CopyWith$Mutation$RecordPlay.stub(TRes res) =
      _CopyWithStubImpl$Mutation$RecordPlay;

  TRes call({Fragment$GamePlayFields? recordPlay, String? $__typename});
  CopyWith$Fragment$GamePlayFields<TRes> get recordPlay;
}

class _CopyWithImpl$Mutation$RecordPlay<TRes>
    implements CopyWith$Mutation$RecordPlay<TRes> {
  _CopyWithImpl$Mutation$RecordPlay(this._instance, this._then);

  final Mutation$RecordPlay _instance;

  final TRes Function(Mutation$RecordPlay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? recordPlay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$RecordPlay(
      recordPlay: recordPlay == _undefined || recordPlay == null
          ? _instance.recordPlay
          : (recordPlay as Fragment$GamePlayFields),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GamePlayFields<TRes> get recordPlay {
    final local$recordPlay = _instance.recordPlay;
    return CopyWith$Fragment$GamePlayFields(
      local$recordPlay,
      (e) => call(recordPlay: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$RecordPlay<TRes>
    implements CopyWith$Mutation$RecordPlay<TRes> {
  _CopyWithStubImpl$Mutation$RecordPlay(this._res);

  TRes _res;

  call({Fragment$GamePlayFields? recordPlay, String? $__typename}) => _res;

  CopyWith$Fragment$GamePlayFields<TRes> get recordPlay =>
      CopyWith$Fragment$GamePlayFields.stub(_res);
}

const documentNodeMutationRecordPlay = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'RecordPlay'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'RecordPlayInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'recordPlay'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'recordPlayInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GamePlayFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGamePlayFields,
  ],
);
Mutation$RecordPlay _parserFn$Mutation$RecordPlay(Map<String, dynamic> data) =>
    Mutation$RecordPlay.fromJson(data);
typedef OnMutationCompleted$Mutation$RecordPlay =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$RecordPlay?);

class Options$Mutation$RecordPlay
    extends graphql.MutationOptions<Mutation$RecordPlay> {
  Options$Mutation$RecordPlay({
    String? operationName,
    required Variables$Mutation$RecordPlay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordPlay? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RecordPlay? onCompleted,
    graphql.OnMutationUpdate<Mutation$RecordPlay>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$RecordPlay(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRecordPlay,
         parserFn: _parserFn$Mutation$RecordPlay,
       );

  final OnMutationCompleted$Mutation$RecordPlay? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$RecordPlay
    extends graphql.WatchQueryOptions<Mutation$RecordPlay> {
  WatchOptions$Mutation$RecordPlay({
    String? operationName,
    required Variables$Mutation$RecordPlay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordPlay? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationRecordPlay,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$RecordPlay,
       );
}

extension ClientExtension$Mutation$RecordPlay on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$RecordPlay>> mutate$RecordPlay(
    Options$Mutation$RecordPlay options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$RecordPlay> watchMutation$RecordPlay(
    WatchOptions$Mutation$RecordPlay options,
  ) => this.watchMutation(options);
}

class Mutation$RecordPlay$HookResult {
  Mutation$RecordPlay$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$RecordPlay runMutation;

  final graphql.QueryResult<Mutation$RecordPlay> result;
}

Mutation$RecordPlay$HookResult useMutation$RecordPlay([
  WidgetOptions$Mutation$RecordPlay? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$RecordPlay(),
  );
  return Mutation$RecordPlay$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$RecordPlay> useWatchMutation$RecordPlay(
  WatchOptions$Mutation$RecordPlay options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$RecordPlay
    extends graphql.MutationOptions<Mutation$RecordPlay> {
  WidgetOptions$Mutation$RecordPlay({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$RecordPlay? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$RecordPlay? onCompleted,
    graphql.OnMutationUpdate<Mutation$RecordPlay>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$RecordPlay(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationRecordPlay,
         parserFn: _parserFn$Mutation$RecordPlay,
       );

  final OnMutationCompleted$Mutation$RecordPlay? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$RecordPlay =
    graphql.MultiSourceResult<Mutation$RecordPlay> Function(
      Variables$Mutation$RecordPlay, {
      Object? optimisticResult,
      Mutation$RecordPlay? typedOptimisticResult,
    });
typedef Builder$Mutation$RecordPlay =
    widgets.Widget Function(
      RunMutation$Mutation$RecordPlay,
      graphql.QueryResult<Mutation$RecordPlay>?,
    );

class Mutation$RecordPlay$Widget
    extends graphql_flutter.Mutation<Mutation$RecordPlay> {
  Mutation$RecordPlay$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$RecordPlay? options,
    required Builder$Mutation$RecordPlay builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$RecordPlay(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$UndoLastPlay {
  factory Variables$Mutation$UndoLastPlay({required String gameStatsId}) =>
      Variables$Mutation$UndoLastPlay._({r'gameStatsId': gameStatsId});

  Variables$Mutation$UndoLastPlay._(this._$data);

  factory Variables$Mutation$UndoLastPlay.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$gameStatsId = data['gameStatsId'];
    result$data['gameStatsId'] = (l$gameStatsId as String);
    return Variables$Mutation$UndoLastPlay._(result$data);
  }

  Map<String, dynamic> _$data;

  String get gameStatsId => (_$data['gameStatsId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$gameStatsId = gameStatsId;
    result$data['gameStatsId'] = l$gameStatsId;
    return result$data;
  }

  CopyWith$Variables$Mutation$UndoLastPlay<Variables$Mutation$UndoLastPlay>
  get copyWith => CopyWith$Variables$Mutation$UndoLastPlay(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UndoLastPlay ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gameStatsId = gameStatsId;
    final lOther$gameStatsId = other.gameStatsId;
    if (l$gameStatsId != lOther$gameStatsId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$gameStatsId = gameStatsId;
    return Object.hashAll([l$gameStatsId]);
  }
}

abstract class CopyWith$Variables$Mutation$UndoLastPlay<TRes> {
  factory CopyWith$Variables$Mutation$UndoLastPlay(
    Variables$Mutation$UndoLastPlay instance,
    TRes Function(Variables$Mutation$UndoLastPlay) then,
  ) = _CopyWithImpl$Variables$Mutation$UndoLastPlay;

  factory CopyWith$Variables$Mutation$UndoLastPlay.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UndoLastPlay;

  TRes call({String? gameStatsId});
}

class _CopyWithImpl$Variables$Mutation$UndoLastPlay<TRes>
    implements CopyWith$Variables$Mutation$UndoLastPlay<TRes> {
  _CopyWithImpl$Variables$Mutation$UndoLastPlay(this._instance, this._then);

  final Variables$Mutation$UndoLastPlay _instance;

  final TRes Function(Variables$Mutation$UndoLastPlay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? gameStatsId = _undefined}) => _then(
    Variables$Mutation$UndoLastPlay._({
      ..._instance._$data,
      if (gameStatsId != _undefined && gameStatsId != null)
        'gameStatsId': (gameStatsId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UndoLastPlay<TRes>
    implements CopyWith$Variables$Mutation$UndoLastPlay<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UndoLastPlay(this._res);

  TRes _res;

  call({String? gameStatsId}) => _res;
}

class Mutation$UndoLastPlay {
  Mutation$UndoLastPlay({this.undoLastPlay, this.$__typename = 'Mutation'});

  factory Mutation$UndoLastPlay.fromJson(Map<String, dynamic> json) {
    final l$undoLastPlay = json['undoLastPlay'];
    final l$$__typename = json['__typename'];
    return Mutation$UndoLastPlay(
      undoLastPlay: l$undoLastPlay == null
          ? null
          : Fragment$GamePlayFields.fromJson(
              (l$undoLastPlay as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GamePlayFields? undoLastPlay;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$undoLastPlay = undoLastPlay;
    _resultData['undoLastPlay'] = l$undoLastPlay?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$undoLastPlay = undoLastPlay;
    final l$$__typename = $__typename;
    return Object.hashAll([l$undoLastPlay, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UndoLastPlay || runtimeType != other.runtimeType) {
      return false;
    }
    final l$undoLastPlay = undoLastPlay;
    final lOther$undoLastPlay = other.undoLastPlay;
    if (l$undoLastPlay != lOther$undoLastPlay) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UndoLastPlay on Mutation$UndoLastPlay {
  CopyWith$Mutation$UndoLastPlay<Mutation$UndoLastPlay> get copyWith =>
      CopyWith$Mutation$UndoLastPlay(this, (i) => i);
}

abstract class CopyWith$Mutation$UndoLastPlay<TRes> {
  factory CopyWith$Mutation$UndoLastPlay(
    Mutation$UndoLastPlay instance,
    TRes Function(Mutation$UndoLastPlay) then,
  ) = _CopyWithImpl$Mutation$UndoLastPlay;

  factory CopyWith$Mutation$UndoLastPlay.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UndoLastPlay;

  TRes call({Fragment$GamePlayFields? undoLastPlay, String? $__typename});
  CopyWith$Fragment$GamePlayFields<TRes> get undoLastPlay;
}

class _CopyWithImpl$Mutation$UndoLastPlay<TRes>
    implements CopyWith$Mutation$UndoLastPlay<TRes> {
  _CopyWithImpl$Mutation$UndoLastPlay(this._instance, this._then);

  final Mutation$UndoLastPlay _instance;

  final TRes Function(Mutation$UndoLastPlay) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? undoLastPlay = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UndoLastPlay(
      undoLastPlay: undoLastPlay == _undefined
          ? _instance.undoLastPlay
          : (undoLastPlay as Fragment$GamePlayFields?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GamePlayFields<TRes> get undoLastPlay {
    final local$undoLastPlay = _instance.undoLastPlay;
    return local$undoLastPlay == null
        ? CopyWith$Fragment$GamePlayFields.stub(_then(_instance))
        : CopyWith$Fragment$GamePlayFields(
            local$undoLastPlay,
            (e) => call(undoLastPlay: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$UndoLastPlay<TRes>
    implements CopyWith$Mutation$UndoLastPlay<TRes> {
  _CopyWithStubImpl$Mutation$UndoLastPlay(this._res);

  TRes _res;

  call({Fragment$GamePlayFields? undoLastPlay, String? $__typename}) => _res;

  CopyWith$Fragment$GamePlayFields<TRes> get undoLastPlay =>
      CopyWith$Fragment$GamePlayFields.stub(_res);
}

const documentNodeMutationUndoLastPlay = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UndoLastPlay'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'gameStatsId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'undoLastPlay'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'gameStatsId'),
                value: VariableNode(name: NameNode(value: 'gameStatsId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GamePlayFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGamePlayFields,
  ],
);
Mutation$UndoLastPlay _parserFn$Mutation$UndoLastPlay(
  Map<String, dynamic> data,
) => Mutation$UndoLastPlay.fromJson(data);
typedef OnMutationCompleted$Mutation$UndoLastPlay =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UndoLastPlay?);

class Options$Mutation$UndoLastPlay
    extends graphql.MutationOptions<Mutation$UndoLastPlay> {
  Options$Mutation$UndoLastPlay({
    String? operationName,
    required Variables$Mutation$UndoLastPlay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UndoLastPlay? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UndoLastPlay? onCompleted,
    graphql.OnMutationUpdate<Mutation$UndoLastPlay>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UndoLastPlay(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUndoLastPlay,
         parserFn: _parserFn$Mutation$UndoLastPlay,
       );

  final OnMutationCompleted$Mutation$UndoLastPlay? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UndoLastPlay
    extends graphql.WatchQueryOptions<Mutation$UndoLastPlay> {
  WatchOptions$Mutation$UndoLastPlay({
    String? operationName,
    required Variables$Mutation$UndoLastPlay variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UndoLastPlay? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUndoLastPlay,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UndoLastPlay,
       );
}

extension ClientExtension$Mutation$UndoLastPlay on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UndoLastPlay>> mutate$UndoLastPlay(
    Options$Mutation$UndoLastPlay options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UndoLastPlay> watchMutation$UndoLastPlay(
    WatchOptions$Mutation$UndoLastPlay options,
  ) => this.watchMutation(options);
}

class Mutation$UndoLastPlay$HookResult {
  Mutation$UndoLastPlay$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UndoLastPlay runMutation;

  final graphql.QueryResult<Mutation$UndoLastPlay> result;
}

Mutation$UndoLastPlay$HookResult useMutation$UndoLastPlay([
  WidgetOptions$Mutation$UndoLastPlay? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UndoLastPlay(),
  );
  return Mutation$UndoLastPlay$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UndoLastPlay> useWatchMutation$UndoLastPlay(
  WatchOptions$Mutation$UndoLastPlay options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UndoLastPlay
    extends graphql.MutationOptions<Mutation$UndoLastPlay> {
  WidgetOptions$Mutation$UndoLastPlay({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UndoLastPlay? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UndoLastPlay? onCompleted,
    graphql.OnMutationUpdate<Mutation$UndoLastPlay>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UndoLastPlay(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUndoLastPlay,
         parserFn: _parserFn$Mutation$UndoLastPlay,
       );

  final OnMutationCompleted$Mutation$UndoLastPlay? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UndoLastPlay =
    graphql.MultiSourceResult<Mutation$UndoLastPlay> Function(
      Variables$Mutation$UndoLastPlay, {
      Object? optimisticResult,
      Mutation$UndoLastPlay? typedOptimisticResult,
    });
typedef Builder$Mutation$UndoLastPlay =
    widgets.Widget Function(
      RunMutation$Mutation$UndoLastPlay,
      graphql.QueryResult<Mutation$UndoLastPlay>?,
    );

class Mutation$UndoLastPlay$Widget
    extends graphql_flutter.Mutation<Mutation$UndoLastPlay> {
  Mutation$UndoLastPlay$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UndoLastPlay? options,
    required Builder$Mutation$UndoLastPlay builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UndoLastPlay(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$UpdateGameStats {
  factory Variables$Mutation$UpdateGameStats({
    required Input$UpdateGameStatsInput input,
  }) => Variables$Mutation$UpdateGameStats._({r'input': input});

  Variables$Mutation$UpdateGameStats._(this._$data);

  factory Variables$Mutation$UpdateGameStats.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$UpdateGameStatsInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateGameStats._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateGameStatsInput get input =>
      (_$data['input'] as Input$UpdateGameStatsInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateGameStats<
    Variables$Mutation$UpdateGameStats
  >
  get copyWith => CopyWith$Variables$Mutation$UpdateGameStats(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateGameStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateGameStats<TRes> {
  factory CopyWith$Variables$Mutation$UpdateGameStats(
    Variables$Mutation$UpdateGameStats instance,
    TRes Function(Variables$Mutation$UpdateGameStats) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateGameStats;

  factory CopyWith$Variables$Mutation$UpdateGameStats.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateGameStats;

  TRes call({Input$UpdateGameStatsInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateGameStats<TRes>
    implements CopyWith$Variables$Mutation$UpdateGameStats<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateGameStats(this._instance, this._then);

  final Variables$Mutation$UpdateGameStats _instance;

  final TRes Function(Variables$Mutation$UpdateGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateGameStats._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateGameStatsInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateGameStats<TRes>
    implements CopyWith$Variables$Mutation$UpdateGameStats<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateGameStats(this._res);

  TRes _res;

  call({Input$UpdateGameStatsInput? input}) => _res;
}

class Mutation$UpdateGameStats {
  Mutation$UpdateGameStats({
    required this.updateGameStats,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateGameStats.fromJson(Map<String, dynamic> json) {
    final l$updateGameStats = json['updateGameStats'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateGameStats(
      updateGameStats: Fragment$GameStatFields.fromJson(
        (l$updateGameStats as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GameStatFields updateGameStats;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateGameStats = updateGameStats;
    _resultData['updateGameStats'] = l$updateGameStats.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateGameStats = updateGameStats;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateGameStats, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateGameStats ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateGameStats = updateGameStats;
    final lOther$updateGameStats = other.updateGameStats;
    if (l$updateGameStats != lOther$updateGameStats) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateGameStats
    on Mutation$UpdateGameStats {
  CopyWith$Mutation$UpdateGameStats<Mutation$UpdateGameStats> get copyWith =>
      CopyWith$Mutation$UpdateGameStats(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateGameStats<TRes> {
  factory CopyWith$Mutation$UpdateGameStats(
    Mutation$UpdateGameStats instance,
    TRes Function(Mutation$UpdateGameStats) then,
  ) = _CopyWithImpl$Mutation$UpdateGameStats;

  factory CopyWith$Mutation$UpdateGameStats.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateGameStats;

  TRes call({Fragment$GameStatFields? updateGameStats, String? $__typename});
  CopyWith$Fragment$GameStatFields<TRes> get updateGameStats;
}

class _CopyWithImpl$Mutation$UpdateGameStats<TRes>
    implements CopyWith$Mutation$UpdateGameStats<TRes> {
  _CopyWithImpl$Mutation$UpdateGameStats(this._instance, this._then);

  final Mutation$UpdateGameStats _instance;

  final TRes Function(Mutation$UpdateGameStats) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateGameStats = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateGameStats(
      updateGameStats: updateGameStats == _undefined || updateGameStats == null
          ? _instance.updateGameStats
          : (updateGameStats as Fragment$GameStatFields),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GameStatFields<TRes> get updateGameStats {
    final local$updateGameStats = _instance.updateGameStats;
    return CopyWith$Fragment$GameStatFields(
      local$updateGameStats,
      (e) => call(updateGameStats: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateGameStats<TRes>
    implements CopyWith$Mutation$UpdateGameStats<TRes> {
  _CopyWithStubImpl$Mutation$UpdateGameStats(this._res);

  TRes _res;

  call({Fragment$GameStatFields? updateGameStats, String? $__typename}) => _res;

  CopyWith$Fragment$GameStatFields<TRes> get updateGameStats =>
      CopyWith$Fragment$GameStatFields.stub(_res);
}

const documentNodeMutationUpdateGameStats = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateGameStats'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateGameStatsInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateGameStats'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'updateGameStatsInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
  ],
);
Mutation$UpdateGameStats _parserFn$Mutation$UpdateGameStats(
  Map<String, dynamic> data,
) => Mutation$UpdateGameStats.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateGameStats =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateGameStats?);

class Options$Mutation$UpdateGameStats
    extends graphql.MutationOptions<Mutation$UpdateGameStats> {
  Options$Mutation$UpdateGameStats({
    String? operationName,
    required Variables$Mutation$UpdateGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStats? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateGameStats? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateGameStats>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdateGameStats(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateGameStats,
         parserFn: _parserFn$Mutation$UpdateGameStats,
       );

  final OnMutationCompleted$Mutation$UpdateGameStats? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateGameStats
    extends graphql.WatchQueryOptions<Mutation$UpdateGameStats> {
  WatchOptions$Mutation$UpdateGameStats({
    String? operationName,
    required Variables$Mutation$UpdateGameStats variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStats? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdateGameStats,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateGameStats,
       );
}

extension ClientExtension$Mutation$UpdateGameStats on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateGameStats>> mutate$UpdateGameStats(
    Options$Mutation$UpdateGameStats options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateGameStats>
  watchMutation$UpdateGameStats(
    WatchOptions$Mutation$UpdateGameStats options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateGameStats$HookResult {
  Mutation$UpdateGameStats$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateGameStats runMutation;

  final graphql.QueryResult<Mutation$UpdateGameStats> result;
}

Mutation$UpdateGameStats$HookResult useMutation$UpdateGameStats([
  WidgetOptions$Mutation$UpdateGameStats? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateGameStats(),
  );
  return Mutation$UpdateGameStats$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateGameStats>
useWatchMutation$UpdateGameStats(
  WatchOptions$Mutation$UpdateGameStats options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateGameStats
    extends graphql.MutationOptions<Mutation$UpdateGameStats> {
  WidgetOptions$Mutation$UpdateGameStats({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStats? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateGameStats? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateGameStats>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null ? null : _parserFn$Mutation$UpdateGameStats(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateGameStats,
         parserFn: _parserFn$Mutation$UpdateGameStats,
       );

  final OnMutationCompleted$Mutation$UpdateGameStats? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateGameStats =
    graphql.MultiSourceResult<Mutation$UpdateGameStats> Function(
      Variables$Mutation$UpdateGameStats, {
      Object? optimisticResult,
      Mutation$UpdateGameStats? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateGameStats =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateGameStats,
      graphql.QueryResult<Mutation$UpdateGameStats>?,
    );

class Mutation$UpdateGameStats$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateGameStats> {
  Mutation$UpdateGameStats$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateGameStats? options,
    required Builder$Mutation$UpdateGameStats builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateGameStats(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Mutation$UpdateGameStatus {
  factory Variables$Mutation$UpdateGameStatus({
    required Input$UpdateGameStatusInput input,
  }) => Variables$Mutation$UpdateGameStatus._({r'input': input});

  Variables$Mutation$UpdateGameStatus._(this._$data);

  factory Variables$Mutation$UpdateGameStatus.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$UpdateGameStatusInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$UpdateGameStatus._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$UpdateGameStatusInput get input =>
      (_$data['input'] as Input$UpdateGameStatusInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateGameStatus<
    Variables$Mutation$UpdateGameStatus
  >
  get copyWith => CopyWith$Variables$Mutation$UpdateGameStatus(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateGameStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdateGameStatus<TRes> {
  factory CopyWith$Variables$Mutation$UpdateGameStatus(
    Variables$Mutation$UpdateGameStatus instance,
    TRes Function(Variables$Mutation$UpdateGameStatus) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateGameStatus;

  factory CopyWith$Variables$Mutation$UpdateGameStatus.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateGameStatus;

  TRes call({Input$UpdateGameStatusInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateGameStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateGameStatus<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateGameStatus(this._instance, this._then);

  final Variables$Mutation$UpdateGameStatus _instance;

  final TRes Function(Variables$Mutation$UpdateGameStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$UpdateGameStatus._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$UpdateGameStatusInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$UpdateGameStatus<TRes>
    implements CopyWith$Variables$Mutation$UpdateGameStatus<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateGameStatus(this._res);

  TRes _res;

  call({Input$UpdateGameStatusInput? input}) => _res;
}

class Mutation$UpdateGameStatus {
  Mutation$UpdateGameStatus({
    required this.updateGameStatus,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateGameStatus.fromJson(Map<String, dynamic> json) {
    final l$updateGameStatus = json['updateGameStatus'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateGameStatus(
      updateGameStatus: Fragment$GameStatFields.fromJson(
        (l$updateGameStatus as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GameStatFields updateGameStatus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$updateGameStatus = updateGameStatus;
    _resultData['updateGameStatus'] = l$updateGameStatus.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$updateGameStatus = updateGameStatus;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateGameStatus, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateGameStatus ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$updateGameStatus = updateGameStatus;
    final lOther$updateGameStatus = other.updateGameStatus;
    if (l$updateGameStatus != lOther$updateGameStatus) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateGameStatus
    on Mutation$UpdateGameStatus {
  CopyWith$Mutation$UpdateGameStatus<Mutation$UpdateGameStatus> get copyWith =>
      CopyWith$Mutation$UpdateGameStatus(this, (i) => i);
}

abstract class CopyWith$Mutation$UpdateGameStatus<TRes> {
  factory CopyWith$Mutation$UpdateGameStatus(
    Mutation$UpdateGameStatus instance,
    TRes Function(Mutation$UpdateGameStatus) then,
  ) = _CopyWithImpl$Mutation$UpdateGameStatus;

  factory CopyWith$Mutation$UpdateGameStatus.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateGameStatus;

  TRes call({Fragment$GameStatFields? updateGameStatus, String? $__typename});
  CopyWith$Fragment$GameStatFields<TRes> get updateGameStatus;
}

class _CopyWithImpl$Mutation$UpdateGameStatus<TRes>
    implements CopyWith$Mutation$UpdateGameStatus<TRes> {
  _CopyWithImpl$Mutation$UpdateGameStatus(this._instance, this._then);

  final Mutation$UpdateGameStatus _instance;

  final TRes Function(Mutation$UpdateGameStatus) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? updateGameStatus = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$UpdateGameStatus(
      updateGameStatus:
          updateGameStatus == _undefined || updateGameStatus == null
          ? _instance.updateGameStatus
          : (updateGameStatus as Fragment$GameStatFields),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GameStatFields<TRes> get updateGameStatus {
    final local$updateGameStatus = _instance.updateGameStatus;
    return CopyWith$Fragment$GameStatFields(
      local$updateGameStatus,
      (e) => call(updateGameStatus: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$UpdateGameStatus<TRes>
    implements CopyWith$Mutation$UpdateGameStatus<TRes> {
  _CopyWithStubImpl$Mutation$UpdateGameStatus(this._res);

  TRes _res;

  call({Fragment$GameStatFields? updateGameStatus, String? $__typename}) =>
      _res;

  CopyWith$Fragment$GameStatFields<TRes> get updateGameStatus =>
      CopyWith$Fragment$GameStatFields.stub(_res);
}

const documentNodeMutationUpdateGameStatus = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateGameStatus'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'UpdateGameStatusInput'),
            isNonNull: true,
          ),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'updateGameStatus'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'updateGameStatusInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatFields'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
  ],
);
Mutation$UpdateGameStatus _parserFn$Mutation$UpdateGameStatus(
  Map<String, dynamic> data,
) => Mutation$UpdateGameStatus.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateGameStatus =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$UpdateGameStatus?);

class Options$Mutation$UpdateGameStatus
    extends graphql.MutationOptions<Mutation$UpdateGameStatus> {
  Options$Mutation$UpdateGameStatus({
    String? operationName,
    required Variables$Mutation$UpdateGameStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateGameStatus? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateGameStatus>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null
                     ? null
                     : _parserFn$Mutation$UpdateGameStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateGameStatus,
         parserFn: _parserFn$Mutation$UpdateGameStatus,
       );

  final OnMutationCompleted$Mutation$UpdateGameStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$UpdateGameStatus
    extends graphql.WatchQueryOptions<Mutation$UpdateGameStatus> {
  WatchOptions$Mutation$UpdateGameStatus({
    String? operationName,
    required Variables$Mutation$UpdateGameStatus variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStatus? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeMutationUpdateGameStatus,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$UpdateGameStatus,
       );
}

extension ClientExtension$Mutation$UpdateGameStatus on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateGameStatus>>
  mutate$UpdateGameStatus(Options$Mutation$UpdateGameStatus options) async =>
      await this.mutate(options);

  graphql.ObservableQuery<Mutation$UpdateGameStatus>
  watchMutation$UpdateGameStatus(
    WatchOptions$Mutation$UpdateGameStatus options,
  ) => this.watchMutation(options);
}

class Mutation$UpdateGameStatus$HookResult {
  Mutation$UpdateGameStatus$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateGameStatus runMutation;

  final graphql.QueryResult<Mutation$UpdateGameStatus> result;
}

Mutation$UpdateGameStatus$HookResult useMutation$UpdateGameStatus([
  WidgetOptions$Mutation$UpdateGameStatus? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$UpdateGameStatus(),
  );
  return Mutation$UpdateGameStatus$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateGameStatus>
useWatchMutation$UpdateGameStatus(
  WatchOptions$Mutation$UpdateGameStatus options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateGameStatus
    extends graphql.MutationOptions<Mutation$UpdateGameStatus> {
  WidgetOptions$Mutation$UpdateGameStatus({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdateGameStatus? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdateGameStatus? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdateGameStatus>? update,
    graphql.OnError? onError,
  }) : onCompletedWithParsed = onCompleted,
       super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         onCompleted: onCompleted == null
             ? null
             : (data) => onCompleted(
                 data,
                 data == null
                     ? null
                     : _parserFn$Mutation$UpdateGameStatus(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationUpdateGameStatus,
         parserFn: _parserFn$Mutation$UpdateGameStatus,
       );

  final OnMutationCompleted$Mutation$UpdateGameStatus? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$UpdateGameStatus =
    graphql.MultiSourceResult<Mutation$UpdateGameStatus> Function(
      Variables$Mutation$UpdateGameStatus, {
      Object? optimisticResult,
      Mutation$UpdateGameStatus? typedOptimisticResult,
    });
typedef Builder$Mutation$UpdateGameStatus =
    widgets.Widget Function(
      RunMutation$Mutation$UpdateGameStatus,
      graphql.QueryResult<Mutation$UpdateGameStatus>?,
    );

class Mutation$UpdateGameStatus$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateGameStatus> {
  Mutation$UpdateGameStatus$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdateGameStatus? options,
    required Builder$Mutation$UpdateGameStatus builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$UpdateGameStatus(),
         builder: (run, result) => builder(
           (variables, {optimisticResult, typedOptimisticResult}) => run(
             variables.toJson(),
             optimisticResult:
                 optimisticResult ?? typedOptimisticResult?.toJson(),
           ),
           result,
         ),
       );
}

class Variables$Subscription$GameStatsUpdated {
  factory Variables$Subscription$GameStatsUpdated({required String eventId}) =>
      Variables$Subscription$GameStatsUpdated._({r'eventId': eventId});

  Variables$Subscription$GameStatsUpdated._(this._$data);

  factory Variables$Subscription$GameStatsUpdated.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    return Variables$Subscription$GameStatsUpdated._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    return result$data;
  }

  CopyWith$Variables$Subscription$GameStatsUpdated<
    Variables$Subscription$GameStatsUpdated
  >
  get copyWith =>
      CopyWith$Variables$Subscription$GameStatsUpdated(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Subscription$GameStatsUpdated ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    return Object.hashAll([l$eventId]);
  }
}

abstract class CopyWith$Variables$Subscription$GameStatsUpdated<TRes> {
  factory CopyWith$Variables$Subscription$GameStatsUpdated(
    Variables$Subscription$GameStatsUpdated instance,
    TRes Function(Variables$Subscription$GameStatsUpdated) then,
  ) = _CopyWithImpl$Variables$Subscription$GameStatsUpdated;

  factory CopyWith$Variables$Subscription$GameStatsUpdated.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$GameStatsUpdated;

  TRes call({String? eventId});
}

class _CopyWithImpl$Variables$Subscription$GameStatsUpdated<TRes>
    implements CopyWith$Variables$Subscription$GameStatsUpdated<TRes> {
  _CopyWithImpl$Variables$Subscription$GameStatsUpdated(
    this._instance,
    this._then,
  );

  final Variables$Subscription$GameStatsUpdated _instance;

  final TRes Function(Variables$Subscription$GameStatsUpdated) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eventId = _undefined}) => _then(
    Variables$Subscription$GameStatsUpdated._({
      ..._instance._$data,
      if (eventId != _undefined && eventId != null)
        'eventId': (eventId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Subscription$GameStatsUpdated<TRes>
    implements CopyWith$Variables$Subscription$GameStatsUpdated<TRes> {
  _CopyWithStubImpl$Variables$Subscription$GameStatsUpdated(this._res);

  TRes _res;

  call({String? eventId}) => _res;
}

class Subscription$GameStatsUpdated {
  Subscription$GameStatsUpdated({
    required this.gameStatsUpdated,
    this.$__typename = 'Subscription',
  });

  factory Subscription$GameStatsUpdated.fromJson(Map<String, dynamic> json) {
    final l$gameStatsUpdated = json['gameStatsUpdated'];
    final l$$__typename = json['__typename'];
    return Subscription$GameStatsUpdated(
      gameStatsUpdated: Fragment$GameStatWithPlays.fromJson(
        (l$gameStatsUpdated as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Fragment$GameStatWithPlays gameStatsUpdated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$gameStatsUpdated = gameStatsUpdated;
    _resultData['gameStatsUpdated'] = l$gameStatsUpdated.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$gameStatsUpdated = gameStatsUpdated;
    final l$$__typename = $__typename;
    return Object.hashAll([l$gameStatsUpdated, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Subscription$GameStatsUpdated ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gameStatsUpdated = gameStatsUpdated;
    final lOther$gameStatsUpdated = other.gameStatsUpdated;
    if (l$gameStatsUpdated != lOther$gameStatsUpdated) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$GameStatsUpdated
    on Subscription$GameStatsUpdated {
  CopyWith$Subscription$GameStatsUpdated<Subscription$GameStatsUpdated>
  get copyWith => CopyWith$Subscription$GameStatsUpdated(this, (i) => i);
}

abstract class CopyWith$Subscription$GameStatsUpdated<TRes> {
  factory CopyWith$Subscription$GameStatsUpdated(
    Subscription$GameStatsUpdated instance,
    TRes Function(Subscription$GameStatsUpdated) then,
  ) = _CopyWithImpl$Subscription$GameStatsUpdated;

  factory CopyWith$Subscription$GameStatsUpdated.stub(TRes res) =
      _CopyWithStubImpl$Subscription$GameStatsUpdated;

  TRes call({
    Fragment$GameStatWithPlays? gameStatsUpdated,
    String? $__typename,
  });
  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStatsUpdated;
}

class _CopyWithImpl$Subscription$GameStatsUpdated<TRes>
    implements CopyWith$Subscription$GameStatsUpdated<TRes> {
  _CopyWithImpl$Subscription$GameStatsUpdated(this._instance, this._then);

  final Subscription$GameStatsUpdated _instance;

  final TRes Function(Subscription$GameStatsUpdated) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? gameStatsUpdated = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Subscription$GameStatsUpdated(
      gameStatsUpdated:
          gameStatsUpdated == _undefined || gameStatsUpdated == null
          ? _instance.gameStatsUpdated
          : (gameStatsUpdated as Fragment$GameStatWithPlays),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStatsUpdated {
    final local$gameStatsUpdated = _instance.gameStatsUpdated;
    return CopyWith$Fragment$GameStatWithPlays(
      local$gameStatsUpdated,
      (e) => call(gameStatsUpdated: e),
    );
  }
}

class _CopyWithStubImpl$Subscription$GameStatsUpdated<TRes>
    implements CopyWith$Subscription$GameStatsUpdated<TRes> {
  _CopyWithStubImpl$Subscription$GameStatsUpdated(this._res);

  TRes _res;

  call({Fragment$GameStatWithPlays? gameStatsUpdated, String? $__typename}) =>
      _res;

  CopyWith$Fragment$GameStatWithPlays<TRes> get gameStatsUpdated =>
      CopyWith$Fragment$GameStatWithPlays.stub(_res);
}

const documentNodeSubscriptionGameStatsUpdated = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'GameStatsUpdated'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'eventId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'gameStatsUpdated'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'eventId'),
                value: VariableNode(name: NameNode(value: 'eventId')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FragmentSpreadNode(
                  name: NameNode(value: 'GameStatWithPlays'),
                  directives: [],
                ),
                FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ],
            ),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ],
      ),
    ),
    fragmentDefinitionGameStatWithPlays,
    fragmentDefinitionGameStatFields,
    fragmentDefinitionPlayerStatFields,
    fragmentDefinitionGamePlayFields,
  ],
);
Subscription$GameStatsUpdated _parserFn$Subscription$GameStatsUpdated(
  Map<String, dynamic> data,
) => Subscription$GameStatsUpdated.fromJson(data);

class Options$Subscription$GameStatsUpdated
    extends graphql.SubscriptionOptions<Subscription$GameStatsUpdated> {
  Options$Subscription$GameStatsUpdated({
    String? operationName,
    required Variables$Subscription$GameStatsUpdated variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GameStatsUpdated? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionGameStatsUpdated,
         parserFn: _parserFn$Subscription$GameStatsUpdated,
       );
}

class WatchOptions$Subscription$GameStatsUpdated
    extends graphql.WatchQueryOptions<Subscription$GameStatsUpdated> {
  WatchOptions$Subscription$GameStatsUpdated({
    String? operationName,
    required Variables$Subscription$GameStatsUpdated variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$GameStatsUpdated? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         variables: variables.toJson(),
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeSubscriptionGameStatsUpdated,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Subscription$GameStatsUpdated,
       );
}

class FetchMoreOptions$Subscription$GameStatsUpdated
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$GameStatsUpdated({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$GameStatsUpdated variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeSubscriptionGameStatsUpdated,
       );
}

extension ClientExtension$Subscription$GameStatsUpdated
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$GameStatsUpdated>>
  subscribe$GameStatsUpdated(Options$Subscription$GameStatsUpdated options) =>
      this.subscribe(options);

  graphql.ObservableQuery<Subscription$GameStatsUpdated>
  watchSubscription$GameStatsUpdated(
    WatchOptions$Subscription$GameStatsUpdated options,
  ) => this.watchQuery(options);
}

graphql.QueryResult<Subscription$GameStatsUpdated>
useSubscription$GameStatsUpdated(
  Options$Subscription$GameStatsUpdated options,
) => graphql_flutter.useSubscription(options);

class Subscription$GameStatsUpdated$Widget
    extends graphql_flutter.Subscription<Subscription$GameStatsUpdated> {
  Subscription$GameStatsUpdated$Widget({
    widgets.Key? key,
    required Options$Subscription$GameStatsUpdated options,
    required graphql_flutter.SubscriptionBuilder<Subscription$GameStatsUpdated>
    builder,
    graphql_flutter.OnSubscriptionResult<Subscription$GameStatsUpdated>?
    onSubscriptionResult,
  }) : super(
         key: key,
         options: options,
         builder: builder,
         onSubscriptionResult: onSubscriptionResult,
       );
}
