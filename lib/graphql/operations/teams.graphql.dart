import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$GetMyTeams {
  Query$GetMyTeams({required this.myTeams, this.$__typename = 'Query'});

  factory Query$GetMyTeams.fromJson(Map<String, dynamic> json) {
    final l$myTeams = json['myTeams'];
    final l$$__typename = json['__typename'];
    return Query$GetMyTeams(
      myTeams: (l$myTeams as List<dynamic>)
          .map(
            (e) =>
                Query$GetMyTeams$myTeams.fromJson((e as Map<String, dynamic>)),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMyTeams$myTeams> myTeams;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myTeams = myTeams;
    _resultData['myTeams'] = l$myTeams.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myTeams = myTeams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$myTeams.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyTeams || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myTeams = myTeams;
    final lOther$myTeams = other.myTeams;
    if (l$myTeams.length != lOther$myTeams.length) {
      return false;
    }
    for (int i = 0; i < l$myTeams.length; i++) {
      final l$myTeams$entry = l$myTeams[i];
      final lOther$myTeams$entry = lOther$myTeams[i];
      if (l$myTeams$entry != lOther$myTeams$entry) {
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

extension UtilityExtension$Query$GetMyTeams on Query$GetMyTeams {
  CopyWith$Query$GetMyTeams<Query$GetMyTeams> get copyWith =>
      CopyWith$Query$GetMyTeams(this, (i) => i);
}

abstract class CopyWith$Query$GetMyTeams<TRes> {
  factory CopyWith$Query$GetMyTeams(
    Query$GetMyTeams instance,
    TRes Function(Query$GetMyTeams) then,
  ) = _CopyWithImpl$Query$GetMyTeams;

  factory CopyWith$Query$GetMyTeams.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyTeams;

  TRes call({List<Query$GetMyTeams$myTeams>? myTeams, String? $__typename});
  TRes myTeams(
    Iterable<Query$GetMyTeams$myTeams> Function(
      Iterable<CopyWith$Query$GetMyTeams$myTeams<Query$GetMyTeams$myTeams>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetMyTeams<TRes>
    implements CopyWith$Query$GetMyTeams<TRes> {
  _CopyWithImpl$Query$GetMyTeams(this._instance, this._then);

  final Query$GetMyTeams _instance;

  final TRes Function(Query$GetMyTeams) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? myTeams = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Query$GetMyTeams(
          myTeams: myTeams == _undefined || myTeams == null
              ? _instance.myTeams
              : (myTeams as List<Query$GetMyTeams$myTeams>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  TRes myTeams(
    Iterable<Query$GetMyTeams$myTeams> Function(
      Iterable<CopyWith$Query$GetMyTeams$myTeams<Query$GetMyTeams$myTeams>>,
    )
    _fn,
  ) => call(
    myTeams: _fn(
      _instance.myTeams.map(
        (e) => CopyWith$Query$GetMyTeams$myTeams(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetMyTeams<TRes>
    implements CopyWith$Query$GetMyTeams<TRes> {
  _CopyWithStubImpl$Query$GetMyTeams(this._res);

  TRes _res;

  call({List<Query$GetMyTeams$myTeams>? myTeams, String? $__typename}) => _res;

  myTeams(_fn) => _res;
}

const documentNodeQueryGetMyTeams = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMyTeams'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'myTeams'),
            alias: null,
            arguments: [],
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'sport'),
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
                  name: NameNode(value: 'joinCode'),
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
                  name: NameNode(value: 'members'),
                  alias: null,
                  arguments: [],
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
                        name: NameNode(value: 'userId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'role'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'user'),
                        alias: null,
                        arguments: [],
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
                              name: NameNode(value: 'firstName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'lastName'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            ),
                            FieldNode(
                              name: NameNode(value: 'email'),
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
  ],
);
Query$GetMyTeams _parserFn$Query$GetMyTeams(Map<String, dynamic> data) =>
    Query$GetMyTeams.fromJson(data);
typedef OnQueryComplete$Query$GetMyTeams =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMyTeams?);

class Options$Query$GetMyTeams extends graphql.QueryOptions<Query$GetMyTeams> {
  Options$Query$GetMyTeams({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyTeams? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMyTeams? onComplete,
    graphql.OnQueryError? onError,
  }) : onCompleteWithParsed = onComplete,
       super(
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
                 data == null ? null : _parserFn$Query$GetMyTeams(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMyTeams,
         parserFn: _parserFn$Query$GetMyTeams,
       );

  final OnQueryComplete$Query$GetMyTeams? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMyTeams
    extends graphql.WatchQueryOptions<Query$GetMyTeams> {
  WatchOptions$Query$GetMyTeams({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyTeams? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
         operationName: operationName,
         fetchPolicy: fetchPolicy,
         errorPolicy: errorPolicy,
         cacheRereadPolicy: cacheRereadPolicy,
         optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
         context: context,
         document: documentNodeQueryGetMyTeams,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMyTeams,
       );
}

class FetchMoreOptions$Query$GetMyTeams extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMyTeams({required graphql.UpdateQuery updateQuery})
    : super(updateQuery: updateQuery, document: documentNodeQueryGetMyTeams);
}

extension ClientExtension$Query$GetMyTeams on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMyTeams>> query$GetMyTeams([
    Options$Query$GetMyTeams? options,
  ]) async => await this.query(options ?? Options$Query$GetMyTeams());

  graphql.ObservableQuery<Query$GetMyTeams> watchQuery$GetMyTeams([
    WatchOptions$Query$GetMyTeams? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetMyTeams());

  void writeQuery$GetMyTeams({
    required Query$GetMyTeams data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMyTeams),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMyTeams? readQuery$GetMyTeams({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMyTeams),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMyTeams.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMyTeams> useQuery$GetMyTeams([
  Options$Query$GetMyTeams? options,
]) => graphql_flutter.useQuery(options ?? Options$Query$GetMyTeams());
graphql.ObservableQuery<Query$GetMyTeams> useWatchQuery$GetMyTeams([
  WatchOptions$Query$GetMyTeams? options,
]) => graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetMyTeams());

class Query$GetMyTeams$Widget extends graphql_flutter.Query<Query$GetMyTeams> {
  Query$GetMyTeams$Widget({
    widgets.Key? key,
    Options$Query$GetMyTeams? options,
    required graphql_flutter.QueryBuilder<Query$GetMyTeams> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetMyTeams(),
         builder: builder,
       );
}

class Query$GetMyTeams$myTeams {
  Query$GetMyTeams$myTeams({
    required this.id,
    required this.name,
    required this.sport,
    this.description,
    required this.joinCode,
    required this.createdAt,
    required this.updatedAt,
    this.members,
    this.$__typename = 'Team',
  });

  factory Query$GetMyTeams$myTeams.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$sport = json['sport'];
    final l$description = json['description'];
    final l$joinCode = json['joinCode'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$members = json['members'];
    final l$$__typename = json['__typename'];
    return Query$GetMyTeams$myTeams(
      id: (l$id as String),
      name: (l$name as String),
      sport: (l$sport as String),
      description: (l$description as String?),
      joinCode: (l$joinCode as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      members: (l$members as List<dynamic>?)
          ?.map(
            (e) => Query$GetMyTeams$myTeams$members.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String sport;

  final String? description;

  final String joinCode;

  final DateTime createdAt;

  final DateTime updatedAt;

  final List<Query$GetMyTeams$myTeams$members>? members;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$sport = sport;
    _resultData['sport'] = l$sport;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$joinCode = joinCode;
    _resultData['joinCode'] = l$joinCode;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$members = members;
    _resultData['members'] = l$members?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$sport = sport;
    final l$description = description;
    final l$joinCode = joinCode;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$members = members;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$sport,
      l$description,
      l$joinCode,
      l$createdAt,
      l$updatedAt,
      l$members == null ? null : Object.hashAll(l$members.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyTeams$myTeams ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$sport = sport;
    final lOther$sport = other.sport;
    if (l$sport != lOther$sport) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$joinCode = joinCode;
    final lOther$joinCode = other.joinCode;
    if (l$joinCode != lOther$joinCode) {
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
    final l$members = members;
    final lOther$members = other.members;
    if (l$members != null && lOther$members != null) {
      if (l$members.length != lOther$members.length) {
        return false;
      }
      for (int i = 0; i < l$members.length; i++) {
        final l$members$entry = l$members[i];
        final lOther$members$entry = lOther$members[i];
        if (l$members$entry != lOther$members$entry) {
          return false;
        }
      }
    } else if (l$members != lOther$members) {
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

extension UtilityExtension$Query$GetMyTeams$myTeams
    on Query$GetMyTeams$myTeams {
  CopyWith$Query$GetMyTeams$myTeams<Query$GetMyTeams$myTeams> get copyWith =>
      CopyWith$Query$GetMyTeams$myTeams(this, (i) => i);
}

abstract class CopyWith$Query$GetMyTeams$myTeams<TRes> {
  factory CopyWith$Query$GetMyTeams$myTeams(
    Query$GetMyTeams$myTeams instance,
    TRes Function(Query$GetMyTeams$myTeams) then,
  ) = _CopyWithImpl$Query$GetMyTeams$myTeams;

  factory CopyWith$Query$GetMyTeams$myTeams.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyTeams$myTeams;

  TRes call({
    String? id,
    String? name,
    String? sport,
    String? description,
    String? joinCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Query$GetMyTeams$myTeams$members>? members,
    String? $__typename,
  });
  TRes members(
    Iterable<Query$GetMyTeams$myTeams$members>? Function(
      Iterable<
        CopyWith$Query$GetMyTeams$myTeams$members<
          Query$GetMyTeams$myTeams$members
        >
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetMyTeams$myTeams<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams<TRes> {
  _CopyWithImpl$Query$GetMyTeams$myTeams(this._instance, this._then);

  final Query$GetMyTeams$myTeams _instance;

  final TRes Function(Query$GetMyTeams$myTeams) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? sport = _undefined,
    Object? description = _undefined,
    Object? joinCode = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? members = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMyTeams$myTeams(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      sport: sport == _undefined || sport == null
          ? _instance.sport
          : (sport as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      joinCode: joinCode == _undefined || joinCode == null
          ? _instance.joinCode
          : (joinCode as String),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      members: members == _undefined
          ? _instance.members
          : (members as List<Query$GetMyTeams$myTeams$members>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes members(
    Iterable<Query$GetMyTeams$myTeams$members>? Function(
      Iterable<
        CopyWith$Query$GetMyTeams$myTeams$members<
          Query$GetMyTeams$myTeams$members
        >
      >?,
    )
    _fn,
  ) => call(
    members: _fn(
      _instance.members?.map(
        (e) => CopyWith$Query$GetMyTeams$myTeams$members(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Query$GetMyTeams$myTeams<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams<TRes> {
  _CopyWithStubImpl$Query$GetMyTeams$myTeams(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? sport,
    String? description,
    String? joinCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Query$GetMyTeams$myTeams$members>? members,
    String? $__typename,
  }) => _res;

  members(_fn) => _res;
}

class Query$GetMyTeams$myTeams$members {
  Query$GetMyTeams$myTeams$members({
    required this.id,
    required this.userId,
    required this.role,
    this.user,
    this.$__typename = 'TeamMember',
  });

  factory Query$GetMyTeams$myTeams$members.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$role = json['role'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMyTeams$myTeams$members(
      id: (l$id as String),
      userId: (l$userId as String),
      role: (l$role as List<dynamic>)
          .map((e) => fromJson$Enum$MemberRole((e as String)))
          .toList(),
      user: l$user == null
          ? null
          : Query$GetMyTeams$myTeams$members$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final List<Enum$MemberRole> role;

  final Query$GetMyTeams$myTeams$members$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$role = role;
    _resultData['role'] = l$role.map((e) => toJson$Enum$MemberRole(e)).toList();
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$userId = userId;
    final l$role = role;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      Object.hashAll(l$role.map((v) => v)),
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyTeams$myTeams$members ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role.length != lOther$role.length) {
      return false;
    }
    for (int i = 0; i < l$role.length; i++) {
      final l$role$entry = l$role[i];
      final lOther$role$entry = lOther$role[i];
      if (l$role$entry != lOther$role$entry) {
        return false;
      }
    }
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) {
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

extension UtilityExtension$Query$GetMyTeams$myTeams$members
    on Query$GetMyTeams$myTeams$members {
  CopyWith$Query$GetMyTeams$myTeams$members<Query$GetMyTeams$myTeams$members>
  get copyWith => CopyWith$Query$GetMyTeams$myTeams$members(this, (i) => i);
}

abstract class CopyWith$Query$GetMyTeams$myTeams$members<TRes> {
  factory CopyWith$Query$GetMyTeams$myTeams$members(
    Query$GetMyTeams$myTeams$members instance,
    TRes Function(Query$GetMyTeams$myTeams$members) then,
  ) = _CopyWithImpl$Query$GetMyTeams$myTeams$members;

  factory CopyWith$Query$GetMyTeams$myTeams$members.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyTeams$myTeams$members;

  TRes call({
    String? id,
    String? userId,
    List<Enum$MemberRole>? role,
    Query$GetMyTeams$myTeams$members$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMyTeams$myTeams$members<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams$members<TRes> {
  _CopyWithImpl$Query$GetMyTeams$myTeams$members(this._instance, this._then);

  final Query$GetMyTeams$myTeams$members _instance;

  final TRes Function(Query$GetMyTeams$myTeams$members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? role = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMyTeams$myTeams$members(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as List<Enum$MemberRole>),
      user: user == _undefined
          ? _instance.user
          : (user as Query$GetMyTeams$myTeams$members$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetMyTeams$myTeams$members$user.stub(_then(_instance))
        : CopyWith$Query$GetMyTeams$myTeams$members$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMyTeams$myTeams$members<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams$members<TRes> {
  _CopyWithStubImpl$Query$GetMyTeams$myTeams$members(this._res);

  TRes _res;

  call({
    String? id,
    String? userId,
    List<Enum$MemberRole>? role,
    Query$GetMyTeams$myTeams$members$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> get user =>
      CopyWith$Query$GetMyTeams$myTeams$members$user.stub(_res);
}

class Query$GetMyTeams$myTeams$members$user {
  Query$GetMyTeams$myTeams$members$user({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetMyTeams$myTeams$members$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetMyTeams$myTeams$members$user(
      id: (l$id as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      email: (l$email as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? firstName;

  final String? lastName;

  final String email;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$email,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMyTeams$myTeams$members$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
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

extension UtilityExtension$Query$GetMyTeams$myTeams$members$user
    on Query$GetMyTeams$myTeams$members$user {
  CopyWith$Query$GetMyTeams$myTeams$members$user<
    Query$GetMyTeams$myTeams$members$user
  >
  get copyWith =>
      CopyWith$Query$GetMyTeams$myTeams$members$user(this, (i) => i);
}

abstract class CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> {
  factory CopyWith$Query$GetMyTeams$myTeams$members$user(
    Query$GetMyTeams$myTeams$members$user instance,
    TRes Function(Query$GetMyTeams$myTeams$members$user) then,
  ) = _CopyWithImpl$Query$GetMyTeams$myTeams$members$user;

  factory CopyWith$Query$GetMyTeams$myTeams$members$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyTeams$myTeams$members$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMyTeams$myTeams$members$user<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> {
  _CopyWithImpl$Query$GetMyTeams$myTeams$members$user(
    this._instance,
    this._then,
  );

  final Query$GetMyTeams$myTeams$members$user _instance;

  final TRes Function(Query$GetMyTeams$myTeams$members$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMyTeams$myTeams$members$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetMyTeams$myTeams$members$user<TRes>
    implements CopyWith$Query$GetMyTeams$myTeams$members$user<TRes> {
  _CopyWithStubImpl$Query$GetMyTeams$myTeams$members$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$CreateTeam {
  factory Variables$Mutation$CreateTeam({
    required Input$CreateTeamInput input,
  }) => Variables$Mutation$CreateTeam._({r'input': input});

  Variables$Mutation$CreateTeam._(this._$data);

  factory Variables$Mutation$CreateTeam.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CreateTeamInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$CreateTeam._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CreateTeamInput get input => (_$data['input'] as Input$CreateTeamInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateTeam<Variables$Mutation$CreateTeam>
  get copyWith => CopyWith$Variables$Mutation$CreateTeam(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateTeam ||
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

abstract class CopyWith$Variables$Mutation$CreateTeam<TRes> {
  factory CopyWith$Variables$Mutation$CreateTeam(
    Variables$Mutation$CreateTeam instance,
    TRes Function(Variables$Mutation$CreateTeam) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateTeam;

  factory CopyWith$Variables$Mutation$CreateTeam.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateTeam;

  TRes call({Input$CreateTeamInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateTeam<TRes>
    implements CopyWith$Variables$Mutation$CreateTeam<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateTeam(this._instance, this._then);

  final Variables$Mutation$CreateTeam _instance;

  final TRes Function(Variables$Mutation$CreateTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$CreateTeam._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$CreateTeamInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$CreateTeam<TRes>
    implements CopyWith$Variables$Mutation$CreateTeam<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateTeam(this._res);

  TRes _res;

  call({Input$CreateTeamInput? input}) => _res;
}

class Mutation$CreateTeam {
  Mutation$CreateTeam({
    required this.createTeam,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateTeam.fromJson(Map<String, dynamic> json) {
    final l$createTeam = json['createTeam'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTeam(
      createTeam: Mutation$CreateTeam$createTeam.fromJson(
        (l$createTeam as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateTeam$createTeam createTeam;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createTeam = createTeam;
    _resultData['createTeam'] = l$createTeam.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createTeam = createTeam;
    final l$$__typename = $__typename;
    return Object.hashAll([l$createTeam, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateTeam || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createTeam = createTeam;
    final lOther$createTeam = other.createTeam;
    if (l$createTeam != lOther$createTeam) {
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

extension UtilityExtension$Mutation$CreateTeam on Mutation$CreateTeam {
  CopyWith$Mutation$CreateTeam<Mutation$CreateTeam> get copyWith =>
      CopyWith$Mutation$CreateTeam(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateTeam<TRes> {
  factory CopyWith$Mutation$CreateTeam(
    Mutation$CreateTeam instance,
    TRes Function(Mutation$CreateTeam) then,
  ) = _CopyWithImpl$Mutation$CreateTeam;

  factory CopyWith$Mutation$CreateTeam.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTeam;

  TRes call({Mutation$CreateTeam$createTeam? createTeam, String? $__typename});
  CopyWith$Mutation$CreateTeam$createTeam<TRes> get createTeam;
}

class _CopyWithImpl$Mutation$CreateTeam<TRes>
    implements CopyWith$Mutation$CreateTeam<TRes> {
  _CopyWithImpl$Mutation$CreateTeam(this._instance, this._then);

  final Mutation$CreateTeam _instance;

  final TRes Function(Mutation$CreateTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createTeam = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateTeam(
      createTeam: createTeam == _undefined || createTeam == null
          ? _instance.createTeam
          : (createTeam as Mutation$CreateTeam$createTeam),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$CreateTeam$createTeam<TRes> get createTeam {
    final local$createTeam = _instance.createTeam;
    return CopyWith$Mutation$CreateTeam$createTeam(
      local$createTeam,
      (e) => call(createTeam: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$CreateTeam<TRes>
    implements CopyWith$Mutation$CreateTeam<TRes> {
  _CopyWithStubImpl$Mutation$CreateTeam(this._res);

  TRes _res;

  call({Mutation$CreateTeam$createTeam? createTeam, String? $__typename}) =>
      _res;

  CopyWith$Mutation$CreateTeam$createTeam<TRes> get createTeam =>
      CopyWith$Mutation$CreateTeam$createTeam.stub(_res);
}

const documentNodeMutationCreateTeam = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'CreateTeam'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'CreateTeamInput'),
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
            name: NameNode(value: 'createTeam'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'createTeamInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
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
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'sport'),
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
                  name: NameNode(value: 'joinCode'),
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
                  name: NameNode(value: 'members'),
                  alias: null,
                  arguments: [],
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
                        name: NameNode(value: 'userId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'role'),
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
  ],
);
Mutation$CreateTeam _parserFn$Mutation$CreateTeam(Map<String, dynamic> data) =>
    Mutation$CreateTeam.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateTeam =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$CreateTeam?);

class Options$Mutation$CreateTeam
    extends graphql.MutationOptions<Mutation$CreateTeam> {
  Options$Mutation$CreateTeam({
    String? operationName,
    required Variables$Mutation$CreateTeam variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTeam? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateTeam? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateTeam>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateTeam(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateTeam,
         parserFn: _parserFn$Mutation$CreateTeam,
       );

  final OnMutationCompleted$Mutation$CreateTeam? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$CreateTeam
    extends graphql.WatchQueryOptions<Mutation$CreateTeam> {
  WatchOptions$Mutation$CreateTeam({
    String? operationName,
    required Variables$Mutation$CreateTeam variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTeam? typedOptimisticResult,
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
         document: documentNodeMutationCreateTeam,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$CreateTeam,
       );
}

extension ClientExtension$Mutation$CreateTeam on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateTeam>> mutate$CreateTeam(
    Options$Mutation$CreateTeam options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$CreateTeam> watchMutation$CreateTeam(
    WatchOptions$Mutation$CreateTeam options,
  ) => this.watchMutation(options);
}

class Mutation$CreateTeam$HookResult {
  Mutation$CreateTeam$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$CreateTeam runMutation;

  final graphql.QueryResult<Mutation$CreateTeam> result;
}

Mutation$CreateTeam$HookResult useMutation$CreateTeam([
  WidgetOptions$Mutation$CreateTeam? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$CreateTeam(),
  );
  return Mutation$CreateTeam$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateTeam> useWatchMutation$CreateTeam(
  WatchOptions$Mutation$CreateTeam options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateTeam
    extends graphql.MutationOptions<Mutation$CreateTeam> {
  WidgetOptions$Mutation$CreateTeam({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateTeam? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateTeam? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateTeam>? update,
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
                 data == null ? null : _parserFn$Mutation$CreateTeam(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationCreateTeam,
         parserFn: _parserFn$Mutation$CreateTeam,
       );

  final OnMutationCompleted$Mutation$CreateTeam? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$CreateTeam =
    graphql.MultiSourceResult<Mutation$CreateTeam> Function(
      Variables$Mutation$CreateTeam, {
      Object? optimisticResult,
      Mutation$CreateTeam? typedOptimisticResult,
    });
typedef Builder$Mutation$CreateTeam =
    widgets.Widget Function(
      RunMutation$Mutation$CreateTeam,
      graphql.QueryResult<Mutation$CreateTeam>?,
    );

class Mutation$CreateTeam$Widget
    extends graphql_flutter.Mutation<Mutation$CreateTeam> {
  Mutation$CreateTeam$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateTeam? options,
    required Builder$Mutation$CreateTeam builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$CreateTeam(),
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

class Mutation$CreateTeam$createTeam {
  Mutation$CreateTeam$createTeam({
    required this.id,
    required this.name,
    required this.sport,
    this.description,
    required this.joinCode,
    required this.createdAt,
    required this.updatedAt,
    this.members,
    this.$__typename = 'Team',
  });

  factory Mutation$CreateTeam$createTeam.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$sport = json['sport'];
    final l$description = json['description'];
    final l$joinCode = json['joinCode'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$members = json['members'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTeam$createTeam(
      id: (l$id as String),
      name: (l$name as String),
      sport: (l$sport as String),
      description: (l$description as String?),
      joinCode: (l$joinCode as String),
      createdAt: DateTime.parse((l$createdAt as String)),
      updatedAt: DateTime.parse((l$updatedAt as String)),
      members: (l$members as List<dynamic>?)
          ?.map(
            (e) => Mutation$CreateTeam$createTeam$members.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String sport;

  final String? description;

  final String joinCode;

  final DateTime createdAt;

  final DateTime updatedAt;

  final List<Mutation$CreateTeam$createTeam$members>? members;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$sport = sport;
    _resultData['sport'] = l$sport;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$joinCode = joinCode;
    _resultData['joinCode'] = l$joinCode;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt.toIso8601String();
    final l$members = members;
    _resultData['members'] = l$members?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$sport = sport;
    final l$description = description;
    final l$joinCode = joinCode;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$members = members;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$sport,
      l$description,
      l$joinCode,
      l$createdAt,
      l$updatedAt,
      l$members == null ? null : Object.hashAll(l$members.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateTeam$createTeam ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$sport = sport;
    final lOther$sport = other.sport;
    if (l$sport != lOther$sport) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$joinCode = joinCode;
    final lOther$joinCode = other.joinCode;
    if (l$joinCode != lOther$joinCode) {
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
    final l$members = members;
    final lOther$members = other.members;
    if (l$members != null && lOther$members != null) {
      if (l$members.length != lOther$members.length) {
        return false;
      }
      for (int i = 0; i < l$members.length; i++) {
        final l$members$entry = l$members[i];
        final lOther$members$entry = lOther$members[i];
        if (l$members$entry != lOther$members$entry) {
          return false;
        }
      }
    } else if (l$members != lOther$members) {
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

extension UtilityExtension$Mutation$CreateTeam$createTeam
    on Mutation$CreateTeam$createTeam {
  CopyWith$Mutation$CreateTeam$createTeam<Mutation$CreateTeam$createTeam>
  get copyWith => CopyWith$Mutation$CreateTeam$createTeam(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateTeam$createTeam<TRes> {
  factory CopyWith$Mutation$CreateTeam$createTeam(
    Mutation$CreateTeam$createTeam instance,
    TRes Function(Mutation$CreateTeam$createTeam) then,
  ) = _CopyWithImpl$Mutation$CreateTeam$createTeam;

  factory CopyWith$Mutation$CreateTeam$createTeam.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTeam$createTeam;

  TRes call({
    String? id,
    String? name,
    String? sport,
    String? description,
    String? joinCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Mutation$CreateTeam$createTeam$members>? members,
    String? $__typename,
  });
  TRes members(
    Iterable<Mutation$CreateTeam$createTeam$members>? Function(
      Iterable<
        CopyWith$Mutation$CreateTeam$createTeam$members<
          Mutation$CreateTeam$createTeam$members
        >
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Mutation$CreateTeam$createTeam<TRes>
    implements CopyWith$Mutation$CreateTeam$createTeam<TRes> {
  _CopyWithImpl$Mutation$CreateTeam$createTeam(this._instance, this._then);

  final Mutation$CreateTeam$createTeam _instance;

  final TRes Function(Mutation$CreateTeam$createTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? sport = _undefined,
    Object? description = _undefined,
    Object? joinCode = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? members = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateTeam$createTeam(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      name: name == _undefined || name == null
          ? _instance.name
          : (name as String),
      sport: sport == _undefined || sport == null
          ? _instance.sport
          : (sport as String),
      description: description == _undefined
          ? _instance.description
          : (description as String?),
      joinCode: joinCode == _undefined || joinCode == null
          ? _instance.joinCode
          : (joinCode as String),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      updatedAt: updatedAt == _undefined || updatedAt == null
          ? _instance.updatedAt
          : (updatedAt as DateTime),
      members: members == _undefined
          ? _instance.members
          : (members as List<Mutation$CreateTeam$createTeam$members>?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes members(
    Iterable<Mutation$CreateTeam$createTeam$members>? Function(
      Iterable<
        CopyWith$Mutation$CreateTeam$createTeam$members<
          Mutation$CreateTeam$createTeam$members
        >
      >?,
    )
    _fn,
  ) => call(
    members: _fn(
      _instance.members?.map(
        (e) => CopyWith$Mutation$CreateTeam$createTeam$members(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Mutation$CreateTeam$createTeam<TRes>
    implements CopyWith$Mutation$CreateTeam$createTeam<TRes> {
  _CopyWithStubImpl$Mutation$CreateTeam$createTeam(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? sport,
    String? description,
    String? joinCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Mutation$CreateTeam$createTeam$members>? members,
    String? $__typename,
  }) => _res;

  members(_fn) => _res;
}

class Mutation$CreateTeam$createTeam$members {
  Mutation$CreateTeam$createTeam$members({
    required this.id,
    required this.userId,
    required this.role,
    this.$__typename = 'TeamMember',
  });

  factory Mutation$CreateTeam$createTeam$members.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$userId = json['userId'];
    final l$role = json['role'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateTeam$createTeam$members(
      id: (l$id as String),
      userId: (l$userId as String),
      role: (l$role as List<dynamic>)
          .map((e) => fromJson$Enum$MemberRole((e as String)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String userId;

  final List<Enum$MemberRole> role;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$role = role;
    _resultData['role'] = l$role.map((e) => toJson$Enum$MemberRole(e)).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$userId = userId;
    final l$role = role;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$userId,
      Object.hashAll(l$role.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateTeam$createTeam$members ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role.length != lOther$role.length) {
      return false;
    }
    for (int i = 0; i < l$role.length; i++) {
      final l$role$entry = l$role[i];
      final lOther$role$entry = lOther$role[i];
      if (l$role$entry != lOther$role$entry) {
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

extension UtilityExtension$Mutation$CreateTeam$createTeam$members
    on Mutation$CreateTeam$createTeam$members {
  CopyWith$Mutation$CreateTeam$createTeam$members<
    Mutation$CreateTeam$createTeam$members
  >
  get copyWith =>
      CopyWith$Mutation$CreateTeam$createTeam$members(this, (i) => i);
}

abstract class CopyWith$Mutation$CreateTeam$createTeam$members<TRes> {
  factory CopyWith$Mutation$CreateTeam$createTeam$members(
    Mutation$CreateTeam$createTeam$members instance,
    TRes Function(Mutation$CreateTeam$createTeam$members) then,
  ) = _CopyWithImpl$Mutation$CreateTeam$createTeam$members;

  factory CopyWith$Mutation$CreateTeam$createTeam$members.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateTeam$createTeam$members;

  TRes call({
    String? id,
    String? userId,
    List<Enum$MemberRole>? role,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateTeam$createTeam$members<TRes>
    implements CopyWith$Mutation$CreateTeam$createTeam$members<TRes> {
  _CopyWithImpl$Mutation$CreateTeam$createTeam$members(
    this._instance,
    this._then,
  );

  final Mutation$CreateTeam$createTeam$members _instance;

  final TRes Function(Mutation$CreateTeam$createTeam$members) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? userId = _undefined,
    Object? role = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$CreateTeam$createTeam$members(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as List<Enum$MemberRole>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$CreateTeam$createTeam$members<TRes>
    implements CopyWith$Mutation$CreateTeam$createTeam$members<TRes> {
  _CopyWithStubImpl$Mutation$CreateTeam$createTeam$members(this._res);

  TRes _res;

  call({
    String? id,
    String? userId,
    List<Enum$MemberRole>? role,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$AddTeamMember {
  factory Variables$Mutation$AddTeamMember({
    required Input$AddTeamMemberInput input,
  }) => Variables$Mutation$AddTeamMember._({r'input': input});

  Variables$Mutation$AddTeamMember._(this._$data);

  factory Variables$Mutation$AddTeamMember.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$AddTeamMemberInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$AddTeamMember._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$AddTeamMemberInput get input =>
      (_$data['input'] as Input$AddTeamMemberInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$AddTeamMember<Variables$Mutation$AddTeamMember>
  get copyWith => CopyWith$Variables$Mutation$AddTeamMember(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$AddTeamMember ||
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

abstract class CopyWith$Variables$Mutation$AddTeamMember<TRes> {
  factory CopyWith$Variables$Mutation$AddTeamMember(
    Variables$Mutation$AddTeamMember instance,
    TRes Function(Variables$Mutation$AddTeamMember) then,
  ) = _CopyWithImpl$Variables$Mutation$AddTeamMember;

  factory CopyWith$Variables$Mutation$AddTeamMember.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$AddTeamMember;

  TRes call({Input$AddTeamMemberInput? input});
}

class _CopyWithImpl$Variables$Mutation$AddTeamMember<TRes>
    implements CopyWith$Variables$Mutation$AddTeamMember<TRes> {
  _CopyWithImpl$Variables$Mutation$AddTeamMember(this._instance, this._then);

  final Variables$Mutation$AddTeamMember _instance;

  final TRes Function(Variables$Mutation$AddTeamMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$AddTeamMember._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$AddTeamMemberInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$AddTeamMember<TRes>
    implements CopyWith$Variables$Mutation$AddTeamMember<TRes> {
  _CopyWithStubImpl$Variables$Mutation$AddTeamMember(this._res);

  TRes _res;

  call({Input$AddTeamMemberInput? input}) => _res;
}

class Mutation$AddTeamMember {
  Mutation$AddTeamMember({
    required this.addTeamMember,
    this.$__typename = 'Mutation',
  });

  factory Mutation$AddTeamMember.fromJson(Map<String, dynamic> json) {
    final l$addTeamMember = json['addTeamMember'];
    final l$$__typename = json['__typename'];
    return Mutation$AddTeamMember(
      addTeamMember: Mutation$AddTeamMember$addTeamMember.fromJson(
        (l$addTeamMember as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$AddTeamMember$addTeamMember addTeamMember;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$addTeamMember = addTeamMember;
    _resultData['addTeamMember'] = l$addTeamMember.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$addTeamMember = addTeamMember;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addTeamMember, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddTeamMember || runtimeType != other.runtimeType) {
      return false;
    }
    final l$addTeamMember = addTeamMember;
    final lOther$addTeamMember = other.addTeamMember;
    if (l$addTeamMember != lOther$addTeamMember) {
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

extension UtilityExtension$Mutation$AddTeamMember on Mutation$AddTeamMember {
  CopyWith$Mutation$AddTeamMember<Mutation$AddTeamMember> get copyWith =>
      CopyWith$Mutation$AddTeamMember(this, (i) => i);
}

abstract class CopyWith$Mutation$AddTeamMember<TRes> {
  factory CopyWith$Mutation$AddTeamMember(
    Mutation$AddTeamMember instance,
    TRes Function(Mutation$AddTeamMember) then,
  ) = _CopyWithImpl$Mutation$AddTeamMember;

  factory CopyWith$Mutation$AddTeamMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddTeamMember;

  TRes call({
    Mutation$AddTeamMember$addTeamMember? addTeamMember,
    String? $__typename,
  });
  CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> get addTeamMember;
}

class _CopyWithImpl$Mutation$AddTeamMember<TRes>
    implements CopyWith$Mutation$AddTeamMember<TRes> {
  _CopyWithImpl$Mutation$AddTeamMember(this._instance, this._then);

  final Mutation$AddTeamMember _instance;

  final TRes Function(Mutation$AddTeamMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? addTeamMember = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$AddTeamMember(
      addTeamMember: addTeamMember == _undefined || addTeamMember == null
          ? _instance.addTeamMember
          : (addTeamMember as Mutation$AddTeamMember$addTeamMember),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> get addTeamMember {
    final local$addTeamMember = _instance.addTeamMember;
    return CopyWith$Mutation$AddTeamMember$addTeamMember(
      local$addTeamMember,
      (e) => call(addTeamMember: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$AddTeamMember<TRes>
    implements CopyWith$Mutation$AddTeamMember<TRes> {
  _CopyWithStubImpl$Mutation$AddTeamMember(this._res);

  TRes _res;

  call({
    Mutation$AddTeamMember$addTeamMember? addTeamMember,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> get addTeamMember =>
      CopyWith$Mutation$AddTeamMember$addTeamMember.stub(_res);
}

const documentNodeMutationAddTeamMember = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddTeamMember'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'AddTeamMemberInput'),
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
            name: NameNode(value: 'addTeamMember'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'addMemberInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
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
                  name: NameNode(value: 'teamId'),
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
                  name: NameNode(value: 'role'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'joinedAt'),
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
  ],
);
Mutation$AddTeamMember _parserFn$Mutation$AddTeamMember(
  Map<String, dynamic> data,
) => Mutation$AddTeamMember.fromJson(data);
typedef OnMutationCompleted$Mutation$AddTeamMember =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$AddTeamMember?);

class Options$Mutation$AddTeamMember
    extends graphql.MutationOptions<Mutation$AddTeamMember> {
  Options$Mutation$AddTeamMember({
    String? operationName,
    required Variables$Mutation$AddTeamMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddTeamMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddTeamMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddTeamMember>? update,
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
                 data == null ? null : _parserFn$Mutation$AddTeamMember(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationAddTeamMember,
         parserFn: _parserFn$Mutation$AddTeamMember,
       );

  final OnMutationCompleted$Mutation$AddTeamMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$AddTeamMember
    extends graphql.WatchQueryOptions<Mutation$AddTeamMember> {
  WatchOptions$Mutation$AddTeamMember({
    String? operationName,
    required Variables$Mutation$AddTeamMember variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddTeamMember? typedOptimisticResult,
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
         document: documentNodeMutationAddTeamMember,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$AddTeamMember,
       );
}

extension ClientExtension$Mutation$AddTeamMember on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$AddTeamMember>> mutate$AddTeamMember(
    Options$Mutation$AddTeamMember options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$AddTeamMember> watchMutation$AddTeamMember(
    WatchOptions$Mutation$AddTeamMember options,
  ) => this.watchMutation(options);
}

class Mutation$AddTeamMember$HookResult {
  Mutation$AddTeamMember$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$AddTeamMember runMutation;

  final graphql.QueryResult<Mutation$AddTeamMember> result;
}

Mutation$AddTeamMember$HookResult useMutation$AddTeamMember([
  WidgetOptions$Mutation$AddTeamMember? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$AddTeamMember(),
  );
  return Mutation$AddTeamMember$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$AddTeamMember> useWatchMutation$AddTeamMember(
  WatchOptions$Mutation$AddTeamMember options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$AddTeamMember
    extends graphql.MutationOptions<Mutation$AddTeamMember> {
  WidgetOptions$Mutation$AddTeamMember({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$AddTeamMember? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$AddTeamMember? onCompleted,
    graphql.OnMutationUpdate<Mutation$AddTeamMember>? update,
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
                 data == null ? null : _parserFn$Mutation$AddTeamMember(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationAddTeamMember,
         parserFn: _parserFn$Mutation$AddTeamMember,
       );

  final OnMutationCompleted$Mutation$AddTeamMember? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$AddTeamMember =
    graphql.MultiSourceResult<Mutation$AddTeamMember> Function(
      Variables$Mutation$AddTeamMember, {
      Object? optimisticResult,
      Mutation$AddTeamMember? typedOptimisticResult,
    });
typedef Builder$Mutation$AddTeamMember =
    widgets.Widget Function(
      RunMutation$Mutation$AddTeamMember,
      graphql.QueryResult<Mutation$AddTeamMember>?,
    );

class Mutation$AddTeamMember$Widget
    extends graphql_flutter.Mutation<Mutation$AddTeamMember> {
  Mutation$AddTeamMember$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$AddTeamMember? options,
    required Builder$Mutation$AddTeamMember builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$AddTeamMember(),
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

class Mutation$AddTeamMember$addTeamMember {
  Mutation$AddTeamMember$addTeamMember({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.role,
    required this.joinedAt,
    this.$__typename = 'TeamMember',
  });

  factory Mutation$AddTeamMember$addTeamMember.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$role = json['role'];
    final l$joinedAt = json['joinedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$AddTeamMember$addTeamMember(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      role: (l$role as List<dynamic>)
          .map((e) => fromJson$Enum$MemberRole((e as String)))
          .toList(),
      joinedAt: DateTime.parse((l$joinedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final List<Enum$MemberRole> role;

  final DateTime joinedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$role = role;
    _resultData['role'] = l$role.map((e) => toJson$Enum$MemberRole(e)).toList();
    final l$joinedAt = joinedAt;
    _resultData['joinedAt'] = l$joinedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$role = role;
    final l$joinedAt = joinedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      Object.hashAll(l$role.map((v) => v)),
      l$joinedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$AddTeamMember$addTeamMember ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role.length != lOther$role.length) {
      return false;
    }
    for (int i = 0; i < l$role.length; i++) {
      final l$role$entry = l$role[i];
      final lOther$role$entry = lOther$role[i];
      if (l$role$entry != lOther$role$entry) {
        return false;
      }
    }
    final l$joinedAt = joinedAt;
    final lOther$joinedAt = other.joinedAt;
    if (l$joinedAt != lOther$joinedAt) {
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

extension UtilityExtension$Mutation$AddTeamMember$addTeamMember
    on Mutation$AddTeamMember$addTeamMember {
  CopyWith$Mutation$AddTeamMember$addTeamMember<
    Mutation$AddTeamMember$addTeamMember
  >
  get copyWith => CopyWith$Mutation$AddTeamMember$addTeamMember(this, (i) => i);
}

abstract class CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> {
  factory CopyWith$Mutation$AddTeamMember$addTeamMember(
    Mutation$AddTeamMember$addTeamMember instance,
    TRes Function(Mutation$AddTeamMember$addTeamMember) then,
  ) = _CopyWithImpl$Mutation$AddTeamMember$addTeamMember;

  factory CopyWith$Mutation$AddTeamMember$addTeamMember.stub(TRes res) =
      _CopyWithStubImpl$Mutation$AddTeamMember$addTeamMember;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    List<Enum$MemberRole>? role,
    DateTime? joinedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$AddTeamMember$addTeamMember<TRes>
    implements CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> {
  _CopyWithImpl$Mutation$AddTeamMember$addTeamMember(
    this._instance,
    this._then,
  );

  final Mutation$AddTeamMember$addTeamMember _instance;

  final TRes Function(Mutation$AddTeamMember$addTeamMember) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? role = _undefined,
    Object? joinedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$AddTeamMember$addTeamMember(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as List<Enum$MemberRole>),
      joinedAt: joinedAt == _undefined || joinedAt == null
          ? _instance.joinedAt
          : (joinedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$AddTeamMember$addTeamMember<TRes>
    implements CopyWith$Mutation$AddTeamMember$addTeamMember<TRes> {
  _CopyWithStubImpl$Mutation$AddTeamMember$addTeamMember(this._res);

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    List<Enum$MemberRole>? role,
    DateTime? joinedAt,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$JoinTeam {
  factory Variables$Mutation$JoinTeam({required Input$JoinTeamInput input}) =>
      Variables$Mutation$JoinTeam._({r'input': input});

  Variables$Mutation$JoinTeam._(this._$data);

  factory Variables$Mutation$JoinTeam.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$JoinTeamInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$JoinTeam._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$JoinTeamInput get input => (_$data['input'] as Input$JoinTeamInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$JoinTeam<Variables$Mutation$JoinTeam>
  get copyWith => CopyWith$Variables$Mutation$JoinTeam(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$JoinTeam ||
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

abstract class CopyWith$Variables$Mutation$JoinTeam<TRes> {
  factory CopyWith$Variables$Mutation$JoinTeam(
    Variables$Mutation$JoinTeam instance,
    TRes Function(Variables$Mutation$JoinTeam) then,
  ) = _CopyWithImpl$Variables$Mutation$JoinTeam;

  factory CopyWith$Variables$Mutation$JoinTeam.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$JoinTeam;

  TRes call({Input$JoinTeamInput? input});
}

class _CopyWithImpl$Variables$Mutation$JoinTeam<TRes>
    implements CopyWith$Variables$Mutation$JoinTeam<TRes> {
  _CopyWithImpl$Variables$Mutation$JoinTeam(this._instance, this._then);

  final Variables$Mutation$JoinTeam _instance;

  final TRes Function(Variables$Mutation$JoinTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$JoinTeam._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$JoinTeamInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$JoinTeam<TRes>
    implements CopyWith$Variables$Mutation$JoinTeam<TRes> {
  _CopyWithStubImpl$Variables$Mutation$JoinTeam(this._res);

  TRes _res;

  call({Input$JoinTeamInput? input}) => _res;
}

class Mutation$JoinTeam {
  Mutation$JoinTeam({required this.joinTeam, this.$__typename = 'Mutation'});

  factory Mutation$JoinTeam.fromJson(Map<String, dynamic> json) {
    final l$joinTeam = json['joinTeam'];
    final l$$__typename = json['__typename'];
    return Mutation$JoinTeam(
      joinTeam: Mutation$JoinTeam$joinTeam.fromJson(
        (l$joinTeam as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$JoinTeam$joinTeam joinTeam;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$joinTeam = joinTeam;
    _resultData['joinTeam'] = l$joinTeam.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$joinTeam = joinTeam;
    final l$$__typename = $__typename;
    return Object.hashAll([l$joinTeam, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$JoinTeam || runtimeType != other.runtimeType) {
      return false;
    }
    final l$joinTeam = joinTeam;
    final lOther$joinTeam = other.joinTeam;
    if (l$joinTeam != lOther$joinTeam) {
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

extension UtilityExtension$Mutation$JoinTeam on Mutation$JoinTeam {
  CopyWith$Mutation$JoinTeam<Mutation$JoinTeam> get copyWith =>
      CopyWith$Mutation$JoinTeam(this, (i) => i);
}

abstract class CopyWith$Mutation$JoinTeam<TRes> {
  factory CopyWith$Mutation$JoinTeam(
    Mutation$JoinTeam instance,
    TRes Function(Mutation$JoinTeam) then,
  ) = _CopyWithImpl$Mutation$JoinTeam;

  factory CopyWith$Mutation$JoinTeam.stub(TRes res) =
      _CopyWithStubImpl$Mutation$JoinTeam;

  TRes call({Mutation$JoinTeam$joinTeam? joinTeam, String? $__typename});
  CopyWith$Mutation$JoinTeam$joinTeam<TRes> get joinTeam;
}

class _CopyWithImpl$Mutation$JoinTeam<TRes>
    implements CopyWith$Mutation$JoinTeam<TRes> {
  _CopyWithImpl$Mutation$JoinTeam(this._instance, this._then);

  final Mutation$JoinTeam _instance;

  final TRes Function(Mutation$JoinTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? joinTeam = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$JoinTeam(
      joinTeam: joinTeam == _undefined || joinTeam == null
          ? _instance.joinTeam
          : (joinTeam as Mutation$JoinTeam$joinTeam),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$JoinTeam$joinTeam<TRes> get joinTeam {
    final local$joinTeam = _instance.joinTeam;
    return CopyWith$Mutation$JoinTeam$joinTeam(
      local$joinTeam,
      (e) => call(joinTeam: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$JoinTeam<TRes>
    implements CopyWith$Mutation$JoinTeam<TRes> {
  _CopyWithStubImpl$Mutation$JoinTeam(this._res);

  TRes _res;

  call({Mutation$JoinTeam$joinTeam? joinTeam, String? $__typename}) => _res;

  CopyWith$Mutation$JoinTeam$joinTeam<TRes> get joinTeam =>
      CopyWith$Mutation$JoinTeam$joinTeam.stub(_res);
}

const documentNodeMutationJoinTeam = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'JoinTeam'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'JoinTeamInput'),
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
            name: NameNode(value: 'joinTeam'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'joinTeamInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
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
                  name: NameNode(value: 'teamId'),
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
                  name: NameNode(value: 'role'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'joinedAt'),
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
  ],
);
Mutation$JoinTeam _parserFn$Mutation$JoinTeam(Map<String, dynamic> data) =>
    Mutation$JoinTeam.fromJson(data);
typedef OnMutationCompleted$Mutation$JoinTeam =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$JoinTeam?);

class Options$Mutation$JoinTeam
    extends graphql.MutationOptions<Mutation$JoinTeam> {
  Options$Mutation$JoinTeam({
    String? operationName,
    required Variables$Mutation$JoinTeam variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$JoinTeam? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$JoinTeam? onCompleted,
    graphql.OnMutationUpdate<Mutation$JoinTeam>? update,
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
                 data == null ? null : _parserFn$Mutation$JoinTeam(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationJoinTeam,
         parserFn: _parserFn$Mutation$JoinTeam,
       );

  final OnMutationCompleted$Mutation$JoinTeam? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$JoinTeam
    extends graphql.WatchQueryOptions<Mutation$JoinTeam> {
  WatchOptions$Mutation$JoinTeam({
    String? operationName,
    required Variables$Mutation$JoinTeam variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$JoinTeam? typedOptimisticResult,
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
         document: documentNodeMutationJoinTeam,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$JoinTeam,
       );
}

extension ClientExtension$Mutation$JoinTeam on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$JoinTeam>> mutate$JoinTeam(
    Options$Mutation$JoinTeam options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$JoinTeam> watchMutation$JoinTeam(
    WatchOptions$Mutation$JoinTeam options,
  ) => this.watchMutation(options);
}

class Mutation$JoinTeam$HookResult {
  Mutation$JoinTeam$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$JoinTeam runMutation;

  final graphql.QueryResult<Mutation$JoinTeam> result;
}

Mutation$JoinTeam$HookResult useMutation$JoinTeam([
  WidgetOptions$Mutation$JoinTeam? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$JoinTeam(),
  );
  return Mutation$JoinTeam$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$JoinTeam> useWatchMutation$JoinTeam(
  WatchOptions$Mutation$JoinTeam options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$JoinTeam
    extends graphql.MutationOptions<Mutation$JoinTeam> {
  WidgetOptions$Mutation$JoinTeam({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$JoinTeam? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$JoinTeam? onCompleted,
    graphql.OnMutationUpdate<Mutation$JoinTeam>? update,
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
                 data == null ? null : _parserFn$Mutation$JoinTeam(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationJoinTeam,
         parserFn: _parserFn$Mutation$JoinTeam,
       );

  final OnMutationCompleted$Mutation$JoinTeam? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$JoinTeam =
    graphql.MultiSourceResult<Mutation$JoinTeam> Function(
      Variables$Mutation$JoinTeam, {
      Object? optimisticResult,
      Mutation$JoinTeam? typedOptimisticResult,
    });
typedef Builder$Mutation$JoinTeam =
    widgets.Widget Function(
      RunMutation$Mutation$JoinTeam,
      graphql.QueryResult<Mutation$JoinTeam>?,
    );

class Mutation$JoinTeam$Widget
    extends graphql_flutter.Mutation<Mutation$JoinTeam> {
  Mutation$JoinTeam$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$JoinTeam? options,
    required Builder$Mutation$JoinTeam builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$JoinTeam(),
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

class Mutation$JoinTeam$joinTeam {
  Mutation$JoinTeam$joinTeam({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.role,
    required this.joinedAt,
    this.$__typename = 'TeamMember',
  });

  factory Mutation$JoinTeam$joinTeam.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$role = json['role'];
    final l$joinedAt = json['joinedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$JoinTeam$joinTeam(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      role: (l$role as List<dynamic>)
          .map((e) => fromJson$Enum$MemberRole((e as String)))
          .toList(),
      joinedAt: DateTime.parse((l$joinedAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final List<Enum$MemberRole> role;

  final DateTime joinedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$role = role;
    _resultData['role'] = l$role.map((e) => toJson$Enum$MemberRole(e)).toList();
    final l$joinedAt = joinedAt;
    _resultData['joinedAt'] = l$joinedAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$role = role;
    final l$joinedAt = joinedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      Object.hashAll(l$role.map((v) => v)),
      l$joinedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$JoinTeam$joinTeam ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role.length != lOther$role.length) {
      return false;
    }
    for (int i = 0; i < l$role.length; i++) {
      final l$role$entry = l$role[i];
      final lOther$role$entry = lOther$role[i];
      if (l$role$entry != lOther$role$entry) {
        return false;
      }
    }
    final l$joinedAt = joinedAt;
    final lOther$joinedAt = other.joinedAt;
    if (l$joinedAt != lOther$joinedAt) {
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

extension UtilityExtension$Mutation$JoinTeam$joinTeam
    on Mutation$JoinTeam$joinTeam {
  CopyWith$Mutation$JoinTeam$joinTeam<Mutation$JoinTeam$joinTeam>
  get copyWith => CopyWith$Mutation$JoinTeam$joinTeam(this, (i) => i);
}

abstract class CopyWith$Mutation$JoinTeam$joinTeam<TRes> {
  factory CopyWith$Mutation$JoinTeam$joinTeam(
    Mutation$JoinTeam$joinTeam instance,
    TRes Function(Mutation$JoinTeam$joinTeam) then,
  ) = _CopyWithImpl$Mutation$JoinTeam$joinTeam;

  factory CopyWith$Mutation$JoinTeam$joinTeam.stub(TRes res) =
      _CopyWithStubImpl$Mutation$JoinTeam$joinTeam;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    List<Enum$MemberRole>? role,
    DateTime? joinedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$JoinTeam$joinTeam<TRes>
    implements CopyWith$Mutation$JoinTeam$joinTeam<TRes> {
  _CopyWithImpl$Mutation$JoinTeam$joinTeam(this._instance, this._then);

  final Mutation$JoinTeam$joinTeam _instance;

  final TRes Function(Mutation$JoinTeam$joinTeam) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? role = _undefined,
    Object? joinedAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$JoinTeam$joinTeam(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as List<Enum$MemberRole>),
      joinedAt: joinedAt == _undefined || joinedAt == null
          ? _instance.joinedAt
          : (joinedAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$JoinTeam$joinTeam<TRes>
    implements CopyWith$Mutation$JoinTeam$joinTeam<TRes> {
  _CopyWithStubImpl$Mutation$JoinTeam$joinTeam(this._res);

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    List<Enum$MemberRole>? role,
    DateTime? joinedAt,
    String? $__typename,
  }) => _res;
}
