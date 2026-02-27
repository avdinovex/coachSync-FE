import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetMessages {
  factory Variables$Query$GetMessages({required String teamId, int? limit}) =>
      Variables$Query$GetMessages._({
        r'teamId': teamId,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$GetMessages._(this._$data);

  factory Variables$Query$GetMessages.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$GetMessages._(result$data);
  }

  Map<String, dynamic> _$data;

  String get teamId => (_$data['teamId'] as String);

  int? get limit => (_$data['limit'] as int?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetMessages<Variables$Query$GetMessages>
  get copyWith => CopyWith$Variables$Query$GetMessages(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetMessages ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$teamId = teamId;
    final l$limit = limit;
    return Object.hashAll([
      l$teamId,
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetMessages<TRes> {
  factory CopyWith$Variables$Query$GetMessages(
    Variables$Query$GetMessages instance,
    TRes Function(Variables$Query$GetMessages) then,
  ) = _CopyWithImpl$Variables$Query$GetMessages;

  factory CopyWith$Variables$Query$GetMessages.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetMessages;

  TRes call({String? teamId, int? limit});
}

class _CopyWithImpl$Variables$Query$GetMessages<TRes>
    implements CopyWith$Variables$Query$GetMessages<TRes> {
  _CopyWithImpl$Variables$Query$GetMessages(this._instance, this._then);

  final Variables$Query$GetMessages _instance;

  final TRes Function(Variables$Query$GetMessages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? teamId = _undefined, Object? limit = _undefined}) => _then(
    Variables$Query$GetMessages._({
      ..._instance._$data,
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
      if (limit != _undefined) 'limit': (limit as int?),
    }),
  );
}

class _CopyWithStubImpl$Variables$Query$GetMessages<TRes>
    implements CopyWith$Variables$Query$GetMessages<TRes> {
  _CopyWithStubImpl$Variables$Query$GetMessages(this._res);

  TRes _res;

  call({String? teamId, int? limit}) => _res;
}

class Query$GetMessages {
  Query$GetMessages({required this.messages, this.$__typename = 'Query'});

  factory Query$GetMessages.fromJson(Map<String, dynamic> json) {
    final l$messages = json['messages'];
    final l$$__typename = json['__typename'];
    return Query$GetMessages(
      messages: (l$messages as List<dynamic>)
          .map(
            (e) => Query$GetMessages$messages.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetMessages$messages> messages;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$messages = messages;
    _resultData['messages'] = l$messages.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$messages = messages;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$messages.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMessages || runtimeType != other.runtimeType) {
      return false;
    }
    final l$messages = messages;
    final lOther$messages = other.messages;
    if (l$messages.length != lOther$messages.length) {
      return false;
    }
    for (int i = 0; i < l$messages.length; i++) {
      final l$messages$entry = l$messages[i];
      final lOther$messages$entry = lOther$messages[i];
      if (l$messages$entry != lOther$messages$entry) {
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

extension UtilityExtension$Query$GetMessages on Query$GetMessages {
  CopyWith$Query$GetMessages<Query$GetMessages> get copyWith =>
      CopyWith$Query$GetMessages(this, (i) => i);
}

abstract class CopyWith$Query$GetMessages<TRes> {
  factory CopyWith$Query$GetMessages(
    Query$GetMessages instance,
    TRes Function(Query$GetMessages) then,
  ) = _CopyWithImpl$Query$GetMessages;

  factory CopyWith$Query$GetMessages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMessages;

  TRes call({List<Query$GetMessages$messages>? messages, String? $__typename});
  TRes messages(
    Iterable<Query$GetMessages$messages> Function(
      Iterable<CopyWith$Query$GetMessages$messages<Query$GetMessages$messages>>,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetMessages<TRes>
    implements CopyWith$Query$GetMessages<TRes> {
  _CopyWithImpl$Query$GetMessages(this._instance, this._then);

  final Query$GetMessages _instance;

  final TRes Function(Query$GetMessages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? messages = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMessages(
      messages: messages == _undefined || messages == null
          ? _instance.messages
          : (messages as List<Query$GetMessages$messages>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes messages(
    Iterable<Query$GetMessages$messages> Function(
      Iterable<CopyWith$Query$GetMessages$messages<Query$GetMessages$messages>>,
    )
    _fn,
  ) => call(
    messages: _fn(
      _instance.messages.map(
        (e) => CopyWith$Query$GetMessages$messages(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetMessages<TRes>
    implements CopyWith$Query$GetMessages<TRes> {
  _CopyWithStubImpl$Query$GetMessages(this._res);

  TRes _res;

  call({List<Query$GetMessages$messages>? messages, String? $__typename}) =>
      _res;

  messages(_fn) => _res;
}

const documentNodeQueryGetMessages = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetMessages'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'teamId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'limit')),
          type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'messages'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'teamId'),
                value: VariableNode(name: NameNode(value: 'teamId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'limit'),
                value: VariableNode(name: NameNode(value: 'limit')),
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
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'messageType'),
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
                  name: NameNode(value: 'isEdited'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isDeletedForEveryone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'editedAt'),
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
  ],
);
Query$GetMessages _parserFn$Query$GetMessages(Map<String, dynamic> data) =>
    Query$GetMessages.fromJson(data);
typedef OnQueryComplete$Query$GetMessages =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetMessages?);

class Options$Query$GetMessages
    extends graphql.QueryOptions<Query$GetMessages> {
  Options$Query$GetMessages({
    String? operationName,
    required Variables$Query$GetMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMessages? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMessages? onComplete,
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
                 data == null ? null : _parserFn$Query$GetMessages(data),
               ),
         onError: onError,
         document: documentNodeQueryGetMessages,
         parserFn: _parserFn$Query$GetMessages,
       );

  final OnQueryComplete$Query$GetMessages? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetMessages
    extends graphql.WatchQueryOptions<Query$GetMessages> {
  WatchOptions$Query$GetMessages({
    String? operationName,
    required Variables$Query$GetMessages variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMessages? typedOptimisticResult,
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
         document: documentNodeQueryGetMessages,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetMessages,
       );
}

class FetchMoreOptions$Query$GetMessages extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMessages({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetMessages variables,
  }) : super(
         updateQuery: updateQuery,
         variables: variables.toJson(),
         document: documentNodeQueryGetMessages,
       );
}

extension ClientExtension$Query$GetMessages on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMessages>> query$GetMessages(
    Options$Query$GetMessages options,
  ) async => await this.query(options);

  graphql.ObservableQuery<Query$GetMessages> watchQuery$GetMessages(
    WatchOptions$Query$GetMessages options,
  ) => this.watchQuery(options);

  void writeQuery$GetMessages({
    required Query$GetMessages data,
    required Variables$Query$GetMessages variables,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetMessages),
      variables: variables.toJson(),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetMessages? readQuery$GetMessages({
    required Variables$Query$GetMessages variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetMessages),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMessages.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMessages> useQuery$GetMessages(
  Options$Query$GetMessages options,
) => graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetMessages> useWatchQuery$GetMessages(
  WatchOptions$Query$GetMessages options,
) => graphql_flutter.useWatchQuery(options);

class Query$GetMessages$Widget
    extends graphql_flutter.Query<Query$GetMessages> {
  Query$GetMessages$Widget({
    widgets.Key? key,
    required Options$Query$GetMessages options,
    required graphql_flutter.QueryBuilder<Query$GetMessages> builder,
  }) : super(key: key, options: options, builder: builder);
}

class Query$GetMessages$messages {
  Query$GetMessages$messages({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.content,
    required this.messageType,
    this.metadata,
    required this.isEdited,
    required this.isDeletedForEveryone,
    this.editedAt,
    required this.createdAt,
    this.user,
    this.$__typename = 'Message',
  });

  factory Query$GetMessages$messages.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$messageType = json['messageType'];
    final l$metadata = json['metadata'];
    final l$isEdited = json['isEdited'];
    final l$isDeletedForEveryone = json['isDeletedForEveryone'];
    final l$editedAt = json['editedAt'];
    final l$createdAt = json['createdAt'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetMessages$messages(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      content: (l$content as String),
      messageType: (l$messageType as String),
      metadata: (l$metadata as Map<String, dynamic>?),
      isEdited: (l$isEdited as bool),
      isDeletedForEveryone: (l$isDeletedForEveryone as bool),
      editedAt: l$editedAt == null
          ? null
          : DateTime.parse((l$editedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      user: l$user == null
          ? null
          : Query$GetMessages$messages$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final String content;

  final String messageType;

  final Map<String, dynamic>? metadata;

  final bool isEdited;

  final bool isDeletedForEveryone;

  final DateTime? editedAt;

  final DateTime createdAt;

  final Query$GetMessages$messages$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$messageType = messageType;
    _resultData['messageType'] = l$messageType;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$isEdited = isEdited;
    _resultData['isEdited'] = l$isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    _resultData['isDeletedForEveryone'] = l$isDeletedForEveryone;
    final l$editedAt = editedAt;
    _resultData['editedAt'] = l$editedAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$content = content;
    final l$messageType = messageType;
    final l$metadata = metadata;
    final l$isEdited = isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final l$editedAt = editedAt;
    final l$createdAt = createdAt;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      l$content,
      l$messageType,
      l$metadata,
      l$isEdited,
      l$isDeletedForEveryone,
      l$editedAt,
      l$createdAt,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetMessages$messages ||
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
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$messageType = messageType;
    final lOther$messageType = other.messageType;
    if (l$messageType != lOther$messageType) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$isEdited = isEdited;
    final lOther$isEdited = other.isEdited;
    if (l$isEdited != lOther$isEdited) {
      return false;
    }
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final lOther$isDeletedForEveryone = other.isDeletedForEveryone;
    if (l$isDeletedForEveryone != lOther$isDeletedForEveryone) {
      return false;
    }
    final l$editedAt = editedAt;
    final lOther$editedAt = other.editedAt;
    if (l$editedAt != lOther$editedAt) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
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

extension UtilityExtension$Query$GetMessages$messages
    on Query$GetMessages$messages {
  CopyWith$Query$GetMessages$messages<Query$GetMessages$messages>
  get copyWith => CopyWith$Query$GetMessages$messages(this, (i) => i);
}

abstract class CopyWith$Query$GetMessages$messages<TRes> {
  factory CopyWith$Query$GetMessages$messages(
    Query$GetMessages$messages instance,
    TRes Function(Query$GetMessages$messages) then,
  ) = _CopyWithImpl$Query$GetMessages$messages;

  factory CopyWith$Query$GetMessages$messages.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMessages$messages;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Query$GetMessages$messages$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetMessages$messages$user<TRes> get user;
}

class _CopyWithImpl$Query$GetMessages$messages<TRes>
    implements CopyWith$Query$GetMessages$messages<TRes> {
  _CopyWithImpl$Query$GetMessages$messages(this._instance, this._then);

  final Query$GetMessages$messages _instance;

  final TRes Function(Query$GetMessages$messages) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? messageType = _undefined,
    Object? metadata = _undefined,
    Object? isEdited = _undefined,
    Object? isDeletedForEveryone = _undefined,
    Object? editedAt = _undefined,
    Object? createdAt = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMessages$messages(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      messageType: messageType == _undefined || messageType == null
          ? _instance.messageType
          : (messageType as String),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      isEdited: isEdited == _undefined || isEdited == null
          ? _instance.isEdited
          : (isEdited as bool),
      isDeletedForEveryone:
          isDeletedForEveryone == _undefined || isDeletedForEveryone == null
          ? _instance.isDeletedForEveryone
          : (isDeletedForEveryone as bool),
      editedAt: editedAt == _undefined
          ? _instance.editedAt
          : (editedAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      user: user == _undefined
          ? _instance.user
          : (user as Query$GetMessages$messages$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetMessages$messages$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetMessages$messages$user.stub(_then(_instance))
        : CopyWith$Query$GetMessages$messages$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetMessages$messages<TRes>
    implements CopyWith$Query$GetMessages$messages<TRes> {
  _CopyWithStubImpl$Query$GetMessages$messages(this._res);

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Query$GetMessages$messages$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetMessages$messages$user<TRes> get user =>
      CopyWith$Query$GetMessages$messages$user.stub(_res);
}

class Query$GetMessages$messages$user {
  Query$GetMessages$messages$user({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.$__typename = 'User',
  });

  factory Query$GetMessages$messages$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Query$GetMessages$messages$user(
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
    if (other is! Query$GetMessages$messages$user ||
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

extension UtilityExtension$Query$GetMessages$messages$user
    on Query$GetMessages$messages$user {
  CopyWith$Query$GetMessages$messages$user<Query$GetMessages$messages$user>
  get copyWith => CopyWith$Query$GetMessages$messages$user(this, (i) => i);
}

abstract class CopyWith$Query$GetMessages$messages$user<TRes> {
  factory CopyWith$Query$GetMessages$messages$user(
    Query$GetMessages$messages$user instance,
    TRes Function(Query$GetMessages$messages$user) then,
  ) = _CopyWithImpl$Query$GetMessages$messages$user;

  factory CopyWith$Query$GetMessages$messages$user.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMessages$messages$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMessages$messages$user<TRes>
    implements CopyWith$Query$GetMessages$messages$user<TRes> {
  _CopyWithImpl$Query$GetMessages$messages$user(this._instance, this._then);

  final Query$GetMessages$messages$user _instance;

  final TRes Function(Query$GetMessages$messages$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetMessages$messages$user(
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

class _CopyWithStubImpl$Query$GetMessages$messages$user<TRes>
    implements CopyWith$Query$GetMessages$messages$user<TRes> {
  _CopyWithStubImpl$Query$GetMessages$messages$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$SendMessage {
  factory Variables$Mutation$SendMessage({
    required Input$SendMessageInput input,
  }) => Variables$Mutation$SendMessage._({r'input': input});

  Variables$Mutation$SendMessage._(this._$data);

  factory Variables$Mutation$SendMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$SendMessageInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$SendMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SendMessageInput get input =>
      (_$data['input'] as Input$SendMessageInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$SendMessage<Variables$Mutation$SendMessage>
  get copyWith => CopyWith$Variables$Mutation$SendMessage(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$SendMessage ||
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

abstract class CopyWith$Variables$Mutation$SendMessage<TRes> {
  factory CopyWith$Variables$Mutation$SendMessage(
    Variables$Mutation$SendMessage instance,
    TRes Function(Variables$Mutation$SendMessage) then,
  ) = _CopyWithImpl$Variables$Mutation$SendMessage;

  factory CopyWith$Variables$Mutation$SendMessage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SendMessage;

  TRes call({Input$SendMessageInput? input});
}

class _CopyWithImpl$Variables$Mutation$SendMessage<TRes>
    implements CopyWith$Variables$Mutation$SendMessage<TRes> {
  _CopyWithImpl$Variables$Mutation$SendMessage(this._instance, this._then);

  final Variables$Mutation$SendMessage _instance;

  final TRes Function(Variables$Mutation$SendMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$SendMessage._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$SendMessageInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$SendMessage<TRes>
    implements CopyWith$Variables$Mutation$SendMessage<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SendMessage(this._res);

  TRes _res;

  call({Input$SendMessageInput? input}) => _res;
}

class Mutation$SendMessage {
  Mutation$SendMessage({
    required this.sendMessage,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SendMessage.fromJson(Map<String, dynamic> json) {
    final l$sendMessage = json['sendMessage'];
    final l$$__typename = json['__typename'];
    return Mutation$SendMessage(
      sendMessage: Mutation$SendMessage$sendMessage.fromJson(
        (l$sendMessage as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SendMessage$sendMessage sendMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$sendMessage = sendMessage;
    _resultData['sendMessage'] = l$sendMessage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$sendMessage = sendMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$sendMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SendMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$sendMessage = sendMessage;
    final lOther$sendMessage = other.sendMessage;
    if (l$sendMessage != lOther$sendMessage) {
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

extension UtilityExtension$Mutation$SendMessage on Mutation$SendMessage {
  CopyWith$Mutation$SendMessage<Mutation$SendMessage> get copyWith =>
      CopyWith$Mutation$SendMessage(this, (i) => i);
}

abstract class CopyWith$Mutation$SendMessage<TRes> {
  factory CopyWith$Mutation$SendMessage(
    Mutation$SendMessage instance,
    TRes Function(Mutation$SendMessage) then,
  ) = _CopyWithImpl$Mutation$SendMessage;

  factory CopyWith$Mutation$SendMessage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SendMessage;

  TRes call({
    Mutation$SendMessage$sendMessage? sendMessage,
    String? $__typename,
  });
  CopyWith$Mutation$SendMessage$sendMessage<TRes> get sendMessage;
}

class _CopyWithImpl$Mutation$SendMessage<TRes>
    implements CopyWith$Mutation$SendMessage<TRes> {
  _CopyWithImpl$Mutation$SendMessage(this._instance, this._then);

  final Mutation$SendMessage _instance;

  final TRes Function(Mutation$SendMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? sendMessage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SendMessage(
      sendMessage: sendMessage == _undefined || sendMessage == null
          ? _instance.sendMessage
          : (sendMessage as Mutation$SendMessage$sendMessage),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$SendMessage$sendMessage<TRes> get sendMessage {
    final local$sendMessage = _instance.sendMessage;
    return CopyWith$Mutation$SendMessage$sendMessage(
      local$sendMessage,
      (e) => call(sendMessage: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$SendMessage<TRes>
    implements CopyWith$Mutation$SendMessage<TRes> {
  _CopyWithStubImpl$Mutation$SendMessage(this._res);

  TRes _res;

  call({Mutation$SendMessage$sendMessage? sendMessage, String? $__typename}) =>
      _res;

  CopyWith$Mutation$SendMessage$sendMessage<TRes> get sendMessage =>
      CopyWith$Mutation$SendMessage$sendMessage.stub(_res);
}

const documentNodeMutationSendMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'SendMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'SendMessageInput'),
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
            name: NameNode(value: 'sendMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'sendMessageInput'),
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
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'messageType'),
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
                  name: NameNode(value: 'isEdited'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isDeletedForEveryone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'editedAt'),
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
  ],
);
Mutation$SendMessage _parserFn$Mutation$SendMessage(
  Map<String, dynamic> data,
) => Mutation$SendMessage.fromJson(data);
typedef OnMutationCompleted$Mutation$SendMessage =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$SendMessage?);

class Options$Mutation$SendMessage
    extends graphql.MutationOptions<Mutation$SendMessage> {
  Options$Mutation$SendMessage({
    String? operationName,
    required Variables$Mutation$SendMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SendMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$SendMessage>? update,
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
                 data == null ? null : _parserFn$Mutation$SendMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSendMessage,
         parserFn: _parserFn$Mutation$SendMessage,
       );

  final OnMutationCompleted$Mutation$SendMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$SendMessage
    extends graphql.WatchQueryOptions<Mutation$SendMessage> {
  WatchOptions$Mutation$SendMessage({
    String? operationName,
    required Variables$Mutation$SendMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendMessage? typedOptimisticResult,
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
         document: documentNodeMutationSendMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$SendMessage,
       );
}

extension ClientExtension$Mutation$SendMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SendMessage>> mutate$SendMessage(
    Options$Mutation$SendMessage options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$SendMessage> watchMutation$SendMessage(
    WatchOptions$Mutation$SendMessage options,
  ) => this.watchMutation(options);
}

class Mutation$SendMessage$HookResult {
  Mutation$SendMessage$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$SendMessage runMutation;

  final graphql.QueryResult<Mutation$SendMessage> result;
}

Mutation$SendMessage$HookResult useMutation$SendMessage([
  WidgetOptions$Mutation$SendMessage? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$SendMessage(),
  );
  return Mutation$SendMessage$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SendMessage> useWatchMutation$SendMessage(
  WatchOptions$Mutation$SendMessage options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SendMessage
    extends graphql.MutationOptions<Mutation$SendMessage> {
  WidgetOptions$Mutation$SendMessage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SendMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SendMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$SendMessage>? update,
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
                 data == null ? null : _parserFn$Mutation$SendMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSendMessage,
         parserFn: _parserFn$Mutation$SendMessage,
       );

  final OnMutationCompleted$Mutation$SendMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$SendMessage =
    graphql.MultiSourceResult<Mutation$SendMessage> Function(
      Variables$Mutation$SendMessage, {
      Object? optimisticResult,
      Mutation$SendMessage? typedOptimisticResult,
    });
typedef Builder$Mutation$SendMessage =
    widgets.Widget Function(
      RunMutation$Mutation$SendMessage,
      graphql.QueryResult<Mutation$SendMessage>?,
    );

class Mutation$SendMessage$Widget
    extends graphql_flutter.Mutation<Mutation$SendMessage> {
  Mutation$SendMessage$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SendMessage? options,
    required Builder$Mutation$SendMessage builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$SendMessage(),
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

class Mutation$SendMessage$sendMessage {
  Mutation$SendMessage$sendMessage({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.content,
    required this.messageType,
    this.metadata,
    required this.isEdited,
    required this.isDeletedForEveryone,
    this.editedAt,
    required this.createdAt,
    this.user,
    this.$__typename = 'Message',
  });

  factory Mutation$SendMessage$sendMessage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$messageType = json['messageType'];
    final l$metadata = json['metadata'];
    final l$isEdited = json['isEdited'];
    final l$isDeletedForEveryone = json['isDeletedForEveryone'];
    final l$editedAt = json['editedAt'];
    final l$createdAt = json['createdAt'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$SendMessage$sendMessage(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      content: (l$content as String),
      messageType: (l$messageType as String),
      metadata: (l$metadata as Map<String, dynamic>?),
      isEdited: (l$isEdited as bool),
      isDeletedForEveryone: (l$isDeletedForEveryone as bool),
      editedAt: l$editedAt == null
          ? null
          : DateTime.parse((l$editedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      user: l$user == null
          ? null
          : Mutation$SendMessage$sendMessage$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final String content;

  final String messageType;

  final Map<String, dynamic>? metadata;

  final bool isEdited;

  final bool isDeletedForEveryone;

  final DateTime? editedAt;

  final DateTime createdAt;

  final Mutation$SendMessage$sendMessage$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$messageType = messageType;
    _resultData['messageType'] = l$messageType;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$isEdited = isEdited;
    _resultData['isEdited'] = l$isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    _resultData['isDeletedForEveryone'] = l$isDeletedForEveryone;
    final l$editedAt = editedAt;
    _resultData['editedAt'] = l$editedAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$content = content;
    final l$messageType = messageType;
    final l$metadata = metadata;
    final l$isEdited = isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final l$editedAt = editedAt;
    final l$createdAt = createdAt;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      l$content,
      l$messageType,
      l$metadata,
      l$isEdited,
      l$isDeletedForEveryone,
      l$editedAt,
      l$createdAt,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$SendMessage$sendMessage ||
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
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$messageType = messageType;
    final lOther$messageType = other.messageType;
    if (l$messageType != lOther$messageType) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$isEdited = isEdited;
    final lOther$isEdited = other.isEdited;
    if (l$isEdited != lOther$isEdited) {
      return false;
    }
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final lOther$isDeletedForEveryone = other.isDeletedForEveryone;
    if (l$isDeletedForEveryone != lOther$isDeletedForEveryone) {
      return false;
    }
    final l$editedAt = editedAt;
    final lOther$editedAt = other.editedAt;
    if (l$editedAt != lOther$editedAt) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
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

extension UtilityExtension$Mutation$SendMessage$sendMessage
    on Mutation$SendMessage$sendMessage {
  CopyWith$Mutation$SendMessage$sendMessage<Mutation$SendMessage$sendMessage>
  get copyWith => CopyWith$Mutation$SendMessage$sendMessage(this, (i) => i);
}

abstract class CopyWith$Mutation$SendMessage$sendMessage<TRes> {
  factory CopyWith$Mutation$SendMessage$sendMessage(
    Mutation$SendMessage$sendMessage instance,
    TRes Function(Mutation$SendMessage$sendMessage) then,
  ) = _CopyWithImpl$Mutation$SendMessage$sendMessage;

  factory CopyWith$Mutation$SendMessage$sendMessage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SendMessage$sendMessage;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Mutation$SendMessage$sendMessage$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$SendMessage$sendMessage$user<TRes> get user;
}

class _CopyWithImpl$Mutation$SendMessage$sendMessage<TRes>
    implements CopyWith$Mutation$SendMessage$sendMessage<TRes> {
  _CopyWithImpl$Mutation$SendMessage$sendMessage(this._instance, this._then);

  final Mutation$SendMessage$sendMessage _instance;

  final TRes Function(Mutation$SendMessage$sendMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? messageType = _undefined,
    Object? metadata = _undefined,
    Object? isEdited = _undefined,
    Object? isDeletedForEveryone = _undefined,
    Object? editedAt = _undefined,
    Object? createdAt = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SendMessage$sendMessage(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      messageType: messageType == _undefined || messageType == null
          ? _instance.messageType
          : (messageType as String),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      isEdited: isEdited == _undefined || isEdited == null
          ? _instance.isEdited
          : (isEdited as bool),
      isDeletedForEveryone:
          isDeletedForEveryone == _undefined || isDeletedForEveryone == null
          ? _instance.isDeletedForEveryone
          : (isDeletedForEveryone as bool),
      editedAt: editedAt == _undefined
          ? _instance.editedAt
          : (editedAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      user: user == _undefined
          ? _instance.user
          : (user as Mutation$SendMessage$sendMessage$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$SendMessage$sendMessage$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Mutation$SendMessage$sendMessage$user.stub(_then(_instance))
        : CopyWith$Mutation$SendMessage$sendMessage$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$SendMessage$sendMessage<TRes>
    implements CopyWith$Mutation$SendMessage$sendMessage<TRes> {
  _CopyWithStubImpl$Mutation$SendMessage$sendMessage(this._res);

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Mutation$SendMessage$sendMessage$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$SendMessage$sendMessage$user<TRes> get user =>
      CopyWith$Mutation$SendMessage$sendMessage$user.stub(_res);
}

class Mutation$SendMessage$sendMessage$user {
  Mutation$SendMessage$sendMessage$user({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$SendMessage$sendMessage$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$SendMessage$sendMessage$user(
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
    if (other is! Mutation$SendMessage$sendMessage$user ||
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

extension UtilityExtension$Mutation$SendMessage$sendMessage$user
    on Mutation$SendMessage$sendMessage$user {
  CopyWith$Mutation$SendMessage$sendMessage$user<
    Mutation$SendMessage$sendMessage$user
  >
  get copyWith =>
      CopyWith$Mutation$SendMessage$sendMessage$user(this, (i) => i);
}

abstract class CopyWith$Mutation$SendMessage$sendMessage$user<TRes> {
  factory CopyWith$Mutation$SendMessage$sendMessage$user(
    Mutation$SendMessage$sendMessage$user instance,
    TRes Function(Mutation$SendMessage$sendMessage$user) then,
  ) = _CopyWithImpl$Mutation$SendMessage$sendMessage$user;

  factory CopyWith$Mutation$SendMessage$sendMessage$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SendMessage$sendMessage$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SendMessage$sendMessage$user<TRes>
    implements CopyWith$Mutation$SendMessage$sendMessage$user<TRes> {
  _CopyWithImpl$Mutation$SendMessage$sendMessage$user(
    this._instance,
    this._then,
  );

  final Mutation$SendMessage$sendMessage$user _instance;

  final TRes Function(Mutation$SendMessage$sendMessage$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$SendMessage$sendMessage$user(
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

class _CopyWithStubImpl$Mutation$SendMessage$sendMessage$user<TRes>
    implements CopyWith$Mutation$SendMessage$sendMessage$user<TRes> {
  _CopyWithStubImpl$Mutation$SendMessage$sendMessage$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$EditMessage {
  factory Variables$Mutation$EditMessage({
    required Input$EditMessageInput input,
  }) => Variables$Mutation$EditMessage._({r'input': input});

  Variables$Mutation$EditMessage._(this._$data);

  factory Variables$Mutation$EditMessage.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$EditMessageInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$EditMessage._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$EditMessageInput get input =>
      (_$data['input'] as Input$EditMessageInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$EditMessage<Variables$Mutation$EditMessage>
  get copyWith => CopyWith$Variables$Mutation$EditMessage(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$EditMessage ||
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

abstract class CopyWith$Variables$Mutation$EditMessage<TRes> {
  factory CopyWith$Variables$Mutation$EditMessage(
    Variables$Mutation$EditMessage instance,
    TRes Function(Variables$Mutation$EditMessage) then,
  ) = _CopyWithImpl$Variables$Mutation$EditMessage;

  factory CopyWith$Variables$Mutation$EditMessage.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$EditMessage;

  TRes call({Input$EditMessageInput? input});
}

class _CopyWithImpl$Variables$Mutation$EditMessage<TRes>
    implements CopyWith$Variables$Mutation$EditMessage<TRes> {
  _CopyWithImpl$Variables$Mutation$EditMessage(this._instance, this._then);

  final Variables$Mutation$EditMessage _instance;

  final TRes Function(Variables$Mutation$EditMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$EditMessage._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$EditMessageInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$EditMessage<TRes>
    implements CopyWith$Variables$Mutation$EditMessage<TRes> {
  _CopyWithStubImpl$Variables$Mutation$EditMessage(this._res);

  TRes _res;

  call({Input$EditMessageInput? input}) => _res;
}

class Mutation$EditMessage {
  Mutation$EditMessage({
    required this.editMessage,
    this.$__typename = 'Mutation',
  });

  factory Mutation$EditMessage.fromJson(Map<String, dynamic> json) {
    final l$editMessage = json['editMessage'];
    final l$$__typename = json['__typename'];
    return Mutation$EditMessage(
      editMessage: Mutation$EditMessage$editMessage.fromJson(
        (l$editMessage as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$EditMessage$editMessage editMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$editMessage = editMessage;
    _resultData['editMessage'] = l$editMessage.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$editMessage = editMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$editMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$EditMessage || runtimeType != other.runtimeType) {
      return false;
    }
    final l$editMessage = editMessage;
    final lOther$editMessage = other.editMessage;
    if (l$editMessage != lOther$editMessage) {
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

extension UtilityExtension$Mutation$EditMessage on Mutation$EditMessage {
  CopyWith$Mutation$EditMessage<Mutation$EditMessage> get copyWith =>
      CopyWith$Mutation$EditMessage(this, (i) => i);
}

abstract class CopyWith$Mutation$EditMessage<TRes> {
  factory CopyWith$Mutation$EditMessage(
    Mutation$EditMessage instance,
    TRes Function(Mutation$EditMessage) then,
  ) = _CopyWithImpl$Mutation$EditMessage;

  factory CopyWith$Mutation$EditMessage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditMessage;

  TRes call({
    Mutation$EditMessage$editMessage? editMessage,
    String? $__typename,
  });
  CopyWith$Mutation$EditMessage$editMessage<TRes> get editMessage;
}

class _CopyWithImpl$Mutation$EditMessage<TRes>
    implements CopyWith$Mutation$EditMessage<TRes> {
  _CopyWithImpl$Mutation$EditMessage(this._instance, this._then);

  final Mutation$EditMessage _instance;

  final TRes Function(Mutation$EditMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? editMessage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$EditMessage(
      editMessage: editMessage == _undefined || editMessage == null
          ? _instance.editMessage
          : (editMessage as Mutation$EditMessage$editMessage),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$EditMessage$editMessage<TRes> get editMessage {
    final local$editMessage = _instance.editMessage;
    return CopyWith$Mutation$EditMessage$editMessage(
      local$editMessage,
      (e) => call(editMessage: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$EditMessage<TRes>
    implements CopyWith$Mutation$EditMessage<TRes> {
  _CopyWithStubImpl$Mutation$EditMessage(this._res);

  TRes _res;

  call({Mutation$EditMessage$editMessage? editMessage, String? $__typename}) =>
      _res;

  CopyWith$Mutation$EditMessage$editMessage<TRes> get editMessage =>
      CopyWith$Mutation$EditMessage$editMessage.stub(_res);
}

const documentNodeMutationEditMessage = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'EditMessage'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'EditMessageInput'),
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
            name: NameNode(value: 'editMessage'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'editMessageInput'),
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
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'messageType'),
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
                  name: NameNode(value: 'isEdited'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isDeletedForEveryone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'editedAt'),
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
  ],
);
Mutation$EditMessage _parserFn$Mutation$EditMessage(
  Map<String, dynamic> data,
) => Mutation$EditMessage.fromJson(data);
typedef OnMutationCompleted$Mutation$EditMessage =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$EditMessage?);

class Options$Mutation$EditMessage
    extends graphql.MutationOptions<Mutation$EditMessage> {
  Options$Mutation$EditMessage({
    String? operationName,
    required Variables$Mutation$EditMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EditMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$EditMessage>? update,
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
                 data == null ? null : _parserFn$Mutation$EditMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationEditMessage,
         parserFn: _parserFn$Mutation$EditMessage,
       );

  final OnMutationCompleted$Mutation$EditMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$EditMessage
    extends graphql.WatchQueryOptions<Mutation$EditMessage> {
  WatchOptions$Mutation$EditMessage({
    String? operationName,
    required Variables$Mutation$EditMessage variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditMessage? typedOptimisticResult,
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
         document: documentNodeMutationEditMessage,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$EditMessage,
       );
}

extension ClientExtension$Mutation$EditMessage on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$EditMessage>> mutate$EditMessage(
    Options$Mutation$EditMessage options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$EditMessage> watchMutation$EditMessage(
    WatchOptions$Mutation$EditMessage options,
  ) => this.watchMutation(options);
}

class Mutation$EditMessage$HookResult {
  Mutation$EditMessage$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$EditMessage runMutation;

  final graphql.QueryResult<Mutation$EditMessage> result;
}

Mutation$EditMessage$HookResult useMutation$EditMessage([
  WidgetOptions$Mutation$EditMessage? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$EditMessage(),
  );
  return Mutation$EditMessage$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$EditMessage> useWatchMutation$EditMessage(
  WatchOptions$Mutation$EditMessage options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$EditMessage
    extends graphql.MutationOptions<Mutation$EditMessage> {
  WidgetOptions$Mutation$EditMessage({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$EditMessage? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$EditMessage? onCompleted,
    graphql.OnMutationUpdate<Mutation$EditMessage>? update,
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
                 data == null ? null : _parserFn$Mutation$EditMessage(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationEditMessage,
         parserFn: _parserFn$Mutation$EditMessage,
       );

  final OnMutationCompleted$Mutation$EditMessage? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$EditMessage =
    graphql.MultiSourceResult<Mutation$EditMessage> Function(
      Variables$Mutation$EditMessage, {
      Object? optimisticResult,
      Mutation$EditMessage? typedOptimisticResult,
    });
typedef Builder$Mutation$EditMessage =
    widgets.Widget Function(
      RunMutation$Mutation$EditMessage,
      graphql.QueryResult<Mutation$EditMessage>?,
    );

class Mutation$EditMessage$Widget
    extends graphql_flutter.Mutation<Mutation$EditMessage> {
  Mutation$EditMessage$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$EditMessage? options,
    required Builder$Mutation$EditMessage builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$EditMessage(),
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

class Mutation$EditMessage$editMessage {
  Mutation$EditMessage$editMessage({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.content,
    required this.messageType,
    this.metadata,
    required this.isEdited,
    required this.isDeletedForEveryone,
    this.editedAt,
    required this.createdAt,
    this.user,
    this.$__typename = 'Message',
  });

  factory Mutation$EditMessage$editMessage.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$messageType = json['messageType'];
    final l$metadata = json['metadata'];
    final l$isEdited = json['isEdited'];
    final l$isDeletedForEveryone = json['isDeletedForEveryone'];
    final l$editedAt = json['editedAt'];
    final l$createdAt = json['createdAt'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$EditMessage$editMessage(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      content: (l$content as String),
      messageType: (l$messageType as String),
      metadata: (l$metadata as Map<String, dynamic>?),
      isEdited: (l$isEdited as bool),
      isDeletedForEveryone: (l$isDeletedForEveryone as bool),
      editedAt: l$editedAt == null
          ? null
          : DateTime.parse((l$editedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      user: l$user == null
          ? null
          : Mutation$EditMessage$editMessage$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final String content;

  final String messageType;

  final Map<String, dynamic>? metadata;

  final bool isEdited;

  final bool isDeletedForEveryone;

  final DateTime? editedAt;

  final DateTime createdAt;

  final Mutation$EditMessage$editMessage$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$messageType = messageType;
    _resultData['messageType'] = l$messageType;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$isEdited = isEdited;
    _resultData['isEdited'] = l$isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    _resultData['isDeletedForEveryone'] = l$isDeletedForEveryone;
    final l$editedAt = editedAt;
    _resultData['editedAt'] = l$editedAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$content = content;
    final l$messageType = messageType;
    final l$metadata = metadata;
    final l$isEdited = isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final l$editedAt = editedAt;
    final l$createdAt = createdAt;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      l$content,
      l$messageType,
      l$metadata,
      l$isEdited,
      l$isDeletedForEveryone,
      l$editedAt,
      l$createdAt,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$EditMessage$editMessage ||
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
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$messageType = messageType;
    final lOther$messageType = other.messageType;
    if (l$messageType != lOther$messageType) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$isEdited = isEdited;
    final lOther$isEdited = other.isEdited;
    if (l$isEdited != lOther$isEdited) {
      return false;
    }
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final lOther$isDeletedForEveryone = other.isDeletedForEveryone;
    if (l$isDeletedForEveryone != lOther$isDeletedForEveryone) {
      return false;
    }
    final l$editedAt = editedAt;
    final lOther$editedAt = other.editedAt;
    if (l$editedAt != lOther$editedAt) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
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

extension UtilityExtension$Mutation$EditMessage$editMessage
    on Mutation$EditMessage$editMessage {
  CopyWith$Mutation$EditMessage$editMessage<Mutation$EditMessage$editMessage>
  get copyWith => CopyWith$Mutation$EditMessage$editMessage(this, (i) => i);
}

abstract class CopyWith$Mutation$EditMessage$editMessage<TRes> {
  factory CopyWith$Mutation$EditMessage$editMessage(
    Mutation$EditMessage$editMessage instance,
    TRes Function(Mutation$EditMessage$editMessage) then,
  ) = _CopyWithImpl$Mutation$EditMessage$editMessage;

  factory CopyWith$Mutation$EditMessage$editMessage.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditMessage$editMessage;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Mutation$EditMessage$editMessage$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$EditMessage$editMessage$user<TRes> get user;
}

class _CopyWithImpl$Mutation$EditMessage$editMessage<TRes>
    implements CopyWith$Mutation$EditMessage$editMessage<TRes> {
  _CopyWithImpl$Mutation$EditMessage$editMessage(this._instance, this._then);

  final Mutation$EditMessage$editMessage _instance;

  final TRes Function(Mutation$EditMessage$editMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? messageType = _undefined,
    Object? metadata = _undefined,
    Object? isEdited = _undefined,
    Object? isDeletedForEveryone = _undefined,
    Object? editedAt = _undefined,
    Object? createdAt = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$EditMessage$editMessage(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      messageType: messageType == _undefined || messageType == null
          ? _instance.messageType
          : (messageType as String),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      isEdited: isEdited == _undefined || isEdited == null
          ? _instance.isEdited
          : (isEdited as bool),
      isDeletedForEveryone:
          isDeletedForEveryone == _undefined || isDeletedForEveryone == null
          ? _instance.isDeletedForEveryone
          : (isDeletedForEveryone as bool),
      editedAt: editedAt == _undefined
          ? _instance.editedAt
          : (editedAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      user: user == _undefined
          ? _instance.user
          : (user as Mutation$EditMessage$editMessage$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$EditMessage$editMessage$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Mutation$EditMessage$editMessage$user.stub(_then(_instance))
        : CopyWith$Mutation$EditMessage$editMessage$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Mutation$EditMessage$editMessage<TRes>
    implements CopyWith$Mutation$EditMessage$editMessage<TRes> {
  _CopyWithStubImpl$Mutation$EditMessage$editMessage(this._res);

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    Mutation$EditMessage$editMessage$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$EditMessage$editMessage$user<TRes> get user =>
      CopyWith$Mutation$EditMessage$editMessage$user.stub(_res);
}

class Mutation$EditMessage$editMessage$user {
  Mutation$EditMessage$editMessage$user({
    required this.id,
    this.firstName,
    this.lastName,
    required this.email,
    this.$__typename = 'User',
  });

  factory Mutation$EditMessage$editMessage$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$$__typename = json['__typename'];
    return Mutation$EditMessage$editMessage$user(
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
    if (other is! Mutation$EditMessage$editMessage$user ||
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

extension UtilityExtension$Mutation$EditMessage$editMessage$user
    on Mutation$EditMessage$editMessage$user {
  CopyWith$Mutation$EditMessage$editMessage$user<
    Mutation$EditMessage$editMessage$user
  >
  get copyWith =>
      CopyWith$Mutation$EditMessage$editMessage$user(this, (i) => i);
}

abstract class CopyWith$Mutation$EditMessage$editMessage$user<TRes> {
  factory CopyWith$Mutation$EditMessage$editMessage$user(
    Mutation$EditMessage$editMessage$user instance,
    TRes Function(Mutation$EditMessage$editMessage$user) then,
  ) = _CopyWithImpl$Mutation$EditMessage$editMessage$user;

  factory CopyWith$Mutation$EditMessage$editMessage$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$EditMessage$editMessage$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$EditMessage$editMessage$user<TRes>
    implements CopyWith$Mutation$EditMessage$editMessage$user<TRes> {
  _CopyWithImpl$Mutation$EditMessage$editMessage$user(
    this._instance,
    this._then,
  );

  final Mutation$EditMessage$editMessage$user _instance;

  final TRes Function(Mutation$EditMessage$editMessage$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$EditMessage$editMessage$user(
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

class _CopyWithStubImpl$Mutation$EditMessage$editMessage$user<TRes>
    implements CopyWith$Mutation$EditMessage$editMessage$user<TRes> {
  _CopyWithStubImpl$Mutation$EditMessage$editMessage$user(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$DeleteMessageForEveryone {
  factory Variables$Mutation$DeleteMessageForEveryone({
    required String messageId,
  }) =>
      Variables$Mutation$DeleteMessageForEveryone._({r'messageId': messageId});

  Variables$Mutation$DeleteMessageForEveryone._(this._$data);

  factory Variables$Mutation$DeleteMessageForEveryone.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$messageId = data['messageId'];
    result$data['messageId'] = (l$messageId as String);
    return Variables$Mutation$DeleteMessageForEveryone._(result$data);
  }

  Map<String, dynamic> _$data;

  String get messageId => (_$data['messageId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$messageId = messageId;
    result$data['messageId'] = l$messageId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMessageForEveryone<
    Variables$Mutation$DeleteMessageForEveryone
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DeleteMessageForEveryone(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteMessageForEveryone ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$messageId = messageId;
    final lOther$messageId = other.messageId;
    if (l$messageId != lOther$messageId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$messageId = messageId;
    return Object.hashAll([l$messageId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteMessageForEveryone<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMessageForEveryone(
    Variables$Mutation$DeleteMessageForEveryone instance,
    TRes Function(Variables$Mutation$DeleteMessageForEveryone) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMessageForEveryone;

  factory CopyWith$Variables$Mutation$DeleteMessageForEveryone.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMessageForEveryone;

  TRes call({String? messageId});
}

class _CopyWithImpl$Variables$Mutation$DeleteMessageForEveryone<TRes>
    implements CopyWith$Variables$Mutation$DeleteMessageForEveryone<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMessageForEveryone(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteMessageForEveryone _instance;

  final TRes Function(Variables$Mutation$DeleteMessageForEveryone) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? messageId = _undefined}) => _then(
    Variables$Mutation$DeleteMessageForEveryone._({
      ..._instance._$data,
      if (messageId != _undefined && messageId != null)
        'messageId': (messageId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMessageForEveryone<TRes>
    implements CopyWith$Variables$Mutation$DeleteMessageForEveryone<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMessageForEveryone(this._res);

  TRes _res;

  call({String? messageId}) => _res;
}

class Mutation$DeleteMessageForEveryone {
  Mutation$DeleteMessageForEveryone({
    required this.deleteMessageForEveryone,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteMessageForEveryone.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$deleteMessageForEveryone = json['deleteMessageForEveryone'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMessageForEveryone(
      deleteMessageForEveryone:
          Mutation$DeleteMessageForEveryone$deleteMessageForEveryone.fromJson(
            (l$deleteMessageForEveryone as Map<String, dynamic>),
          ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$DeleteMessageForEveryone$deleteMessageForEveryone
  deleteMessageForEveryone;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMessageForEveryone = deleteMessageForEveryone;
    _resultData['deleteMessageForEveryone'] = l$deleteMessageForEveryone
        .toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMessageForEveryone = deleteMessageForEveryone;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteMessageForEveryone, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMessageForEveryone ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMessageForEveryone = deleteMessageForEveryone;
    final lOther$deleteMessageForEveryone = other.deleteMessageForEveryone;
    if (l$deleteMessageForEveryone != lOther$deleteMessageForEveryone) {
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

extension UtilityExtension$Mutation$DeleteMessageForEveryone
    on Mutation$DeleteMessageForEveryone {
  CopyWith$Mutation$DeleteMessageForEveryone<Mutation$DeleteMessageForEveryone>
  get copyWith => CopyWith$Mutation$DeleteMessageForEveryone(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMessageForEveryone<TRes> {
  factory CopyWith$Mutation$DeleteMessageForEveryone(
    Mutation$DeleteMessageForEveryone instance,
    TRes Function(Mutation$DeleteMessageForEveryone) then,
  ) = _CopyWithImpl$Mutation$DeleteMessageForEveryone;

  factory CopyWith$Mutation$DeleteMessageForEveryone.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMessageForEveryone;

  TRes call({
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone?
    deleteMessageForEveryone,
    String? $__typename,
  });
  CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<TRes>
  get deleteMessageForEveryone;
}

class _CopyWithImpl$Mutation$DeleteMessageForEveryone<TRes>
    implements CopyWith$Mutation$DeleteMessageForEveryone<TRes> {
  _CopyWithImpl$Mutation$DeleteMessageForEveryone(this._instance, this._then);

  final Mutation$DeleteMessageForEveryone _instance;

  final TRes Function(Mutation$DeleteMessageForEveryone) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMessageForEveryone = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMessageForEveryone(
      deleteMessageForEveryone:
          deleteMessageForEveryone == _undefined ||
              deleteMessageForEveryone == null
          ? _instance.deleteMessageForEveryone
          : (deleteMessageForEveryone
                as Mutation$DeleteMessageForEveryone$deleteMessageForEveryone),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<TRes>
  get deleteMessageForEveryone {
    final local$deleteMessageForEveryone = _instance.deleteMessageForEveryone;
    return CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
      local$deleteMessageForEveryone,
      (e) => call(deleteMessageForEveryone: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$DeleteMessageForEveryone<TRes>
    implements CopyWith$Mutation$DeleteMessageForEveryone<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMessageForEveryone(this._res);

  TRes _res;

  call({
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone?
    deleteMessageForEveryone,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<TRes>
  get deleteMessageForEveryone =>
      CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone.stub(
        _res,
      );
}

const documentNodeMutationDeleteMessageForEveryone = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteMessageForEveryone'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'messageId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteMessageForEveryone'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'messageId'),
                value: VariableNode(name: NameNode(value: 'messageId')),
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
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'messageType'),
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
                  name: NameNode(value: 'isEdited'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'isDeletedForEveryone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'editedAt'),
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
Mutation$DeleteMessageForEveryone _parserFn$Mutation$DeleteMessageForEveryone(
  Map<String, dynamic> data,
) => Mutation$DeleteMessageForEveryone.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMessageForEveryone =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$DeleteMessageForEveryone?,
    );

class Options$Mutation$DeleteMessageForEveryone
    extends graphql.MutationOptions<Mutation$DeleteMessageForEveryone> {
  Options$Mutation$DeleteMessageForEveryone({
    String? operationName,
    required Variables$Mutation$DeleteMessageForEveryone variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForEveryone? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMessageForEveryone? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMessageForEveryone>? update,
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
                     : _parserFn$Mutation$DeleteMessageForEveryone(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMessageForEveryone,
         parserFn: _parserFn$Mutation$DeleteMessageForEveryone,
       );

  final OnMutationCompleted$Mutation$DeleteMessageForEveryone?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteMessageForEveryone
    extends graphql.WatchQueryOptions<Mutation$DeleteMessageForEveryone> {
  WatchOptions$Mutation$DeleteMessageForEveryone({
    String? operationName,
    required Variables$Mutation$DeleteMessageForEveryone variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForEveryone? typedOptimisticResult,
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
         document: documentNodeMutationDeleteMessageForEveryone,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteMessageForEveryone,
       );
}

extension ClientExtension$Mutation$DeleteMessageForEveryone
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMessageForEveryone>>
  mutate$DeleteMessageForEveryone(
    Options$Mutation$DeleteMessageForEveryone options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteMessageForEveryone>
  watchMutation$DeleteMessageForEveryone(
    WatchOptions$Mutation$DeleteMessageForEveryone options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteMessageForEveryone$HookResult {
  Mutation$DeleteMessageForEveryone$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteMessageForEveryone runMutation;

  final graphql.QueryResult<Mutation$DeleteMessageForEveryone> result;
}

Mutation$DeleteMessageForEveryone$HookResult
useMutation$DeleteMessageForEveryone([
  WidgetOptions$Mutation$DeleteMessageForEveryone? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteMessageForEveryone(),
  );
  return Mutation$DeleteMessageForEveryone$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMessageForEveryone>
useWatchMutation$DeleteMessageForEveryone(
  WatchOptions$Mutation$DeleteMessageForEveryone options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMessageForEveryone
    extends graphql.MutationOptions<Mutation$DeleteMessageForEveryone> {
  WidgetOptions$Mutation$DeleteMessageForEveryone({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForEveryone? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMessageForEveryone? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMessageForEveryone>? update,
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
                     : _parserFn$Mutation$DeleteMessageForEveryone(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMessageForEveryone,
         parserFn: _parserFn$Mutation$DeleteMessageForEveryone,
       );

  final OnMutationCompleted$Mutation$DeleteMessageForEveryone?
  onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteMessageForEveryone =
    graphql.MultiSourceResult<Mutation$DeleteMessageForEveryone> Function(
      Variables$Mutation$DeleteMessageForEveryone, {
      Object? optimisticResult,
      Mutation$DeleteMessageForEveryone? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteMessageForEveryone =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteMessageForEveryone,
      graphql.QueryResult<Mutation$DeleteMessageForEveryone>?,
    );

class Mutation$DeleteMessageForEveryone$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMessageForEveryone> {
  Mutation$DeleteMessageForEveryone$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMessageForEveryone? options,
    required Builder$Mutation$DeleteMessageForEveryone builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteMessageForEveryone(),
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

class Mutation$DeleteMessageForEveryone$deleteMessageForEveryone {
  Mutation$DeleteMessageForEveryone$deleteMessageForEveryone({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.content,
    required this.messageType,
    this.metadata,
    required this.isEdited,
    required this.isDeletedForEveryone,
    this.editedAt,
    required this.createdAt,
    this.$__typename = 'Message',
  });

  factory Mutation$DeleteMessageForEveryone$deleteMessageForEveryone.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$teamId = json['teamId'];
    final l$userId = json['userId'];
    final l$content = json['content'];
    final l$messageType = json['messageType'];
    final l$metadata = json['metadata'];
    final l$isEdited = json['isEdited'];
    final l$isDeletedForEveryone = json['isDeletedForEveryone'];
    final l$editedAt = json['editedAt'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
      id: (l$id as String),
      teamId: (l$teamId as String),
      userId: (l$userId as String),
      content: (l$content as String),
      messageType: (l$messageType as String),
      metadata: (l$metadata as Map<String, dynamic>?),
      isEdited: (l$isEdited as bool),
      isDeletedForEveryone: (l$isDeletedForEveryone as bool),
      editedAt: l$editedAt == null
          ? null
          : DateTime.parse((l$editedAt as String)),
      createdAt: DateTime.parse((l$createdAt as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String teamId;

  final String userId;

  final String content;

  final String messageType;

  final Map<String, dynamic>? metadata;

  final bool isEdited;

  final bool isDeletedForEveryone;

  final DateTime? editedAt;

  final DateTime createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$messageType = messageType;
    _resultData['messageType'] = l$messageType;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$isEdited = isEdited;
    _resultData['isEdited'] = l$isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    _resultData['isDeletedForEveryone'] = l$isDeletedForEveryone;
    final l$editedAt = editedAt;
    _resultData['editedAt'] = l$editedAt?.toIso8601String();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$teamId = teamId;
    final l$userId = userId;
    final l$content = content;
    final l$messageType = messageType;
    final l$metadata = metadata;
    final l$isEdited = isEdited;
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final l$editedAt = editedAt;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$teamId,
      l$userId,
      l$content,
      l$messageType,
      l$metadata,
      l$isEdited,
      l$isDeletedForEveryone,
      l$editedAt,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMessageForEveryone$deleteMessageForEveryone ||
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
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$messageType = messageType;
    final lOther$messageType = other.messageType;
    if (l$messageType != lOther$messageType) {
      return false;
    }
    final l$metadata = metadata;
    final lOther$metadata = other.metadata;
    if (l$metadata != lOther$metadata) {
      return false;
    }
    final l$isEdited = isEdited;
    final lOther$isEdited = other.isEdited;
    if (l$isEdited != lOther$isEdited) {
      return false;
    }
    final l$isDeletedForEveryone = isDeletedForEveryone;
    final lOther$isDeletedForEveryone = other.isDeletedForEveryone;
    if (l$isDeletedForEveryone != lOther$isDeletedForEveryone) {
      return false;
    }
    final l$editedAt = editedAt;
    final lOther$editedAt = other.editedAt;
    if (l$editedAt != lOther$editedAt) {
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

extension UtilityExtension$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone
    on Mutation$DeleteMessageForEveryone$deleteMessageForEveryone {
  CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone
  >
  get copyWith =>
      CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
  TRes
> {
  factory CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone instance,
    TRes Function(Mutation$DeleteMessageForEveryone$deleteMessageForEveryone)
    then,
  ) = _CopyWithImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone;

  factory CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone.stub(
    TRes res,
  ) = _CopyWithStubImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone;

  TRes call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
  TRes
>
    implements
        CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
          TRes
        > {
  _CopyWithImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
    this._instance,
    this._then,
  );

  final Mutation$DeleteMessageForEveryone$deleteMessageForEveryone _instance;

  final TRes Function(
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone,
  )
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
    Object? content = _undefined,
    Object? messageType = _undefined,
    Object? metadata = _undefined,
    Object? isEdited = _undefined,
    Object? isDeletedForEveryone = _undefined,
    Object? editedAt = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      messageType: messageType == _undefined || messageType == null
          ? _instance.messageType
          : (messageType as String),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      isEdited: isEdited == _undefined || isEdited == null
          ? _instance.isEdited
          : (isEdited as bool),
      isDeletedForEveryone:
          isDeletedForEveryone == _undefined || isDeletedForEveryone == null
          ? _instance.isDeletedForEveryone
          : (isDeletedForEveryone as bool),
      editedAt: editedAt == _undefined
          ? _instance.editedAt
          : (editedAt as DateTime?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
  TRes
>
    implements
        CopyWith$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone<
          TRes
        > {
  _CopyWithStubImpl$Mutation$DeleteMessageForEveryone$deleteMessageForEveryone(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? teamId,
    String? userId,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    bool? isEdited,
    bool? isDeletedForEveryone,
    DateTime? editedAt,
    DateTime? createdAt,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$DeleteMessageForMe {
  factory Variables$Mutation$DeleteMessageForMe({required String messageId}) =>
      Variables$Mutation$DeleteMessageForMe._({r'messageId': messageId});

  Variables$Mutation$DeleteMessageForMe._(this._$data);

  factory Variables$Mutation$DeleteMessageForMe.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$messageId = data['messageId'];
    result$data['messageId'] = (l$messageId as String);
    return Variables$Mutation$DeleteMessageForMe._(result$data);
  }

  Map<String, dynamic> _$data;

  String get messageId => (_$data['messageId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$messageId = messageId;
    result$data['messageId'] = l$messageId;
    return result$data;
  }

  CopyWith$Variables$Mutation$DeleteMessageForMe<
    Variables$Mutation$DeleteMessageForMe
  >
  get copyWith =>
      CopyWith$Variables$Mutation$DeleteMessageForMe(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$DeleteMessageForMe ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$messageId = messageId;
    final lOther$messageId = other.messageId;
    if (l$messageId != lOther$messageId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$messageId = messageId;
    return Object.hashAll([l$messageId]);
  }
}

abstract class CopyWith$Variables$Mutation$DeleteMessageForMe<TRes> {
  factory CopyWith$Variables$Mutation$DeleteMessageForMe(
    Variables$Mutation$DeleteMessageForMe instance,
    TRes Function(Variables$Mutation$DeleteMessageForMe) then,
  ) = _CopyWithImpl$Variables$Mutation$DeleteMessageForMe;

  factory CopyWith$Variables$Mutation$DeleteMessageForMe.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$DeleteMessageForMe;

  TRes call({String? messageId});
}

class _CopyWithImpl$Variables$Mutation$DeleteMessageForMe<TRes>
    implements CopyWith$Variables$Mutation$DeleteMessageForMe<TRes> {
  _CopyWithImpl$Variables$Mutation$DeleteMessageForMe(
    this._instance,
    this._then,
  );

  final Variables$Mutation$DeleteMessageForMe _instance;

  final TRes Function(Variables$Mutation$DeleteMessageForMe) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? messageId = _undefined}) => _then(
    Variables$Mutation$DeleteMessageForMe._({
      ..._instance._$data,
      if (messageId != _undefined && messageId != null)
        'messageId': (messageId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$DeleteMessageForMe<TRes>
    implements CopyWith$Variables$Mutation$DeleteMessageForMe<TRes> {
  _CopyWithStubImpl$Variables$Mutation$DeleteMessageForMe(this._res);

  TRes _res;

  call({String? messageId}) => _res;
}

class Mutation$DeleteMessageForMe {
  Mutation$DeleteMessageForMe({
    required this.deleteMessageForMe,
    this.$__typename = 'Mutation',
  });

  factory Mutation$DeleteMessageForMe.fromJson(Map<String, dynamic> json) {
    final l$deleteMessageForMe = json['deleteMessageForMe'];
    final l$$__typename = json['__typename'];
    return Mutation$DeleteMessageForMe(
      deleteMessageForMe: (l$deleteMessageForMe as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool deleteMessageForMe;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$deleteMessageForMe = deleteMessageForMe;
    _resultData['deleteMessageForMe'] = l$deleteMessageForMe;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$deleteMessageForMe = deleteMessageForMe;
    final l$$__typename = $__typename;
    return Object.hashAll([l$deleteMessageForMe, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$DeleteMessageForMe ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$deleteMessageForMe = deleteMessageForMe;
    final lOther$deleteMessageForMe = other.deleteMessageForMe;
    if (l$deleteMessageForMe != lOther$deleteMessageForMe) {
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

extension UtilityExtension$Mutation$DeleteMessageForMe
    on Mutation$DeleteMessageForMe {
  CopyWith$Mutation$DeleteMessageForMe<Mutation$DeleteMessageForMe>
  get copyWith => CopyWith$Mutation$DeleteMessageForMe(this, (i) => i);
}

abstract class CopyWith$Mutation$DeleteMessageForMe<TRes> {
  factory CopyWith$Mutation$DeleteMessageForMe(
    Mutation$DeleteMessageForMe instance,
    TRes Function(Mutation$DeleteMessageForMe) then,
  ) = _CopyWithImpl$Mutation$DeleteMessageForMe;

  factory CopyWith$Mutation$DeleteMessageForMe.stub(TRes res) =
      _CopyWithStubImpl$Mutation$DeleteMessageForMe;

  TRes call({bool? deleteMessageForMe, String? $__typename});
}

class _CopyWithImpl$Mutation$DeleteMessageForMe<TRes>
    implements CopyWith$Mutation$DeleteMessageForMe<TRes> {
  _CopyWithImpl$Mutation$DeleteMessageForMe(this._instance, this._then);

  final Mutation$DeleteMessageForMe _instance;

  final TRes Function(Mutation$DeleteMessageForMe) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? deleteMessageForMe = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$DeleteMessageForMe(
      deleteMessageForMe:
          deleteMessageForMe == _undefined || deleteMessageForMe == null
          ? _instance.deleteMessageForMe
          : (deleteMessageForMe as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$DeleteMessageForMe<TRes>
    implements CopyWith$Mutation$DeleteMessageForMe<TRes> {
  _CopyWithStubImpl$Mutation$DeleteMessageForMe(this._res);

  TRes _res;

  call({bool? deleteMessageForMe, String? $__typename}) => _res;
}

const documentNodeMutationDeleteMessageForMe = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'DeleteMessageForMe'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'messageId')),
          type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
          defaultValue: DefaultValueNode(value: null),
          directives: [],
        ),
      ],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'deleteMessageForMe'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'messageId'),
                value: VariableNode(name: NameNode(value: 'messageId')),
              ),
            ],
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
  ],
);
Mutation$DeleteMessageForMe _parserFn$Mutation$DeleteMessageForMe(
  Map<String, dynamic> data,
) => Mutation$DeleteMessageForMe.fromJson(data);
typedef OnMutationCompleted$Mutation$DeleteMessageForMe =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$DeleteMessageForMe?,
    );

class Options$Mutation$DeleteMessageForMe
    extends graphql.MutationOptions<Mutation$DeleteMessageForMe> {
  Options$Mutation$DeleteMessageForMe({
    String? operationName,
    required Variables$Mutation$DeleteMessageForMe variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForMe? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMessageForMe? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMessageForMe>? update,
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
                     : _parserFn$Mutation$DeleteMessageForMe(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMessageForMe,
         parserFn: _parserFn$Mutation$DeleteMessageForMe,
       );

  final OnMutationCompleted$Mutation$DeleteMessageForMe? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$DeleteMessageForMe
    extends graphql.WatchQueryOptions<Mutation$DeleteMessageForMe> {
  WatchOptions$Mutation$DeleteMessageForMe({
    String? operationName,
    required Variables$Mutation$DeleteMessageForMe variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForMe? typedOptimisticResult,
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
         document: documentNodeMutationDeleteMessageForMe,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$DeleteMessageForMe,
       );
}

extension ClientExtension$Mutation$DeleteMessageForMe on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$DeleteMessageForMe>>
  mutate$DeleteMessageForMe(
    Options$Mutation$DeleteMessageForMe options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$DeleteMessageForMe>
  watchMutation$DeleteMessageForMe(
    WatchOptions$Mutation$DeleteMessageForMe options,
  ) => this.watchMutation(options);
}

class Mutation$DeleteMessageForMe$HookResult {
  Mutation$DeleteMessageForMe$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$DeleteMessageForMe runMutation;

  final graphql.QueryResult<Mutation$DeleteMessageForMe> result;
}

Mutation$DeleteMessageForMe$HookResult useMutation$DeleteMessageForMe([
  WidgetOptions$Mutation$DeleteMessageForMe? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$DeleteMessageForMe(),
  );
  return Mutation$DeleteMessageForMe$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$DeleteMessageForMe>
useWatchMutation$DeleteMessageForMe(
  WatchOptions$Mutation$DeleteMessageForMe options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$DeleteMessageForMe
    extends graphql.MutationOptions<Mutation$DeleteMessageForMe> {
  WidgetOptions$Mutation$DeleteMessageForMe({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$DeleteMessageForMe? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$DeleteMessageForMe? onCompleted,
    graphql.OnMutationUpdate<Mutation$DeleteMessageForMe>? update,
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
                     : _parserFn$Mutation$DeleteMessageForMe(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationDeleteMessageForMe,
         parserFn: _parserFn$Mutation$DeleteMessageForMe,
       );

  final OnMutationCompleted$Mutation$DeleteMessageForMe? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$DeleteMessageForMe =
    graphql.MultiSourceResult<Mutation$DeleteMessageForMe> Function(
      Variables$Mutation$DeleteMessageForMe, {
      Object? optimisticResult,
      Mutation$DeleteMessageForMe? typedOptimisticResult,
    });
typedef Builder$Mutation$DeleteMessageForMe =
    widgets.Widget Function(
      RunMutation$Mutation$DeleteMessageForMe,
      graphql.QueryResult<Mutation$DeleteMessageForMe>?,
    );

class Mutation$DeleteMessageForMe$Widget
    extends graphql_flutter.Mutation<Mutation$DeleteMessageForMe> {
  Mutation$DeleteMessageForMe$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$DeleteMessageForMe? options,
    required Builder$Mutation$DeleteMessageForMe builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$DeleteMessageForMe(),
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

class Query$GetUnreadCounts {
  Query$GetUnreadCounts({
    required this.unreadCounts,
    this.$__typename = 'Query',
  });

  factory Query$GetUnreadCounts.fromJson(Map<String, dynamic> json) {
    final l$unreadCounts = json['unreadCounts'];
    final l$$__typename = json['__typename'];
    return Query$GetUnreadCounts(
      unreadCounts: (l$unreadCounts as List<dynamic>)
          .map(
            (e) => Query$GetUnreadCounts$unreadCounts.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetUnreadCounts$unreadCounts> unreadCounts;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$unreadCounts = unreadCounts;
    _resultData['unreadCounts'] = l$unreadCounts
        .map((e) => e.toJson())
        .toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$unreadCounts = unreadCounts;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$unreadCounts.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUnreadCounts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$unreadCounts = unreadCounts;
    final lOther$unreadCounts = other.unreadCounts;
    if (l$unreadCounts.length != lOther$unreadCounts.length) {
      return false;
    }
    for (int i = 0; i < l$unreadCounts.length; i++) {
      final l$unreadCounts$entry = l$unreadCounts[i];
      final lOther$unreadCounts$entry = lOther$unreadCounts[i];
      if (l$unreadCounts$entry != lOther$unreadCounts$entry) {
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

extension UtilityExtension$Query$GetUnreadCounts on Query$GetUnreadCounts {
  CopyWith$Query$GetUnreadCounts<Query$GetUnreadCounts> get copyWith =>
      CopyWith$Query$GetUnreadCounts(this, (i) => i);
}

abstract class CopyWith$Query$GetUnreadCounts<TRes> {
  factory CopyWith$Query$GetUnreadCounts(
    Query$GetUnreadCounts instance,
    TRes Function(Query$GetUnreadCounts) then,
  ) = _CopyWithImpl$Query$GetUnreadCounts;

  factory CopyWith$Query$GetUnreadCounts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUnreadCounts;

  TRes call({
    List<Query$GetUnreadCounts$unreadCounts>? unreadCounts,
    String? $__typename,
  });
  TRes unreadCounts(
    Iterable<Query$GetUnreadCounts$unreadCounts> Function(
      Iterable<
        CopyWith$Query$GetUnreadCounts$unreadCounts<
          Query$GetUnreadCounts$unreadCounts
        >
      >,
    )
    _fn,
  );
}

class _CopyWithImpl$Query$GetUnreadCounts<TRes>
    implements CopyWith$Query$GetUnreadCounts<TRes> {
  _CopyWithImpl$Query$GetUnreadCounts(this._instance, this._then);

  final Query$GetUnreadCounts _instance;

  final TRes Function(Query$GetUnreadCounts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? unreadCounts = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUnreadCounts(
      unreadCounts: unreadCounts == _undefined || unreadCounts == null
          ? _instance.unreadCounts
          : (unreadCounts as List<Query$GetUnreadCounts$unreadCounts>),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  TRes unreadCounts(
    Iterable<Query$GetUnreadCounts$unreadCounts> Function(
      Iterable<
        CopyWith$Query$GetUnreadCounts$unreadCounts<
          Query$GetUnreadCounts$unreadCounts
        >
      >,
    )
    _fn,
  ) => call(
    unreadCounts: _fn(
      _instance.unreadCounts.map(
        (e) => CopyWith$Query$GetUnreadCounts$unreadCounts(e, (i) => i),
      ),
    ).toList(),
  );
}

class _CopyWithStubImpl$Query$GetUnreadCounts<TRes>
    implements CopyWith$Query$GetUnreadCounts<TRes> {
  _CopyWithStubImpl$Query$GetUnreadCounts(this._res);

  TRes _res;

  call({
    List<Query$GetUnreadCounts$unreadCounts>? unreadCounts,
    String? $__typename,
  }) => _res;

  unreadCounts(_fn) => _res;
}

const documentNodeQueryGetUnreadCounts = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'GetUnreadCounts'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(
        selections: [
          FieldNode(
            name: NameNode(value: 'unreadCounts'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'teamId'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'count'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                FieldNode(
                  name: NameNode(value: 'lastMessage'),
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
                        name: NameNode(value: 'content'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'messageType'),
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
                        name: NameNode(value: 'userId'),
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
Query$GetUnreadCounts _parserFn$Query$GetUnreadCounts(
  Map<String, dynamic> data,
) => Query$GetUnreadCounts.fromJson(data);
typedef OnQueryComplete$Query$GetUnreadCounts =
    FutureOr<void> Function(Map<String, dynamic>?, Query$GetUnreadCounts?);

class Options$Query$GetUnreadCounts
    extends graphql.QueryOptions<Query$GetUnreadCounts> {
  Options$Query$GetUnreadCounts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUnreadCounts? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetUnreadCounts? onComplete,
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
                 data == null ? null : _parserFn$Query$GetUnreadCounts(data),
               ),
         onError: onError,
         document: documentNodeQueryGetUnreadCounts,
         parserFn: _parserFn$Query$GetUnreadCounts,
       );

  final OnQueryComplete$Query$GetUnreadCounts? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onComplete == null
        ? super.properties
        : super.properties.where((property) => property != onComplete),
    onCompleteWithParsed,
  ];
}

class WatchOptions$Query$GetUnreadCounts
    extends graphql.WatchQueryOptions<Query$GetUnreadCounts> {
  WatchOptions$Query$GetUnreadCounts({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetUnreadCounts? typedOptimisticResult,
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
         document: documentNodeQueryGetUnreadCounts,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Query$GetUnreadCounts,
       );
}

class FetchMoreOptions$Query$GetUnreadCounts extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetUnreadCounts({
    required graphql.UpdateQuery updateQuery,
  }) : super(
         updateQuery: updateQuery,
         document: documentNodeQueryGetUnreadCounts,
       );
}

extension ClientExtension$Query$GetUnreadCounts on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetUnreadCounts>> query$GetUnreadCounts([
    Options$Query$GetUnreadCounts? options,
  ]) async => await this.query(options ?? Options$Query$GetUnreadCounts());

  graphql.ObservableQuery<Query$GetUnreadCounts> watchQuery$GetUnreadCounts([
    WatchOptions$Query$GetUnreadCounts? options,
  ]) => this.watchQuery(options ?? WatchOptions$Query$GetUnreadCounts());

  void writeQuery$GetUnreadCounts({
    required Query$GetUnreadCounts data,
    bool broadcast = true,
  }) => this.writeQuery(
    graphql.Request(
      operation: graphql.Operation(document: documentNodeQueryGetUnreadCounts),
    ),
    data: data.toJson(),
    broadcast: broadcast,
  );

  Query$GetUnreadCounts? readQuery$GetUnreadCounts({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
          document: documentNodeQueryGetUnreadCounts,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetUnreadCounts.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetUnreadCounts>
useQuery$GetUnreadCounts([Options$Query$GetUnreadCounts? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetUnreadCounts());
graphql.ObservableQuery<Query$GetUnreadCounts> useWatchQuery$GetUnreadCounts([
  WatchOptions$Query$GetUnreadCounts? options,
]) => graphql_flutter.useWatchQuery(
  options ?? WatchOptions$Query$GetUnreadCounts(),
);

class Query$GetUnreadCounts$Widget
    extends graphql_flutter.Query<Query$GetUnreadCounts> {
  Query$GetUnreadCounts$Widget({
    widgets.Key? key,
    Options$Query$GetUnreadCounts? options,
    required graphql_flutter.QueryBuilder<Query$GetUnreadCounts> builder,
  }) : super(
         key: key,
         options: options ?? Options$Query$GetUnreadCounts(),
         builder: builder,
       );
}

class Query$GetUnreadCounts$unreadCounts {
  Query$GetUnreadCounts$unreadCounts({
    required this.teamId,
    required this.count,
    this.lastMessage,
    this.$__typename = 'UnreadCount',
  });

  factory Query$GetUnreadCounts$unreadCounts.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$teamId = json['teamId'];
    final l$count = json['count'];
    final l$lastMessage = json['lastMessage'];
    final l$$__typename = json['__typename'];
    return Query$GetUnreadCounts$unreadCounts(
      teamId: (l$teamId as String),
      count: (l$count as int),
      lastMessage: l$lastMessage == null
          ? null
          : Query$GetUnreadCounts$unreadCounts$lastMessage.fromJson(
              (l$lastMessage as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String teamId;

  final int count;

  final Query$GetUnreadCounts$unreadCounts$lastMessage? lastMessage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$teamId = teamId;
    _resultData['teamId'] = l$teamId;
    final l$count = count;
    _resultData['count'] = l$count;
    final l$lastMessage = lastMessage;
    _resultData['lastMessage'] = l$lastMessage?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$teamId = teamId;
    final l$count = count;
    final l$lastMessage = lastMessage;
    final l$$__typename = $__typename;
    return Object.hashAll([l$teamId, l$count, l$lastMessage, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUnreadCounts$unreadCounts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$count = count;
    final lOther$count = other.count;
    if (l$count != lOther$count) {
      return false;
    }
    final l$lastMessage = lastMessage;
    final lOther$lastMessage = other.lastMessage;
    if (l$lastMessage != lOther$lastMessage) {
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

extension UtilityExtension$Query$GetUnreadCounts$unreadCounts
    on Query$GetUnreadCounts$unreadCounts {
  CopyWith$Query$GetUnreadCounts$unreadCounts<
    Query$GetUnreadCounts$unreadCounts
  >
  get copyWith => CopyWith$Query$GetUnreadCounts$unreadCounts(this, (i) => i);
}

abstract class CopyWith$Query$GetUnreadCounts$unreadCounts<TRes> {
  factory CopyWith$Query$GetUnreadCounts$unreadCounts(
    Query$GetUnreadCounts$unreadCounts instance,
    TRes Function(Query$GetUnreadCounts$unreadCounts) then,
  ) = _CopyWithImpl$Query$GetUnreadCounts$unreadCounts;

  factory CopyWith$Query$GetUnreadCounts$unreadCounts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts;

  TRes call({
    String? teamId,
    int? count,
    Query$GetUnreadCounts$unreadCounts$lastMessage? lastMessage,
    String? $__typename,
  });
  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes> get lastMessage;
}

class _CopyWithImpl$Query$GetUnreadCounts$unreadCounts<TRes>
    implements CopyWith$Query$GetUnreadCounts$unreadCounts<TRes> {
  _CopyWithImpl$Query$GetUnreadCounts$unreadCounts(this._instance, this._then);

  final Query$GetUnreadCounts$unreadCounts _instance;

  final TRes Function(Query$GetUnreadCounts$unreadCounts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? teamId = _undefined,
    Object? count = _undefined,
    Object? lastMessage = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUnreadCounts$unreadCounts(
      teamId: teamId == _undefined || teamId == null
          ? _instance.teamId
          : (teamId as String),
      count: count == _undefined || count == null
          ? _instance.count
          : (count as int),
      lastMessage: lastMessage == _undefined
          ? _instance.lastMessage
          : (lastMessage as Query$GetUnreadCounts$unreadCounts$lastMessage?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes>
  get lastMessage {
    final local$lastMessage = _instance.lastMessage;
    return local$lastMessage == null
        ? CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage(
            local$lastMessage,
            (e) => call(lastMessage: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts<TRes>
    implements CopyWith$Query$GetUnreadCounts$unreadCounts<TRes> {
  _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts(this._res);

  TRes _res;

  call({
    String? teamId,
    int? count,
    Query$GetUnreadCounts$unreadCounts$lastMessage? lastMessage,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes>
  get lastMessage =>
      CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage.stub(_res);
}

class Query$GetUnreadCounts$unreadCounts$lastMessage {
  Query$GetUnreadCounts$unreadCounts$lastMessage({
    required this.id,
    required this.content,
    required this.messageType,
    this.metadata,
    required this.createdAt,
    required this.userId,
    this.user,
    this.$__typename = 'Message',
  });

  factory Query$GetUnreadCounts$unreadCounts$lastMessage.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$content = json['content'];
    final l$messageType = json['messageType'];
    final l$metadata = json['metadata'];
    final l$createdAt = json['createdAt'];
    final l$userId = json['userId'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Query$GetUnreadCounts$unreadCounts$lastMessage(
      id: (l$id as String),
      content: (l$content as String),
      messageType: (l$messageType as String),
      metadata: (l$metadata as Map<String, dynamic>?),
      createdAt: DateTime.parse((l$createdAt as String)),
      userId: (l$userId as String),
      user: l$user == null
          ? null
          : Query$GetUnreadCounts$unreadCounts$lastMessage$user.fromJson(
              (l$user as Map<String, dynamic>),
            ),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String content;

  final String messageType;

  final Map<String, dynamic>? metadata;

  final DateTime createdAt;

  final String userId;

  final Query$GetUnreadCounts$unreadCounts$lastMessage$user? user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$content = content;
    _resultData['content'] = l$content;
    final l$messageType = messageType;
    _resultData['messageType'] = l$messageType;
    final l$metadata = metadata;
    _resultData['metadata'] = l$metadata;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt.toIso8601String();
    final l$userId = userId;
    _resultData['userId'] = l$userId;
    final l$user = user;
    _resultData['user'] = l$user?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$content = content;
    final l$messageType = messageType;
    final l$metadata = metadata;
    final l$createdAt = createdAt;
    final l$userId = userId;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$content,
      l$messageType,
      l$metadata,
      l$createdAt,
      l$userId,
      l$user,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUnreadCounts$unreadCounts$lastMessage ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
      return false;
    }
    final l$messageType = messageType;
    final lOther$messageType = other.messageType;
    if (l$messageType != lOther$messageType) {
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
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
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

extension UtilityExtension$Query$GetUnreadCounts$unreadCounts$lastMessage
    on Query$GetUnreadCounts$unreadCounts$lastMessage {
  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<
    Query$GetUnreadCounts$unreadCounts$lastMessage
  >
  get copyWith =>
      CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage(this, (i) => i);
}

abstract class CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes> {
  factory CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage(
    Query$GetUnreadCounts$unreadCounts$lastMessage instance,
    TRes Function(Query$GetUnreadCounts$unreadCounts$lastMessage) then,
  ) = _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage;

  factory CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage;

  TRes call({
    String? id,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    String? userId,
    Query$GetUnreadCounts$unreadCounts$lastMessage$user? user,
    String? $__typename,
  });
  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes> get user;
}

class _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes>
    implements CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes> {
  _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage(
    this._instance,
    this._then,
  );

  final Query$GetUnreadCounts$unreadCounts$lastMessage _instance;

  final TRes Function(Query$GetUnreadCounts$unreadCounts$lastMessage) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? content = _undefined,
    Object? messageType = _undefined,
    Object? metadata = _undefined,
    Object? createdAt = _undefined,
    Object? userId = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUnreadCounts$unreadCounts$lastMessage(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      content: content == _undefined || content == null
          ? _instance.content
          : (content as String),
      messageType: messageType == _undefined || messageType == null
          ? _instance.messageType
          : (messageType as String),
      metadata: metadata == _undefined
          ? _instance.metadata
          : (metadata as Map<String, dynamic>?),
      createdAt: createdAt == _undefined || createdAt == null
          ? _instance.createdAt
          : (createdAt as DateTime),
      userId: userId == _undefined || userId == null
          ? _instance.userId
          : (userId as String),
      user: user == _undefined
          ? _instance.user
          : (user as Query$GetUnreadCounts$unreadCounts$lastMessage$user?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes> get user {
    final local$user = _instance.user;
    return local$user == null
        ? CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user.stub(
            _then(_instance),
          )
        : CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user(
            local$user,
            (e) => call(user: e),
          );
  }
}

class _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes>
    implements CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage<TRes> {
  _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage(this._res);

  TRes _res;

  call({
    String? id,
    String? content,
    String? messageType,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    String? userId,
    Query$GetUnreadCounts$unreadCounts$lastMessage$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes> get user =>
      CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user.stub(_res);
}

class Query$GetUnreadCounts$unreadCounts$lastMessage$user {
  Query$GetUnreadCounts$unreadCounts$lastMessage$user({
    required this.id,
    this.firstName,
    this.lastName,
    this.$__typename = 'User',
  });

  factory Query$GetUnreadCounts$unreadCounts$lastMessage$user.fromJson(
    Map<String, dynamic> json,
  ) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$$__typename = json['__typename'];
    return Query$GetUnreadCounts$unreadCounts$lastMessage$user(
      id: (l$id as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? firstName;

  final String? lastName;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$$__typename = $__typename;
    return Object.hashAll([l$id, l$firstName, l$lastName, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetUnreadCounts$unreadCounts$lastMessage$user ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetUnreadCounts$unreadCounts$lastMessage$user
    on Query$GetUnreadCounts$unreadCounts$lastMessage$user {
  CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<
    Query$GetUnreadCounts$unreadCounts$lastMessage$user
  >
  get copyWith => CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user(
    this,
    (i) => i,
  );
}

abstract class CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<
  TRes
> {
  factory CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user(
    Query$GetUnreadCounts$unreadCounts$lastMessage$user instance,
    TRes Function(Query$GetUnreadCounts$unreadCounts$lastMessage$user) then,
  ) = _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user;

  factory CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user.stub(
    TRes res,
  ) = _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes>
    implements
        CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes> {
  _CopyWithImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user(
    this._instance,
    this._then,
  );

  final Query$GetUnreadCounts$unreadCounts$lastMessage$user _instance;

  final TRes Function(Query$GetUnreadCounts$unreadCounts$lastMessage$user)
  _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Query$GetUnreadCounts$unreadCounts$lastMessage$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user<
  TRes
>
    implements
        CopyWith$Query$GetUnreadCounts$unreadCounts$lastMessage$user<TRes> {
  _CopyWithStubImpl$Query$GetUnreadCounts$unreadCounts$lastMessage$user(
    this._res,
  );

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$MarkMessagesAsRead {
  factory Variables$Mutation$MarkMessagesAsRead({required String teamId}) =>
      Variables$Mutation$MarkMessagesAsRead._({r'teamId': teamId});

  Variables$Mutation$MarkMessagesAsRead._(this._$data);

  factory Variables$Mutation$MarkMessagesAsRead.fromJson(
    Map<String, dynamic> data,
  ) {
    final result$data = <String, dynamic>{};
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    return Variables$Mutation$MarkMessagesAsRead._(result$data);
  }

  Map<String, dynamic> _$data;

  String get teamId => (_$data['teamId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    return result$data;
  }

  CopyWith$Variables$Mutation$MarkMessagesAsRead<
    Variables$Mutation$MarkMessagesAsRead
  >
  get copyWith =>
      CopyWith$Variables$Mutation$MarkMessagesAsRead(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$MarkMessagesAsRead ||
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

abstract class CopyWith$Variables$Mutation$MarkMessagesAsRead<TRes> {
  factory CopyWith$Variables$Mutation$MarkMessagesAsRead(
    Variables$Mutation$MarkMessagesAsRead instance,
    TRes Function(Variables$Mutation$MarkMessagesAsRead) then,
  ) = _CopyWithImpl$Variables$Mutation$MarkMessagesAsRead;

  factory CopyWith$Variables$Mutation$MarkMessagesAsRead.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$MarkMessagesAsRead;

  TRes call({String? teamId});
}

class _CopyWithImpl$Variables$Mutation$MarkMessagesAsRead<TRes>
    implements CopyWith$Variables$Mutation$MarkMessagesAsRead<TRes> {
  _CopyWithImpl$Variables$Mutation$MarkMessagesAsRead(
    this._instance,
    this._then,
  );

  final Variables$Mutation$MarkMessagesAsRead _instance;

  final TRes Function(Variables$Mutation$MarkMessagesAsRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? teamId = _undefined}) => _then(
    Variables$Mutation$MarkMessagesAsRead._({
      ..._instance._$data,
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$MarkMessagesAsRead<TRes>
    implements CopyWith$Variables$Mutation$MarkMessagesAsRead<TRes> {
  _CopyWithStubImpl$Variables$Mutation$MarkMessagesAsRead(this._res);

  TRes _res;

  call({String? teamId}) => _res;
}

class Mutation$MarkMessagesAsRead {
  Mutation$MarkMessagesAsRead({
    required this.markMessagesAsRead,
    this.$__typename = 'Mutation',
  });

  factory Mutation$MarkMessagesAsRead.fromJson(Map<String, dynamic> json) {
    final l$markMessagesAsRead = json['markMessagesAsRead'];
    final l$$__typename = json['__typename'];
    return Mutation$MarkMessagesAsRead(
      markMessagesAsRead: (l$markMessagesAsRead as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final bool markMessagesAsRead;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$markMessagesAsRead = markMessagesAsRead;
    _resultData['markMessagesAsRead'] = l$markMessagesAsRead;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$markMessagesAsRead = markMessagesAsRead;
    final l$$__typename = $__typename;
    return Object.hashAll([l$markMessagesAsRead, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$MarkMessagesAsRead ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$markMessagesAsRead = markMessagesAsRead;
    final lOther$markMessagesAsRead = other.markMessagesAsRead;
    if (l$markMessagesAsRead != lOther$markMessagesAsRead) {
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

extension UtilityExtension$Mutation$MarkMessagesAsRead
    on Mutation$MarkMessagesAsRead {
  CopyWith$Mutation$MarkMessagesAsRead<Mutation$MarkMessagesAsRead>
  get copyWith => CopyWith$Mutation$MarkMessagesAsRead(this, (i) => i);
}

abstract class CopyWith$Mutation$MarkMessagesAsRead<TRes> {
  factory CopyWith$Mutation$MarkMessagesAsRead(
    Mutation$MarkMessagesAsRead instance,
    TRes Function(Mutation$MarkMessagesAsRead) then,
  ) = _CopyWithImpl$Mutation$MarkMessagesAsRead;

  factory CopyWith$Mutation$MarkMessagesAsRead.stub(TRes res) =
      _CopyWithStubImpl$Mutation$MarkMessagesAsRead;

  TRes call({bool? markMessagesAsRead, String? $__typename});
}

class _CopyWithImpl$Mutation$MarkMessagesAsRead<TRes>
    implements CopyWith$Mutation$MarkMessagesAsRead<TRes> {
  _CopyWithImpl$Mutation$MarkMessagesAsRead(this._instance, this._then);

  final Mutation$MarkMessagesAsRead _instance;

  final TRes Function(Mutation$MarkMessagesAsRead) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? markMessagesAsRead = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$MarkMessagesAsRead(
      markMessagesAsRead:
          markMessagesAsRead == _undefined || markMessagesAsRead == null
          ? _instance.markMessagesAsRead
          : (markMessagesAsRead as bool),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$MarkMessagesAsRead<TRes>
    implements CopyWith$Mutation$MarkMessagesAsRead<TRes> {
  _CopyWithStubImpl$Mutation$MarkMessagesAsRead(this._res);

  TRes _res;

  call({bool? markMessagesAsRead, String? $__typename}) => _res;
}

const documentNodeMutationMarkMessagesAsRead = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'MarkMessagesAsRead'),
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
            name: NameNode(value: 'markMessagesAsRead'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'teamId'),
                value: VariableNode(name: NameNode(value: 'teamId')),
              ),
            ],
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
  ],
);
Mutation$MarkMessagesAsRead _parserFn$Mutation$MarkMessagesAsRead(
  Map<String, dynamic> data,
) => Mutation$MarkMessagesAsRead.fromJson(data);
typedef OnMutationCompleted$Mutation$MarkMessagesAsRead =
    FutureOr<void> Function(
      Map<String, dynamic>?,
      Mutation$MarkMessagesAsRead?,
    );

class Options$Mutation$MarkMessagesAsRead
    extends graphql.MutationOptions<Mutation$MarkMessagesAsRead> {
  Options$Mutation$MarkMessagesAsRead({
    String? operationName,
    required Variables$Mutation$MarkMessagesAsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkMessagesAsRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MarkMessagesAsRead? onCompleted,
    graphql.OnMutationUpdate<Mutation$MarkMessagesAsRead>? update,
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
                     : _parserFn$Mutation$MarkMessagesAsRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkMessagesAsRead,
         parserFn: _parserFn$Mutation$MarkMessagesAsRead,
       );

  final OnMutationCompleted$Mutation$MarkMessagesAsRead? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$MarkMessagesAsRead
    extends graphql.WatchQueryOptions<Mutation$MarkMessagesAsRead> {
  WatchOptions$Mutation$MarkMessagesAsRead({
    String? operationName,
    required Variables$Mutation$MarkMessagesAsRead variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkMessagesAsRead? typedOptimisticResult,
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
         document: documentNodeMutationMarkMessagesAsRead,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$MarkMessagesAsRead,
       );
}

extension ClientExtension$Mutation$MarkMessagesAsRead on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$MarkMessagesAsRead>>
  mutate$MarkMessagesAsRead(
    Options$Mutation$MarkMessagesAsRead options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$MarkMessagesAsRead>
  watchMutation$MarkMessagesAsRead(
    WatchOptions$Mutation$MarkMessagesAsRead options,
  ) => this.watchMutation(options);
}

class Mutation$MarkMessagesAsRead$HookResult {
  Mutation$MarkMessagesAsRead$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$MarkMessagesAsRead runMutation;

  final graphql.QueryResult<Mutation$MarkMessagesAsRead> result;
}

Mutation$MarkMessagesAsRead$HookResult useMutation$MarkMessagesAsRead([
  WidgetOptions$Mutation$MarkMessagesAsRead? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$MarkMessagesAsRead(),
  );
  return Mutation$MarkMessagesAsRead$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$MarkMessagesAsRead>
useWatchMutation$MarkMessagesAsRead(
  WatchOptions$Mutation$MarkMessagesAsRead options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$MarkMessagesAsRead
    extends graphql.MutationOptions<Mutation$MarkMessagesAsRead> {
  WidgetOptions$Mutation$MarkMessagesAsRead({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$MarkMessagesAsRead? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$MarkMessagesAsRead? onCompleted,
    graphql.OnMutationUpdate<Mutation$MarkMessagesAsRead>? update,
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
                     : _parserFn$Mutation$MarkMessagesAsRead(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationMarkMessagesAsRead,
         parserFn: _parserFn$Mutation$MarkMessagesAsRead,
       );

  final OnMutationCompleted$Mutation$MarkMessagesAsRead? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$MarkMessagesAsRead =
    graphql.MultiSourceResult<Mutation$MarkMessagesAsRead> Function(
      Variables$Mutation$MarkMessagesAsRead, {
      Object? optimisticResult,
      Mutation$MarkMessagesAsRead? typedOptimisticResult,
    });
typedef Builder$Mutation$MarkMessagesAsRead =
    widgets.Widget Function(
      RunMutation$Mutation$MarkMessagesAsRead,
      graphql.QueryResult<Mutation$MarkMessagesAsRead>?,
    );

class Mutation$MarkMessagesAsRead$Widget
    extends graphql_flutter.Mutation<Mutation$MarkMessagesAsRead> {
  Mutation$MarkMessagesAsRead$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$MarkMessagesAsRead? options,
    required Builder$Mutation$MarkMessagesAsRead builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$MarkMessagesAsRead(),
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
