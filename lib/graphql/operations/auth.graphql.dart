import '../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$Login {
  factory Variables$Mutation$Login({required Input$LoginInput input}) =>
      Variables$Mutation$Login._({r'input': input});

  Variables$Mutation$Login._(this._$data);

  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$LoginInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$Login._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$LoginInput get input => (_$data['input'] as Input$LoginInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$Login<Variables$Mutation$Login> get copyWith =>
      CopyWith$Variables$Mutation$Login(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$Login ||
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

abstract class CopyWith$Variables$Mutation$Login<TRes> {
  factory CopyWith$Variables$Mutation$Login(
    Variables$Mutation$Login instance,
    TRes Function(Variables$Mutation$Login) then,
  ) = _CopyWithImpl$Variables$Mutation$Login;

  factory CopyWith$Variables$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Login;

  TRes call({Input$LoginInput? input});
}

class _CopyWithImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithImpl$Variables$Mutation$Login(this._instance, this._then);

  final Variables$Mutation$Login _instance;

  final TRes Function(Variables$Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$Login._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$LoginInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$Login<TRes>
    implements CopyWith$Variables$Mutation$Login<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Login(this._res);

  TRes _res;

  call({Input$LoginInput? input}) => _res;
}

class Mutation$Login {
  Mutation$Login({required this.login, this.$__typename = 'Mutation'});

  factory Mutation$Login.fromJson(Map<String, dynamic> json) {
    final l$login = json['login'];
    final l$$__typename = json['__typename'];
    return Mutation$Login(
      login: Mutation$Login$login.fromJson((l$login as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Login$login login;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$login = login;
    _resultData['login'] = l$login.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$login = login;
    final l$$__typename = $__typename;
    return Object.hashAll([l$login, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login || runtimeType != other.runtimeType) {
      return false;
    }
    final l$login = login;
    final lOther$login = other.login;
    if (l$login != lOther$login) {
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

extension UtilityExtension$Mutation$Login on Mutation$Login {
  CopyWith$Mutation$Login<Mutation$Login> get copyWith =>
      CopyWith$Mutation$Login(this, (i) => i);
}

abstract class CopyWith$Mutation$Login<TRes> {
  factory CopyWith$Mutation$Login(
    Mutation$Login instance,
    TRes Function(Mutation$Login) then,
  ) = _CopyWithImpl$Mutation$Login;

  factory CopyWith$Mutation$Login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login;

  TRes call({Mutation$Login$login? login, String? $__typename});
  CopyWith$Mutation$Login$login<TRes> get login;
}

class _CopyWithImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithImpl$Mutation$Login(this._instance, this._then);

  final Mutation$Login _instance;

  final TRes Function(Mutation$Login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? login = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$Login(
          login: login == _undefined || login == null
              ? _instance.login
              : (login as Mutation$Login$login),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$Login$login<TRes> get login {
    final local$login = _instance.login;
    return CopyWith$Mutation$Login$login(local$login, (e) => call(login: e));
  }
}

class _CopyWithStubImpl$Mutation$Login<TRes>
    implements CopyWith$Mutation$Login<TRes> {
  _CopyWithStubImpl$Mutation$Login(this._res);

  TRes _res;

  call({Mutation$Login$login? login, String? $__typename}) => _res;

  CopyWith$Mutation$Login$login<TRes> get login =>
      CopyWith$Mutation$Login$login.stub(_res);
}

const documentNodeMutationLogin = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Login'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'LoginInput'),
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
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'loginInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'accessToken'),
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
                        name: NameNode(value: 'email'),
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
Mutation$Login _parserFn$Mutation$Login(Map<String, dynamic> data) =>
    Mutation$Login.fromJson(data);
typedef OnMutationCompleted$Mutation$Login =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$Login?);

class Options$Mutation$Login extends graphql.MutationOptions<Mutation$Login> {
  Options$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
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
                 data == null ? null : _parserFn$Mutation$Login(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationLogin,
         parserFn: _parserFn$Mutation$Login,
       );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$Login
    extends graphql.WatchQueryOptions<Mutation$Login> {
  WatchOptions$Mutation$Login({
    String? operationName,
    required Variables$Mutation$Login variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
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
         document: documentNodeMutationLogin,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$Login,
       );
}

extension ClientExtension$Mutation$Login on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Login>> mutate$Login(
    Options$Mutation$Login options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$Login> watchMutation$Login(
    WatchOptions$Mutation$Login options,
  ) => this.watchMutation(options);
}

class Mutation$Login$HookResult {
  Mutation$Login$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$Login runMutation;

  final graphql.QueryResult<Mutation$Login> result;
}

Mutation$Login$HookResult useMutation$Login([
  WidgetOptions$Mutation$Login? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$Login(),
  );
  return Mutation$Login$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Login> useWatchMutation$Login(
  WatchOptions$Mutation$Login options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Login
    extends graphql.MutationOptions<Mutation$Login> {
  WidgetOptions$Mutation$Login({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Login? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Login? onCompleted,
    graphql.OnMutationUpdate<Mutation$Login>? update,
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
                 data == null ? null : _parserFn$Mutation$Login(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationLogin,
         parserFn: _parserFn$Mutation$Login,
       );

  final OnMutationCompleted$Mutation$Login? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$Login =
    graphql.MultiSourceResult<Mutation$Login> Function(
      Variables$Mutation$Login, {
      Object? optimisticResult,
      Mutation$Login? typedOptimisticResult,
    });
typedef Builder$Mutation$Login =
    widgets.Widget Function(
      RunMutation$Mutation$Login,
      graphql.QueryResult<Mutation$Login>?,
    );

class Mutation$Login$Widget extends graphql_flutter.Mutation<Mutation$Login> {
  Mutation$Login$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Login? options,
    required Builder$Mutation$Login builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$Login(),
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

class Mutation$Login$login {
  Mutation$Login$login({
    required this.accessToken,
    required this.user,
    this.$__typename = 'AuthResponse',
  });

  factory Mutation$Login$login.fromJson(Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$Login$login(
      accessToken: (l$accessToken as String),
      user: Mutation$Login$login$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String accessToken;

  final Mutation$Login$login$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$accessToken, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login$login || runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
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

extension UtilityExtension$Mutation$Login$login on Mutation$Login$login {
  CopyWith$Mutation$Login$login<Mutation$Login$login> get copyWith =>
      CopyWith$Mutation$Login$login(this, (i) => i);
}

abstract class CopyWith$Mutation$Login$login<TRes> {
  factory CopyWith$Mutation$Login$login(
    Mutation$Login$login instance,
    TRes Function(Mutation$Login$login) then,
  ) = _CopyWithImpl$Mutation$Login$login;

  factory CopyWith$Mutation$Login$login.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login;

  TRes call({
    String? accessToken,
    Mutation$Login$login$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$Login$login$user<TRes> get user;
}

class _CopyWithImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithImpl$Mutation$Login$login(this._instance, this._then);

  final Mutation$Login$login _instance;

  final TRes Function(Mutation$Login$login) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Login$login(
      accessToken: accessToken == _undefined || accessToken == null
          ? _instance.accessToken
          : (accessToken as String),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Mutation$Login$login$user),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$Login$login$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$Login$login$user(local$user, (e) => call(user: e));
  }
}

class _CopyWithStubImpl$Mutation$Login$login<TRes>
    implements CopyWith$Mutation$Login$login<TRes> {
  _CopyWithStubImpl$Mutation$Login$login(this._res);

  TRes _res;

  call({
    String? accessToken,
    Mutation$Login$login$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$Login$login$user<TRes> get user =>
      CopyWith$Mutation$Login$login$user.stub(_res);
}

class Mutation$Login$login$user {
  Mutation$Login$login$user({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.role,
    this.$__typename = 'Auth',
  });

  factory Mutation$Login$login$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$role = json['role'];
    final l$$__typename = json['__typename'];
    return Mutation$Login$login$user(
      id: (l$id as String),
      email: (l$email as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      role: fromJson$Enum$UserRole((l$role as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? firstName;

  final String? lastName;

  final Enum$UserRole role;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$role = role;
    _resultData['role'] = toJson$Enum$UserRole(l$role);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$role = role;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$firstName,
      l$lastName,
      l$role,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Login$login$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
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
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
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

extension UtilityExtension$Mutation$Login$login$user
    on Mutation$Login$login$user {
  CopyWith$Mutation$Login$login$user<Mutation$Login$login$user> get copyWith =>
      CopyWith$Mutation$Login$login$user(this, (i) => i);
}

abstract class CopyWith$Mutation$Login$login$user<TRes> {
  factory CopyWith$Mutation$Login$login$user(
    Mutation$Login$login$user instance,
    TRes Function(Mutation$Login$login$user) then,
  ) = _CopyWithImpl$Mutation$Login$login$user;

  factory CopyWith$Mutation$Login$login$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Login$login$user;

  TRes call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    Enum$UserRole? role,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Login$login$user<TRes>
    implements CopyWith$Mutation$Login$login$user<TRes> {
  _CopyWithImpl$Mutation$Login$login$user(this._instance, this._then);

  final Mutation$Login$login$user _instance;

  final TRes Function(Mutation$Login$login$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? role = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Login$login$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as Enum$UserRole),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$Login$login$user<TRes>
    implements CopyWith$Mutation$Login$login$user<TRes> {
  _CopyWithStubImpl$Mutation$Login$login$user(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    Enum$UserRole? role,
    String? $__typename,
  }) => _res;
}

class Variables$Mutation$Signup {
  factory Variables$Mutation$Signup({required Input$SignupInput input}) =>
      Variables$Mutation$Signup._({r'input': input});

  Variables$Mutation$Signup._(this._$data);

  factory Variables$Mutation$Signup.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$SignupInput.fromJson(
      (l$input as Map<String, dynamic>),
    );
    return Variables$Mutation$Signup._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SignupInput get input => (_$data['input'] as Input$SignupInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$Signup<Variables$Mutation$Signup> get copyWith =>
      CopyWith$Variables$Mutation$Signup(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$Signup ||
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

abstract class CopyWith$Variables$Mutation$Signup<TRes> {
  factory CopyWith$Variables$Mutation$Signup(
    Variables$Mutation$Signup instance,
    TRes Function(Variables$Mutation$Signup) then,
  ) = _CopyWithImpl$Variables$Mutation$Signup;

  factory CopyWith$Variables$Mutation$Signup.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$Signup;

  TRes call({Input$SignupInput? input});
}

class _CopyWithImpl$Variables$Mutation$Signup<TRes>
    implements CopyWith$Variables$Mutation$Signup<TRes> {
  _CopyWithImpl$Variables$Mutation$Signup(this._instance, this._then);

  final Variables$Mutation$Signup _instance;

  final TRes Function(Variables$Mutation$Signup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) => _then(
    Variables$Mutation$Signup._({
      ..._instance._$data,
      if (input != _undefined && input != null)
        'input': (input as Input$SignupInput),
    }),
  );
}

class _CopyWithStubImpl$Variables$Mutation$Signup<TRes>
    implements CopyWith$Variables$Mutation$Signup<TRes> {
  _CopyWithStubImpl$Variables$Mutation$Signup(this._res);

  TRes _res;

  call({Input$SignupInput? input}) => _res;
}

class Mutation$Signup {
  Mutation$Signup({required this.signup, this.$__typename = 'Mutation'});

  factory Mutation$Signup.fromJson(Map<String, dynamic> json) {
    final l$signup = json['signup'];
    final l$$__typename = json['__typename'];
    return Mutation$Signup(
      signup: Mutation$Signup$signup.fromJson(
        (l$signup as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$Signup$signup signup;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$signup = signup;
    _resultData['signup'] = l$signup.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$signup = signup;
    final l$$__typename = $__typename;
    return Object.hashAll([l$signup, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Signup || runtimeType != other.runtimeType) {
      return false;
    }
    final l$signup = signup;
    final lOther$signup = other.signup;
    if (l$signup != lOther$signup) {
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

extension UtilityExtension$Mutation$Signup on Mutation$Signup {
  CopyWith$Mutation$Signup<Mutation$Signup> get copyWith =>
      CopyWith$Mutation$Signup(this, (i) => i);
}

abstract class CopyWith$Mutation$Signup<TRes> {
  factory CopyWith$Mutation$Signup(
    Mutation$Signup instance,
    TRes Function(Mutation$Signup) then,
  ) = _CopyWithImpl$Mutation$Signup;

  factory CopyWith$Mutation$Signup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Signup;

  TRes call({Mutation$Signup$signup? signup, String? $__typename});
  CopyWith$Mutation$Signup$signup<TRes> get signup;
}

class _CopyWithImpl$Mutation$Signup<TRes>
    implements CopyWith$Mutation$Signup<TRes> {
  _CopyWithImpl$Mutation$Signup(this._instance, this._then);

  final Mutation$Signup _instance;

  final TRes Function(Mutation$Signup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? signup = _undefined, Object? $__typename = _undefined}) =>
      _then(
        Mutation$Signup(
          signup: signup == _undefined || signup == null
              ? _instance.signup
              : (signup as Mutation$Signup$signup),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
        ),
      );

  CopyWith$Mutation$Signup$signup<TRes> get signup {
    final local$signup = _instance.signup;
    return CopyWith$Mutation$Signup$signup(
      local$signup,
      (e) => call(signup: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$Signup<TRes>
    implements CopyWith$Mutation$Signup<TRes> {
  _CopyWithStubImpl$Mutation$Signup(this._res);

  TRes _res;

  call({Mutation$Signup$signup? signup, String? $__typename}) => _res;

  CopyWith$Mutation$Signup$signup<TRes> get signup =>
      CopyWith$Mutation$Signup$signup.stub(_res);
}

const documentNodeMutationSignup = DocumentNode(
  definitions: [
    OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Signup'),
      variableDefinitions: [
        VariableDefinitionNode(
          variable: VariableNode(name: NameNode(value: 'input')),
          type: NamedTypeNode(
            name: NameNode(value: 'SignupInput'),
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
            name: NameNode(value: 'signup'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'signupInput'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(
              selections: [
                FieldNode(
                  name: NameNode(value: 'accessToken'),
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
                        name: NameNode(value: 'email'),
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
Mutation$Signup _parserFn$Mutation$Signup(Map<String, dynamic> data) =>
    Mutation$Signup.fromJson(data);
typedef OnMutationCompleted$Mutation$Signup =
    FutureOr<void> Function(Map<String, dynamic>?, Mutation$Signup?);

class Options$Mutation$Signup extends graphql.MutationOptions<Mutation$Signup> {
  Options$Mutation$Signup({
    String? operationName,
    required Variables$Mutation$Signup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Signup? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Signup? onCompleted,
    graphql.OnMutationUpdate<Mutation$Signup>? update,
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
                 data == null ? null : _parserFn$Mutation$Signup(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSignup,
         parserFn: _parserFn$Mutation$Signup,
       );

  final OnMutationCompleted$Mutation$Signup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

class WatchOptions$Mutation$Signup
    extends graphql.WatchQueryOptions<Mutation$Signup> {
  WatchOptions$Mutation$Signup({
    String? operationName,
    required Variables$Mutation$Signup variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Signup? typedOptimisticResult,
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
         document: documentNodeMutationSignup,
         pollInterval: pollInterval,
         eagerlyFetchResults: eagerlyFetchResults,
         carryForwardDataOnException: carryForwardDataOnException,
         fetchResults: fetchResults,
         parserFn: _parserFn$Mutation$Signup,
       );
}

extension ClientExtension$Mutation$Signup on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$Signup>> mutate$Signup(
    Options$Mutation$Signup options,
  ) async => await this.mutate(options);

  graphql.ObservableQuery<Mutation$Signup> watchMutation$Signup(
    WatchOptions$Mutation$Signup options,
  ) => this.watchMutation(options);
}

class Mutation$Signup$HookResult {
  Mutation$Signup$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$Signup runMutation;

  final graphql.QueryResult<Mutation$Signup> result;
}

Mutation$Signup$HookResult useMutation$Signup([
  WidgetOptions$Mutation$Signup? options,
]) {
  final result = graphql_flutter.useMutation(
    options ?? WidgetOptions$Mutation$Signup(),
  );
  return Mutation$Signup$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
          variables.toJson(),
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
        ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$Signup> useWatchMutation$Signup(
  WatchOptions$Mutation$Signup options,
) => graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$Signup
    extends graphql.MutationOptions<Mutation$Signup> {
  WidgetOptions$Mutation$Signup({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$Signup? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$Signup? onCompleted,
    graphql.OnMutationUpdate<Mutation$Signup>? update,
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
                 data == null ? null : _parserFn$Mutation$Signup(data),
               ),
         update: update,
         onError: onError,
         document: documentNodeMutationSignup,
         parserFn: _parserFn$Mutation$Signup,
       );

  final OnMutationCompleted$Mutation$Signup? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
    ...super.onCompleted == null
        ? super.properties
        : super.properties.where((property) => property != onCompleted),
    onCompletedWithParsed,
  ];
}

typedef RunMutation$Mutation$Signup =
    graphql.MultiSourceResult<Mutation$Signup> Function(
      Variables$Mutation$Signup, {
      Object? optimisticResult,
      Mutation$Signup? typedOptimisticResult,
    });
typedef Builder$Mutation$Signup =
    widgets.Widget Function(
      RunMutation$Mutation$Signup,
      graphql.QueryResult<Mutation$Signup>?,
    );

class Mutation$Signup$Widget extends graphql_flutter.Mutation<Mutation$Signup> {
  Mutation$Signup$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$Signup? options,
    required Builder$Mutation$Signup builder,
  }) : super(
         key: key,
         options: options ?? WidgetOptions$Mutation$Signup(),
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

class Mutation$Signup$signup {
  Mutation$Signup$signup({
    required this.accessToken,
    required this.user,
    this.$__typename = 'AuthResponse',
  });

  factory Mutation$Signup$signup.fromJson(Map<String, dynamic> json) {
    final l$accessToken = json['accessToken'];
    final l$user = json['user'];
    final l$$__typename = json['__typename'];
    return Mutation$Signup$signup(
      accessToken: (l$accessToken as String),
      user: Mutation$Signup$signup$user.fromJson(
        (l$user as Map<String, dynamic>),
      ),
      $__typename: (l$$__typename as String),
    );
  }

  final String accessToken;

  final Mutation$Signup$signup$user user;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$accessToken = accessToken;
    _resultData['accessToken'] = l$accessToken;
    final l$user = user;
    _resultData['user'] = l$user.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$accessToken = accessToken;
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$accessToken, l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Signup$signup || runtimeType != other.runtimeType) {
      return false;
    }
    final l$accessToken = accessToken;
    final lOther$accessToken = other.accessToken;
    if (l$accessToken != lOther$accessToken) {
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

extension UtilityExtension$Mutation$Signup$signup on Mutation$Signup$signup {
  CopyWith$Mutation$Signup$signup<Mutation$Signup$signup> get copyWith =>
      CopyWith$Mutation$Signup$signup(this, (i) => i);
}

abstract class CopyWith$Mutation$Signup$signup<TRes> {
  factory CopyWith$Mutation$Signup$signup(
    Mutation$Signup$signup instance,
    TRes Function(Mutation$Signup$signup) then,
  ) = _CopyWithImpl$Mutation$Signup$signup;

  factory CopyWith$Mutation$Signup$signup.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Signup$signup;

  TRes call({
    String? accessToken,
    Mutation$Signup$signup$user? user,
    String? $__typename,
  });
  CopyWith$Mutation$Signup$signup$user<TRes> get user;
}

class _CopyWithImpl$Mutation$Signup$signup<TRes>
    implements CopyWith$Mutation$Signup$signup<TRes> {
  _CopyWithImpl$Mutation$Signup$signup(this._instance, this._then);

  final Mutation$Signup$signup _instance;

  final TRes Function(Mutation$Signup$signup) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? accessToken = _undefined,
    Object? user = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Signup$signup(
      accessToken: accessToken == _undefined || accessToken == null
          ? _instance.accessToken
          : (accessToken as String),
      user: user == _undefined || user == null
          ? _instance.user
          : (user as Mutation$Signup$signup$user),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );

  CopyWith$Mutation$Signup$signup$user<TRes> get user {
    final local$user = _instance.user;
    return CopyWith$Mutation$Signup$signup$user(
      local$user,
      (e) => call(user: e),
    );
  }
}

class _CopyWithStubImpl$Mutation$Signup$signup<TRes>
    implements CopyWith$Mutation$Signup$signup<TRes> {
  _CopyWithStubImpl$Mutation$Signup$signup(this._res);

  TRes _res;

  call({
    String? accessToken,
    Mutation$Signup$signup$user? user,
    String? $__typename,
  }) => _res;

  CopyWith$Mutation$Signup$signup$user<TRes> get user =>
      CopyWith$Mutation$Signup$signup$user.stub(_res);
}

class Mutation$Signup$signup$user {
  Mutation$Signup$signup$user({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    required this.role,
    this.$__typename = 'Auth',
  });

  factory Mutation$Signup$signup$user.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$email = json['email'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$role = json['role'];
    final l$$__typename = json['__typename'];
    return Mutation$Signup$signup$user(
      id: (l$id as String),
      email: (l$email as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      role: fromJson$Enum$UserRole((l$role as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String email;

  final String? firstName;

  final String? lastName;

  final Enum$UserRole role;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$role = role;
    _resultData['role'] = toJson$Enum$UserRole(l$role);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$role = role;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$email,
      l$firstName,
      l$lastName,
      l$role,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$Signup$signup$user ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
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
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
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

extension UtilityExtension$Mutation$Signup$signup$user
    on Mutation$Signup$signup$user {
  CopyWith$Mutation$Signup$signup$user<Mutation$Signup$signup$user>
  get copyWith => CopyWith$Mutation$Signup$signup$user(this, (i) => i);
}

abstract class CopyWith$Mutation$Signup$signup$user<TRes> {
  factory CopyWith$Mutation$Signup$signup$user(
    Mutation$Signup$signup$user instance,
    TRes Function(Mutation$Signup$signup$user) then,
  ) = _CopyWithImpl$Mutation$Signup$signup$user;

  factory CopyWith$Mutation$Signup$signup$user.stub(TRes res) =
      _CopyWithStubImpl$Mutation$Signup$signup$user;

  TRes call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    Enum$UserRole? role,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$Signup$signup$user<TRes>
    implements CopyWith$Mutation$Signup$signup$user<TRes> {
  _CopyWithImpl$Mutation$Signup$signup$user(this._instance, this._then);

  final Mutation$Signup$signup$user _instance;

  final TRes Function(Mutation$Signup$signup$user) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? role = _undefined,
    Object? $__typename = _undefined,
  }) => _then(
    Mutation$Signup$signup$user(
      id: id == _undefined || id == null ? _instance.id : (id as String),
      email: email == _undefined || email == null
          ? _instance.email
          : (email as String),
      firstName: firstName == _undefined
          ? _instance.firstName
          : (firstName as String?),
      lastName: lastName == _undefined
          ? _instance.lastName
          : (lastName as String?),
      role: role == _undefined || role == null
          ? _instance.role
          : (role as Enum$UserRole),
      $__typename: $__typename == _undefined || $__typename == null
          ? _instance.$__typename
          : ($__typename as String),
    ),
  );
}

class _CopyWithStubImpl$Mutation$Signup$signup$user<TRes>
    implements CopyWith$Mutation$Signup$signup$user<TRes> {
  _CopyWithStubImpl$Mutation$Signup$signup$user(this._res);

  TRes _res;

  call({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    Enum$UserRole? role,
    String? $__typename,
  }) => _res;
}
