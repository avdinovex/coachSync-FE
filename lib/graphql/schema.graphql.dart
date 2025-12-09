class Input$AddTeamMemberInput {
  factory Input$AddTeamMemberInput({
    required Enum$MemberRole role,
    required String teamId,
    required String userId,
  }) => Input$AddTeamMemberInput._({
    r'role': role,
    r'teamId': teamId,
    r'userId': userId,
  });

  Input$AddTeamMemberInput._(this._$data);

  factory Input$AddTeamMemberInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$role = data['role'];
    result$data['role'] = fromJson$Enum$MemberRole((l$role as String));
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Input$AddTeamMemberInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$MemberRole get role => (_$data['role'] as Enum$MemberRole);

  String get teamId => (_$data['teamId'] as String);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$role = role;
    result$data['role'] = toJson$Enum$MemberRole(l$role);
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Input$AddTeamMemberInput<Input$AddTeamMemberInput> get copyWith =>
      CopyWith$Input$AddTeamMemberInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$AddTeamMemberInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$role = role;
    final l$teamId = teamId;
    final l$userId = userId;
    return Object.hashAll([l$role, l$teamId, l$userId]);
  }
}

abstract class CopyWith$Input$AddTeamMemberInput<TRes> {
  factory CopyWith$Input$AddTeamMemberInput(
    Input$AddTeamMemberInput instance,
    TRes Function(Input$AddTeamMemberInput) then,
  ) = _CopyWithImpl$Input$AddTeamMemberInput;

  factory CopyWith$Input$AddTeamMemberInput.stub(TRes res) =
      _CopyWithStubImpl$Input$AddTeamMemberInput;

  TRes call({Enum$MemberRole? role, String? teamId, String? userId});
}

class _CopyWithImpl$Input$AddTeamMemberInput<TRes>
    implements CopyWith$Input$AddTeamMemberInput<TRes> {
  _CopyWithImpl$Input$AddTeamMemberInput(this._instance, this._then);

  final Input$AddTeamMemberInput _instance;

  final TRes Function(Input$AddTeamMemberInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? role = _undefined,
    Object? teamId = _undefined,
    Object? userId = _undefined,
  }) => _then(
    Input$AddTeamMemberInput._({
      ..._instance._$data,
      if (role != _undefined && role != null) 'role': (role as Enum$MemberRole),
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
      if (userId != _undefined && userId != null) 'userId': (userId as String),
    }),
  );
}

class _CopyWithStubImpl$Input$AddTeamMemberInput<TRes>
    implements CopyWith$Input$AddTeamMemberInput<TRes> {
  _CopyWithStubImpl$Input$AddTeamMemberInput(this._res);

  TRes _res;

  call({Enum$MemberRole? role, String? teamId, String? userId}) => _res;
}

class Input$CreateEventInput {
  factory Input$CreateEventInput({
    String? description,
    DateTime? endTime,
    required Enum$EventType eventType,
    String? location,
    required DateTime startTime,
    required String teamId,
    required String title,
  }) => Input$CreateEventInput._({
    if (description != null) r'description': description,
    if (endTime != null) r'endTime': endTime,
    r'eventType': eventType,
    if (location != null) r'location': location,
    r'startTime': startTime,
    r'teamId': teamId,
    r'title': title,
  });

  Input$CreateEventInput._(this._$data);

  factory Input$CreateEventInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = l$endTime == null
          ? null
          : DateTime.parse((l$endTime as String));
    }
    final l$eventType = data['eventType'];
    result$data['eventType'] = fromJson$Enum$EventType((l$eventType as String));
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    final l$startTime = data['startTime'];
    result$data['startTime'] = DateTime.parse((l$startTime as String));
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    return Input$CreateEventInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  DateTime? get endTime => (_$data['endTime'] as DateTime?);

  Enum$EventType get eventType => (_$data['eventType'] as Enum$EventType);

  String? get location => (_$data['location'] as String?);

  DateTime get startTime => (_$data['startTime'] as DateTime);

  String get teamId => (_$data['teamId'] as String);

  String get title => (_$data['title'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime?.toIso8601String();
    }
    final l$eventType = eventType;
    result$data['eventType'] = toJson$Enum$EventType(l$eventType);
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    final l$startTime = startTime;
    result$data['startTime'] = l$startTime.toIso8601String();
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    final l$title = title;
    result$data['title'] = l$title;
    return result$data;
  }

  CopyWith$Input$CreateEventInput<Input$CreateEventInput> get copyWith =>
      CopyWith$Input$CreateEventInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateEventInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$endTime = endTime;
    final l$eventType = eventType;
    final l$location = location;
    final l$startTime = startTime;
    final l$teamId = teamId;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
      l$eventType,
      _$data.containsKey('location') ? l$location : const {},
      l$startTime,
      l$teamId,
      l$title,
    ]);
  }
}

abstract class CopyWith$Input$CreateEventInput<TRes> {
  factory CopyWith$Input$CreateEventInput(
    Input$CreateEventInput instance,
    TRes Function(Input$CreateEventInput) then,
  ) = _CopyWithImpl$Input$CreateEventInput;

  factory CopyWith$Input$CreateEventInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateEventInput;

  TRes call({
    String? description,
    DateTime? endTime,
    Enum$EventType? eventType,
    String? location,
    DateTime? startTime,
    String? teamId,
    String? title,
  });
}

class _CopyWithImpl$Input$CreateEventInput<TRes>
    implements CopyWith$Input$CreateEventInput<TRes> {
  _CopyWithImpl$Input$CreateEventInput(this._instance, this._then);

  final Input$CreateEventInput _instance;

  final TRes Function(Input$CreateEventInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? endTime = _undefined,
    Object? eventType = _undefined,
    Object? location = _undefined,
    Object? startTime = _undefined,
    Object? teamId = _undefined,
    Object? title = _undefined,
  }) => _then(
    Input$CreateEventInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (endTime != _undefined) 'endTime': (endTime as DateTime?),
      if (eventType != _undefined && eventType != null)
        'eventType': (eventType as Enum$EventType),
      if (location != _undefined) 'location': (location as String?),
      if (startTime != _undefined && startTime != null)
        'startTime': (startTime as DateTime),
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
      if (title != _undefined && title != null) 'title': (title as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateEventInput<TRes>
    implements CopyWith$Input$CreateEventInput<TRes> {
  _CopyWithStubImpl$Input$CreateEventInput(this._res);

  TRes _res;

  call({
    String? description,
    DateTime? endTime,
    Enum$EventType? eventType,
    String? location,
    DateTime? startTime,
    String? teamId,
    String? title,
  }) => _res;
}

class Input$CreateNotificationInput {
  factory Input$CreateNotificationInput({required int exampleField}) =>
      Input$CreateNotificationInput._({r'exampleField': exampleField});

  Input$CreateNotificationInput._(this._$data);

  factory Input$CreateNotificationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$exampleField = data['exampleField'];
    result$data['exampleField'] = (l$exampleField as int);
    return Input$CreateNotificationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int get exampleField => (_$data['exampleField'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$exampleField = exampleField;
    result$data['exampleField'] = l$exampleField;
    return result$data;
  }

  CopyWith$Input$CreateNotificationInput<Input$CreateNotificationInput>
  get copyWith => CopyWith$Input$CreateNotificationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateNotificationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$exampleField = exampleField;
    final lOther$exampleField = other.exampleField;
    if (l$exampleField != lOther$exampleField) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$exampleField = exampleField;
    return Object.hashAll([l$exampleField]);
  }
}

abstract class CopyWith$Input$CreateNotificationInput<TRes> {
  factory CopyWith$Input$CreateNotificationInput(
    Input$CreateNotificationInput instance,
    TRes Function(Input$CreateNotificationInput) then,
  ) = _CopyWithImpl$Input$CreateNotificationInput;

  factory CopyWith$Input$CreateNotificationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateNotificationInput;

  TRes call({int? exampleField});
}

class _CopyWithImpl$Input$CreateNotificationInput<TRes>
    implements CopyWith$Input$CreateNotificationInput<TRes> {
  _CopyWithImpl$Input$CreateNotificationInput(this._instance, this._then);

  final Input$CreateNotificationInput _instance;

  final TRes Function(Input$CreateNotificationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? exampleField = _undefined}) => _then(
    Input$CreateNotificationInput._({
      ..._instance._$data,
      if (exampleField != _undefined && exampleField != null)
        'exampleField': (exampleField as int),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateNotificationInput<TRes>
    implements CopyWith$Input$CreateNotificationInput<TRes> {
  _CopyWithStubImpl$Input$CreateNotificationInput(this._res);

  TRes _res;

  call({int? exampleField}) => _res;
}

class Input$CreateRsvpInput {
  factory Input$CreateRsvpInput({
    required String eventId,
    required Enum$RsvpStatus status,
  }) => Input$CreateRsvpInput._({r'eventId': eventId, r'status': status});

  Input$CreateRsvpInput._(this._$data);

  factory Input$CreateRsvpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$RsvpStatus((l$status as String));
    return Input$CreateRsvpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  Enum$RsvpStatus get status => (_$data['status'] as Enum$RsvpStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    final l$status = status;
    result$data['status'] = toJson$Enum$RsvpStatus(l$status);
    return result$data;
  }

  CopyWith$Input$CreateRsvpInput<Input$CreateRsvpInput> get copyWith =>
      CopyWith$Input$CreateRsvpInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateRsvpInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    final l$status = status;
    return Object.hashAll([l$eventId, l$status]);
  }
}

abstract class CopyWith$Input$CreateRsvpInput<TRes> {
  factory CopyWith$Input$CreateRsvpInput(
    Input$CreateRsvpInput instance,
    TRes Function(Input$CreateRsvpInput) then,
  ) = _CopyWithImpl$Input$CreateRsvpInput;

  factory CopyWith$Input$CreateRsvpInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateRsvpInput;

  TRes call({String? eventId, Enum$RsvpStatus? status});
}

class _CopyWithImpl$Input$CreateRsvpInput<TRes>
    implements CopyWith$Input$CreateRsvpInput<TRes> {
  _CopyWithImpl$Input$CreateRsvpInput(this._instance, this._then);

  final Input$CreateRsvpInput _instance;

  final TRes Function(Input$CreateRsvpInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eventId = _undefined, Object? status = _undefined}) =>
      _then(
        Input$CreateRsvpInput._({
          ..._instance._$data,
          if (eventId != _undefined && eventId != null)
            'eventId': (eventId as String),
          if (status != _undefined && status != null)
            'status': (status as Enum$RsvpStatus),
        }),
      );
}

class _CopyWithStubImpl$Input$CreateRsvpInput<TRes>
    implements CopyWith$Input$CreateRsvpInput<TRes> {
  _CopyWithStubImpl$Input$CreateRsvpInput(this._res);

  TRes _res;

  call({String? eventId, Enum$RsvpStatus? status}) => _res;
}

class Input$CreateTeamInput {
  factory Input$CreateTeamInput({
    String? description,
    required String name,
    required String sport,
  }) => Input$CreateTeamInput._({
    if (description != null) r'description': description,
    r'name': name,
    r'sport': sport,
  });

  Input$CreateTeamInput._(this._$data);

  factory Input$CreateTeamInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$sport = data['sport'];
    result$data['sport'] = (l$sport as String);
    return Input$CreateTeamInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  String get name => (_$data['name'] as String);

  String get sport => (_$data['sport'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$name = name;
    result$data['name'] = l$name;
    final l$sport = sport;
    result$data['sport'] = l$sport;
    return result$data;
  }

  CopyWith$Input$CreateTeamInput<Input$CreateTeamInput> get copyWith =>
      CopyWith$Input$CreateTeamInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CreateTeamInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
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
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$name = name;
    final l$sport = sport;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      l$name,
      l$sport,
    ]);
  }
}

abstract class CopyWith$Input$CreateTeamInput<TRes> {
  factory CopyWith$Input$CreateTeamInput(
    Input$CreateTeamInput instance,
    TRes Function(Input$CreateTeamInput) then,
  ) = _CopyWithImpl$Input$CreateTeamInput;

  factory CopyWith$Input$CreateTeamInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CreateTeamInput;

  TRes call({String? description, String? name, String? sport});
}

class _CopyWithImpl$Input$CreateTeamInput<TRes>
    implements CopyWith$Input$CreateTeamInput<TRes> {
  _CopyWithImpl$Input$CreateTeamInput(this._instance, this._then);

  final Input$CreateTeamInput _instance;

  final TRes Function(Input$CreateTeamInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? name = _undefined,
    Object? sport = _undefined,
  }) => _then(
    Input$CreateTeamInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (name != _undefined && name != null) 'name': (name as String),
      if (sport != _undefined && sport != null) 'sport': (sport as String),
    }),
  );
}

class _CopyWithStubImpl$Input$CreateTeamInput<TRes>
    implements CopyWith$Input$CreateTeamInput<TRes> {
  _CopyWithStubImpl$Input$CreateTeamInput(this._res);

  TRes _res;

  call({String? description, String? name, String? sport}) => _res;
}

class Input$LoginInput {
  factory Input$LoginInput({required String email, required String password}) =>
      Input$LoginInput._({r'email': email, r'password': password});

  Input$LoginInput._(this._$data);

  factory Input$LoginInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    return Input$LoginInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String get password => (_$data['password'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    final l$password = password;
    result$data['password'] = l$password;
    return result$data;
  }

  CopyWith$Input$LoginInput<Input$LoginInput> get copyWith =>
      CopyWith$Input$LoginInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$LoginInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$email, l$password]);
  }
}

abstract class CopyWith$Input$LoginInput<TRes> {
  factory CopyWith$Input$LoginInput(
    Input$LoginInput instance,
    TRes Function(Input$LoginInput) then,
  ) = _CopyWithImpl$Input$LoginInput;

  factory CopyWith$Input$LoginInput.stub(TRes res) =
      _CopyWithStubImpl$Input$LoginInput;

  TRes call({String? email, String? password});
}

class _CopyWithImpl$Input$LoginInput<TRes>
    implements CopyWith$Input$LoginInput<TRes> {
  _CopyWithImpl$Input$LoginInput(this._instance, this._then);

  final Input$LoginInput _instance;

  final TRes Function(Input$LoginInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? email = _undefined, Object? password = _undefined}) =>
      _then(
        Input$LoginInput._({
          ..._instance._$data,
          if (email != _undefined && email != null) 'email': (email as String),
          if (password != _undefined && password != null)
            'password': (password as String),
        }),
      );
}

class _CopyWithStubImpl$Input$LoginInput<TRes>
    implements CopyWith$Input$LoginInput<TRes> {
  _CopyWithStubImpl$Input$LoginInput(this._res);

  TRes _res;

  call({String? email, String? password}) => _res;
}

class Input$RecordGameStatsInput {
  factory Input$RecordGameStatsInput({
    required String eventId,
    String? finalScore,
    String? notes,
    String? opponentName,
    List<Input$RecordPlayerStatInput>? playerStats,
    required String teamId,
  }) => Input$RecordGameStatsInput._({
    r'eventId': eventId,
    if (finalScore != null) r'finalScore': finalScore,
    if (notes != null) r'notes': notes,
    if (opponentName != null) r'opponentName': opponentName,
    if (playerStats != null) r'playerStats': playerStats,
    r'teamId': teamId,
  });

  Input$RecordGameStatsInput._(this._$data);

  factory Input$RecordGameStatsInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    if (data.containsKey('finalScore')) {
      final l$finalScore = data['finalScore'];
      result$data['finalScore'] = (l$finalScore as String?);
    }
    if (data.containsKey('notes')) {
      final l$notes = data['notes'];
      result$data['notes'] = (l$notes as String?);
    }
    if (data.containsKey('opponentName')) {
      final l$opponentName = data['opponentName'];
      result$data['opponentName'] = (l$opponentName as String?);
    }
    if (data.containsKey('playerStats')) {
      final l$playerStats = data['playerStats'];
      result$data['playerStats'] = (l$playerStats as List<dynamic>?)
          ?.map(
            (e) => Input$RecordPlayerStatInput.fromJson(
              (e as Map<String, dynamic>),
            ),
          )
          .toList();
    }
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    return Input$RecordGameStatsInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  String? get finalScore => (_$data['finalScore'] as String?);

  String? get notes => (_$data['notes'] as String?);

  String? get opponentName => (_$data['opponentName'] as String?);

  List<Input$RecordPlayerStatInput>? get playerStats =>
      (_$data['playerStats'] as List<Input$RecordPlayerStatInput>?);

  String get teamId => (_$data['teamId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    if (_$data.containsKey('finalScore')) {
      final l$finalScore = finalScore;
      result$data['finalScore'] = l$finalScore;
    }
    if (_$data.containsKey('notes')) {
      final l$notes = notes;
      result$data['notes'] = l$notes;
    }
    if (_$data.containsKey('opponentName')) {
      final l$opponentName = opponentName;
      result$data['opponentName'] = l$opponentName;
    }
    if (_$data.containsKey('playerStats')) {
      final l$playerStats = playerStats;
      result$data['playerStats'] = l$playerStats
          ?.map((e) => e.toJson())
          .toList();
    }
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    return result$data;
  }

  CopyWith$Input$RecordGameStatsInput<Input$RecordGameStatsInput>
  get copyWith => CopyWith$Input$RecordGameStatsInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RecordGameStatsInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$finalScore = finalScore;
    final lOther$finalScore = other.finalScore;
    if (_$data.containsKey('finalScore') !=
        other._$data.containsKey('finalScore')) {
      return false;
    }
    if (l$finalScore != lOther$finalScore) {
      return false;
    }
    final l$notes = notes;
    final lOther$notes = other.notes;
    if (_$data.containsKey('notes') != other._$data.containsKey('notes')) {
      return false;
    }
    if (l$notes != lOther$notes) {
      return false;
    }
    final l$opponentName = opponentName;
    final lOther$opponentName = other.opponentName;
    if (_$data.containsKey('opponentName') !=
        other._$data.containsKey('opponentName')) {
      return false;
    }
    if (l$opponentName != lOther$opponentName) {
      return false;
    }
    final l$playerStats = playerStats;
    final lOther$playerStats = other.playerStats;
    if (_$data.containsKey('playerStats') !=
        other._$data.containsKey('playerStats')) {
      return false;
    }
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
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (l$teamId != lOther$teamId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    final l$finalScore = finalScore;
    final l$notes = notes;
    final l$opponentName = opponentName;
    final l$playerStats = playerStats;
    final l$teamId = teamId;
    return Object.hashAll([
      l$eventId,
      _$data.containsKey('finalScore') ? l$finalScore : const {},
      _$data.containsKey('notes') ? l$notes : const {},
      _$data.containsKey('opponentName') ? l$opponentName : const {},
      _$data.containsKey('playerStats')
          ? l$playerStats == null
                ? null
                : Object.hashAll(l$playerStats.map((v) => v))
          : const {},
      l$teamId,
    ]);
  }
}

abstract class CopyWith$Input$RecordGameStatsInput<TRes> {
  factory CopyWith$Input$RecordGameStatsInput(
    Input$RecordGameStatsInput instance,
    TRes Function(Input$RecordGameStatsInput) then,
  ) = _CopyWithImpl$Input$RecordGameStatsInput;

  factory CopyWith$Input$RecordGameStatsInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RecordGameStatsInput;

  TRes call({
    String? eventId,
    String? finalScore,
    String? notes,
    String? opponentName,
    List<Input$RecordPlayerStatInput>? playerStats,
    String? teamId,
  });
  TRes playerStats(
    Iterable<Input$RecordPlayerStatInput>? Function(
      Iterable<
        CopyWith$Input$RecordPlayerStatInput<Input$RecordPlayerStatInput>
      >?,
    )
    _fn,
  );
}

class _CopyWithImpl$Input$RecordGameStatsInput<TRes>
    implements CopyWith$Input$RecordGameStatsInput<TRes> {
  _CopyWithImpl$Input$RecordGameStatsInput(this._instance, this._then);

  final Input$RecordGameStatsInput _instance;

  final TRes Function(Input$RecordGameStatsInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eventId = _undefined,
    Object? finalScore = _undefined,
    Object? notes = _undefined,
    Object? opponentName = _undefined,
    Object? playerStats = _undefined,
    Object? teamId = _undefined,
  }) => _then(
    Input$RecordGameStatsInput._({
      ..._instance._$data,
      if (eventId != _undefined && eventId != null)
        'eventId': (eventId as String),
      if (finalScore != _undefined) 'finalScore': (finalScore as String?),
      if (notes != _undefined) 'notes': (notes as String?),
      if (opponentName != _undefined) 'opponentName': (opponentName as String?),
      if (playerStats != _undefined)
        'playerStats': (playerStats as List<Input$RecordPlayerStatInput>?),
      if (teamId != _undefined && teamId != null) 'teamId': (teamId as String),
    }),
  );

  TRes playerStats(
    Iterable<Input$RecordPlayerStatInput>? Function(
      Iterable<
        CopyWith$Input$RecordPlayerStatInput<Input$RecordPlayerStatInput>
      >?,
    )
    _fn,
  ) => call(
    playerStats: _fn(
      _instance.playerStats?.map(
        (e) => CopyWith$Input$RecordPlayerStatInput(e, (i) => i),
      ),
    )?.toList(),
  );
}

class _CopyWithStubImpl$Input$RecordGameStatsInput<TRes>
    implements CopyWith$Input$RecordGameStatsInput<TRes> {
  _CopyWithStubImpl$Input$RecordGameStatsInput(this._res);

  TRes _res;

  call({
    String? eventId,
    String? finalScore,
    String? notes,
    String? opponentName,
    List<Input$RecordPlayerStatInput>? playerStats,
    String? teamId,
  }) => _res;

  playerStats(_fn) => _res;
}

class Input$RecordPlayerStatInput {
  factory Input$RecordPlayerStatInput({
    int? assists,
    int? minutesPlayed,
    int? points,
    int? rebounds,
    required String userId,
  }) => Input$RecordPlayerStatInput._({
    if (assists != null) r'assists': assists,
    if (minutesPlayed != null) r'minutesPlayed': minutesPlayed,
    if (points != null) r'points': points,
    if (rebounds != null) r'rebounds': rebounds,
    r'userId': userId,
  });

  Input$RecordPlayerStatInput._(this._$data);

  factory Input$RecordPlayerStatInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('assists')) {
      final l$assists = data['assists'];
      result$data['assists'] = (l$assists as int?);
    }
    if (data.containsKey('minutesPlayed')) {
      final l$minutesPlayed = data['minutesPlayed'];
      result$data['minutesPlayed'] = (l$minutesPlayed as int?);
    }
    if (data.containsKey('points')) {
      final l$points = data['points'];
      result$data['points'] = (l$points as int?);
    }
    if (data.containsKey('rebounds')) {
      final l$rebounds = data['rebounds'];
      result$data['rebounds'] = (l$rebounds as int?);
    }
    final l$userId = data['userId'];
    result$data['userId'] = (l$userId as String);
    return Input$RecordPlayerStatInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get assists => (_$data['assists'] as int?);

  int? get minutesPlayed => (_$data['minutesPlayed'] as int?);

  int? get points => (_$data['points'] as int?);

  int? get rebounds => (_$data['rebounds'] as int?);

  String get userId => (_$data['userId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('assists')) {
      final l$assists = assists;
      result$data['assists'] = l$assists;
    }
    if (_$data.containsKey('minutesPlayed')) {
      final l$minutesPlayed = minutesPlayed;
      result$data['minutesPlayed'] = l$minutesPlayed;
    }
    if (_$data.containsKey('points')) {
      final l$points = points;
      result$data['points'] = l$points;
    }
    if (_$data.containsKey('rebounds')) {
      final l$rebounds = rebounds;
      result$data['rebounds'] = l$rebounds;
    }
    final l$userId = userId;
    result$data['userId'] = l$userId;
    return result$data;
  }

  CopyWith$Input$RecordPlayerStatInput<Input$RecordPlayerStatInput>
  get copyWith => CopyWith$Input$RecordPlayerStatInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$RecordPlayerStatInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$assists = assists;
    final lOther$assists = other.assists;
    if (_$data.containsKey('assists') != other._$data.containsKey('assists')) {
      return false;
    }
    if (l$assists != lOther$assists) {
      return false;
    }
    final l$minutesPlayed = minutesPlayed;
    final lOther$minutesPlayed = other.minutesPlayed;
    if (_$data.containsKey('minutesPlayed') !=
        other._$data.containsKey('minutesPlayed')) {
      return false;
    }
    if (l$minutesPlayed != lOther$minutesPlayed) {
      return false;
    }
    final l$points = points;
    final lOther$points = other.points;
    if (_$data.containsKey('points') != other._$data.containsKey('points')) {
      return false;
    }
    if (l$points != lOther$points) {
      return false;
    }
    final l$rebounds = rebounds;
    final lOther$rebounds = other.rebounds;
    if (_$data.containsKey('rebounds') !=
        other._$data.containsKey('rebounds')) {
      return false;
    }
    if (l$rebounds != lOther$rebounds) {
      return false;
    }
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$assists = assists;
    final l$minutesPlayed = minutesPlayed;
    final l$points = points;
    final l$rebounds = rebounds;
    final l$userId = userId;
    return Object.hashAll([
      _$data.containsKey('assists') ? l$assists : const {},
      _$data.containsKey('minutesPlayed') ? l$minutesPlayed : const {},
      _$data.containsKey('points') ? l$points : const {},
      _$data.containsKey('rebounds') ? l$rebounds : const {},
      l$userId,
    ]);
  }
}

abstract class CopyWith$Input$RecordPlayerStatInput<TRes> {
  factory CopyWith$Input$RecordPlayerStatInput(
    Input$RecordPlayerStatInput instance,
    TRes Function(Input$RecordPlayerStatInput) then,
  ) = _CopyWithImpl$Input$RecordPlayerStatInput;

  factory CopyWith$Input$RecordPlayerStatInput.stub(TRes res) =
      _CopyWithStubImpl$Input$RecordPlayerStatInput;

  TRes call({
    int? assists,
    int? minutesPlayed,
    int? points,
    int? rebounds,
    String? userId,
  });
}

class _CopyWithImpl$Input$RecordPlayerStatInput<TRes>
    implements CopyWith$Input$RecordPlayerStatInput<TRes> {
  _CopyWithImpl$Input$RecordPlayerStatInput(this._instance, this._then);

  final Input$RecordPlayerStatInput _instance;

  final TRes Function(Input$RecordPlayerStatInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? assists = _undefined,
    Object? minutesPlayed = _undefined,
    Object? points = _undefined,
    Object? rebounds = _undefined,
    Object? userId = _undefined,
  }) => _then(
    Input$RecordPlayerStatInput._({
      ..._instance._$data,
      if (assists != _undefined) 'assists': (assists as int?),
      if (minutesPlayed != _undefined) 'minutesPlayed': (minutesPlayed as int?),
      if (points != _undefined) 'points': (points as int?),
      if (rebounds != _undefined) 'rebounds': (rebounds as int?),
      if (userId != _undefined && userId != null) 'userId': (userId as String),
    }),
  );
}

class _CopyWithStubImpl$Input$RecordPlayerStatInput<TRes>
    implements CopyWith$Input$RecordPlayerStatInput<TRes> {
  _CopyWithStubImpl$Input$RecordPlayerStatInput(this._res);

  TRes _res;

  call({
    int? assists,
    int? minutesPlayed,
    int? points,
    int? rebounds,
    String? userId,
  }) => _res;
}

class Input$SendMessageInput {
  factory Input$SendMessageInput({
    required String content,
    required String teamId,
  }) => Input$SendMessageInput._({r'content': content, r'teamId': teamId});

  Input$SendMessageInput._(this._$data);

  factory Input$SendMessageInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$content = data['content'];
    result$data['content'] = (l$content as String);
    final l$teamId = data['teamId'];
    result$data['teamId'] = (l$teamId as String);
    return Input$SendMessageInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get content => (_$data['content'] as String);

  String get teamId => (_$data['teamId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$content = content;
    result$data['content'] = l$content;
    final l$teamId = teamId;
    result$data['teamId'] = l$teamId;
    return result$data;
  }

  CopyWith$Input$SendMessageInput<Input$SendMessageInput> get copyWith =>
      CopyWith$Input$SendMessageInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SendMessageInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$content = content;
    final lOther$content = other.content;
    if (l$content != lOther$content) {
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
    final l$content = content;
    final l$teamId = teamId;
    return Object.hashAll([l$content, l$teamId]);
  }
}

abstract class CopyWith$Input$SendMessageInput<TRes> {
  factory CopyWith$Input$SendMessageInput(
    Input$SendMessageInput instance,
    TRes Function(Input$SendMessageInput) then,
  ) = _CopyWithImpl$Input$SendMessageInput;

  factory CopyWith$Input$SendMessageInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SendMessageInput;

  TRes call({String? content, String? teamId});
}

class _CopyWithImpl$Input$SendMessageInput<TRes>
    implements CopyWith$Input$SendMessageInput<TRes> {
  _CopyWithImpl$Input$SendMessageInput(this._instance, this._then);

  final Input$SendMessageInput _instance;

  final TRes Function(Input$SendMessageInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? content = _undefined, Object? teamId = _undefined}) =>
      _then(
        Input$SendMessageInput._({
          ..._instance._$data,
          if (content != _undefined && content != null)
            'content': (content as String),
          if (teamId != _undefined && teamId != null)
            'teamId': (teamId as String),
        }),
      );
}

class _CopyWithStubImpl$Input$SendMessageInput<TRes>
    implements CopyWith$Input$SendMessageInput<TRes> {
  _CopyWithStubImpl$Input$SendMessageInput(this._res);

  TRes _res;

  call({String? content, String? teamId}) => _res;
}

class Input$SignupInput {
  factory Input$SignupInput({
    required String email,
    String? firstName,
    String? lastName,
    required String password,
    Enum$UserRole? role,
  }) => Input$SignupInput._({
    r'email': email,
    if (firstName != null) r'firstName': firstName,
    if (lastName != null) r'lastName': lastName,
    r'password': password,
    if (role != null) r'role': role,
  });

  Input$SignupInput._(this._$data);

  factory Input$SignupInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    final l$password = data['password'];
    result$data['password'] = (l$password as String);
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = l$role == null
          ? null
          : fromJson$Enum$UserRole((l$role as String));
    }
    return Input$SignupInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get email => (_$data['email'] as String);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String get password => (_$data['password'] as String);

  Enum$UserRole? get role => (_$data['role'] as Enum$UserRole?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$email = email;
    result$data['email'] = l$email;
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    final l$password = password;
    result$data['password'] = l$password;
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] = l$role == null
          ? null
          : toJson$Enum$UserRole(l$role);
    }
    return result$data;
  }

  CopyWith$Input$SignupInput<Input$SignupInput> get copyWith =>
      CopyWith$Input$SignupInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$SignupInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$email = email;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$password = password;
    final l$role = role;
    return Object.hashAll([
      l$email,
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      l$password,
      _$data.containsKey('role') ? l$role : const {},
    ]);
  }
}

abstract class CopyWith$Input$SignupInput<TRes> {
  factory CopyWith$Input$SignupInput(
    Input$SignupInput instance,
    TRes Function(Input$SignupInput) then,
  ) = _CopyWithImpl$Input$SignupInput;

  factory CopyWith$Input$SignupInput.stub(TRes res) =
      _CopyWithStubImpl$Input$SignupInput;

  TRes call({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    Enum$UserRole? role,
  });
}

class _CopyWithImpl$Input$SignupInput<TRes>
    implements CopyWith$Input$SignupInput<TRes> {
  _CopyWithImpl$Input$SignupInput(this._instance, this._then);

  final Input$SignupInput _instance;

  final TRes Function(Input$SignupInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? email = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? password = _undefined,
    Object? role = _undefined,
  }) => _then(
    Input$SignupInput._({
      ..._instance._$data,
      if (email != _undefined && email != null) 'email': (email as String),
      if (firstName != _undefined) 'firstName': (firstName as String?),
      if (lastName != _undefined) 'lastName': (lastName as String?),
      if (password != _undefined && password != null)
        'password': (password as String),
      if (role != _undefined) 'role': (role as Enum$UserRole?),
    }),
  );
}

class _CopyWithStubImpl$Input$SignupInput<TRes>
    implements CopyWith$Input$SignupInput<TRes> {
  _CopyWithStubImpl$Input$SignupInput(this._res);

  TRes _res;

  call({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    Enum$UserRole? role,
  }) => _res;
}

class Input$UpdateEventInput {
  factory Input$UpdateEventInput({
    String? description,
    DateTime? endTime,
    Enum$EventType? eventType,
    required String id,
    String? location,
    DateTime? startTime,
    String? teamId,
    String? title,
  }) => Input$UpdateEventInput._({
    if (description != null) r'description': description,
    if (endTime != null) r'endTime': endTime,
    if (eventType != null) r'eventType': eventType,
    r'id': id,
    if (location != null) r'location': location,
    if (startTime != null) r'startTime': startTime,
    if (teamId != null) r'teamId': teamId,
    if (title != null) r'title': title,
  });

  Input$UpdateEventInput._(this._$data);

  factory Input$UpdateEventInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = l$endTime == null
          ? null
          : DateTime.parse((l$endTime as String));
    }
    if (data.containsKey('eventType')) {
      final l$eventType = data['eventType'];
      result$data['eventType'] = l$eventType == null
          ? null
          : fromJson$Enum$EventType((l$eventType as String));
    }
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('location')) {
      final l$location = data['location'];
      result$data['location'] = (l$location as String?);
    }
    if (data.containsKey('startTime')) {
      final l$startTime = data['startTime'];
      result$data['startTime'] = l$startTime == null
          ? null
          : DateTime.parse((l$startTime as String));
    }
    if (data.containsKey('teamId')) {
      final l$teamId = data['teamId'];
      result$data['teamId'] = (l$teamId as String?);
    }
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    return Input$UpdateEventInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  DateTime? get endTime => (_$data['endTime'] as DateTime?);

  Enum$EventType? get eventType => (_$data['eventType'] as Enum$EventType?);

  String get id => (_$data['id'] as String);

  String? get location => (_$data['location'] as String?);

  DateTime? get startTime => (_$data['startTime'] as DateTime?);

  String? get teamId => (_$data['teamId'] as String?);

  String? get title => (_$data['title'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime?.toIso8601String();
    }
    if (_$data.containsKey('eventType')) {
      final l$eventType = eventType;
      result$data['eventType'] = l$eventType == null
          ? null
          : toJson$Enum$EventType(l$eventType);
    }
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('location')) {
      final l$location = location;
      result$data['location'] = l$location;
    }
    if (_$data.containsKey('startTime')) {
      final l$startTime = startTime;
      result$data['startTime'] = l$startTime?.toIso8601String();
    }
    if (_$data.containsKey('teamId')) {
      final l$teamId = teamId;
      result$data['teamId'] = l$teamId;
    }
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    return result$data;
  }

  CopyWith$Input$UpdateEventInput<Input$UpdateEventInput> get copyWith =>
      CopyWith$Input$UpdateEventInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateEventInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$eventType = eventType;
    final lOther$eventType = other.eventType;
    if (_$data.containsKey('eventType') !=
        other._$data.containsKey('eventType')) {
      return false;
    }
    if (l$eventType != lOther$eventType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$location = location;
    final lOther$location = other.location;
    if (_$data.containsKey('location') !=
        other._$data.containsKey('location')) {
      return false;
    }
    if (l$location != lOther$location) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (_$data.containsKey('startTime') !=
        other._$data.containsKey('startTime')) {
      return false;
    }
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$teamId = teamId;
    final lOther$teamId = other.teamId;
    if (_$data.containsKey('teamId') != other._$data.containsKey('teamId')) {
      return false;
    }
    if (l$teamId != lOther$teamId) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$endTime = endTime;
    final l$eventType = eventType;
    final l$id = id;
    final l$location = location;
    final l$startTime = startTime;
    final l$teamId = teamId;
    final l$title = title;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('endTime') ? l$endTime : const {},
      _$data.containsKey('eventType') ? l$eventType : const {},
      l$id,
      _$data.containsKey('location') ? l$location : const {},
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('teamId') ? l$teamId : const {},
      _$data.containsKey('title') ? l$title : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateEventInput<TRes> {
  factory CopyWith$Input$UpdateEventInput(
    Input$UpdateEventInput instance,
    TRes Function(Input$UpdateEventInput) then,
  ) = _CopyWithImpl$Input$UpdateEventInput;

  factory CopyWith$Input$UpdateEventInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateEventInput;

  TRes call({
    String? description,
    DateTime? endTime,
    Enum$EventType? eventType,
    String? id,
    String? location,
    DateTime? startTime,
    String? teamId,
    String? title,
  });
}

class _CopyWithImpl$Input$UpdateEventInput<TRes>
    implements CopyWith$Input$UpdateEventInput<TRes> {
  _CopyWithImpl$Input$UpdateEventInput(this._instance, this._then);

  final Input$UpdateEventInput _instance;

  final TRes Function(Input$UpdateEventInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? endTime = _undefined,
    Object? eventType = _undefined,
    Object? id = _undefined,
    Object? location = _undefined,
    Object? startTime = _undefined,
    Object? teamId = _undefined,
    Object? title = _undefined,
  }) => _then(
    Input$UpdateEventInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (endTime != _undefined) 'endTime': (endTime as DateTime?),
      if (eventType != _undefined) 'eventType': (eventType as Enum$EventType?),
      if (id != _undefined && id != null) 'id': (id as String),
      if (location != _undefined) 'location': (location as String?),
      if (startTime != _undefined) 'startTime': (startTime as DateTime?),
      if (teamId != _undefined) 'teamId': (teamId as String?),
      if (title != _undefined) 'title': (title as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateEventInput<TRes>
    implements CopyWith$Input$UpdateEventInput<TRes> {
  _CopyWithStubImpl$Input$UpdateEventInput(this._res);

  TRes _res;

  call({
    String? description,
    DateTime? endTime,
    Enum$EventType? eventType,
    String? id,
    String? location,
    DateTime? startTime,
    String? teamId,
    String? title,
  }) => _res;
}

class Input$UpdateNotificationInput {
  factory Input$UpdateNotificationInput({int? exampleField, required int id}) =>
      Input$UpdateNotificationInput._({
        if (exampleField != null) r'exampleField': exampleField,
        r'id': id,
      });

  Input$UpdateNotificationInput._(this._$data);

  factory Input$UpdateNotificationInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('exampleField')) {
      final l$exampleField = data['exampleField'];
      result$data['exampleField'] = (l$exampleField as int?);
    }
    final l$id = data['id'];
    result$data['id'] = (l$id as int);
    return Input$UpdateNotificationInput._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get exampleField => (_$data['exampleField'] as int?);

  int get id => (_$data['id'] as int);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('exampleField')) {
      final l$exampleField = exampleField;
      result$data['exampleField'] = l$exampleField;
    }
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$UpdateNotificationInput<Input$UpdateNotificationInput>
  get copyWith => CopyWith$Input$UpdateNotificationInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateNotificationInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$exampleField = exampleField;
    final lOther$exampleField = other.exampleField;
    if (_$data.containsKey('exampleField') !=
        other._$data.containsKey('exampleField')) {
      return false;
    }
    if (l$exampleField != lOther$exampleField) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$exampleField = exampleField;
    final l$id = id;
    return Object.hashAll([
      _$data.containsKey('exampleField') ? l$exampleField : const {},
      l$id,
    ]);
  }
}

abstract class CopyWith$Input$UpdateNotificationInput<TRes> {
  factory CopyWith$Input$UpdateNotificationInput(
    Input$UpdateNotificationInput instance,
    TRes Function(Input$UpdateNotificationInput) then,
  ) = _CopyWithImpl$Input$UpdateNotificationInput;

  factory CopyWith$Input$UpdateNotificationInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateNotificationInput;

  TRes call({int? exampleField, int? id});
}

class _CopyWithImpl$Input$UpdateNotificationInput<TRes>
    implements CopyWith$Input$UpdateNotificationInput<TRes> {
  _CopyWithImpl$Input$UpdateNotificationInput(this._instance, this._then);

  final Input$UpdateNotificationInput _instance;

  final TRes Function(Input$UpdateNotificationInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? exampleField = _undefined, Object? id = _undefined}) =>
      _then(
        Input$UpdateNotificationInput._({
          ..._instance._$data,
          if (exampleField != _undefined)
            'exampleField': (exampleField as int?),
          if (id != _undefined && id != null) 'id': (id as int),
        }),
      );
}

class _CopyWithStubImpl$Input$UpdateNotificationInput<TRes>
    implements CopyWith$Input$UpdateNotificationInput<TRes> {
  _CopyWithStubImpl$Input$UpdateNotificationInput(this._res);

  TRes _res;

  call({int? exampleField, int? id}) => _res;
}

class Input$UpdateProfileInput {
  factory Input$UpdateProfileInput({String? firstName, String? lastName}) =>
      Input$UpdateProfileInput._({
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
      });

  Input$UpdateProfileInput._(this._$data);

  factory Input$UpdateProfileInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    return Input$UpdateProfileInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    return result$data;
  }

  CopyWith$Input$UpdateProfileInput<Input$UpdateProfileInput> get copyWith =>
      CopyWith$Input$UpdateProfileInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateProfileInput ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firstName = firstName;
    final l$lastName = lastName;
    return Object.hashAll([
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateProfileInput<TRes> {
  factory CopyWith$Input$UpdateProfileInput(
    Input$UpdateProfileInput instance,
    TRes Function(Input$UpdateProfileInput) then,
  ) = _CopyWithImpl$Input$UpdateProfileInput;

  factory CopyWith$Input$UpdateProfileInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateProfileInput;

  TRes call({String? firstName, String? lastName});
}

class _CopyWithImpl$Input$UpdateProfileInput<TRes>
    implements CopyWith$Input$UpdateProfileInput<TRes> {
  _CopyWithImpl$Input$UpdateProfileInput(this._instance, this._then);

  final Input$UpdateProfileInput _instance;

  final TRes Function(Input$UpdateProfileInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? firstName = _undefined, Object? lastName = _undefined}) =>
      _then(
        Input$UpdateProfileInput._({
          ..._instance._$data,
          if (firstName != _undefined) 'firstName': (firstName as String?),
          if (lastName != _undefined) 'lastName': (lastName as String?),
        }),
      );
}

class _CopyWithStubImpl$Input$UpdateProfileInput<TRes>
    implements CopyWith$Input$UpdateProfileInput<TRes> {
  _CopyWithStubImpl$Input$UpdateProfileInput(this._res);

  TRes _res;

  call({String? firstName, String? lastName}) => _res;
}

class Input$UpdateRsvpInput {
  factory Input$UpdateRsvpInput({
    required String eventId,
    required Enum$RsvpStatus status,
  }) => Input$UpdateRsvpInput._({r'eventId': eventId, r'status': status});

  Input$UpdateRsvpInput._(this._$data);

  factory Input$UpdateRsvpInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$eventId = data['eventId'];
    result$data['eventId'] = (l$eventId as String);
    final l$status = data['status'];
    result$data['status'] = fromJson$Enum$RsvpStatus((l$status as String));
    return Input$UpdateRsvpInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get eventId => (_$data['eventId'] as String);

  Enum$RsvpStatus get status => (_$data['status'] as Enum$RsvpStatus);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$eventId = eventId;
    result$data['eventId'] = l$eventId;
    final l$status = status;
    result$data['status'] = toJson$Enum$RsvpStatus(l$status);
    return result$data;
  }

  CopyWith$Input$UpdateRsvpInput<Input$UpdateRsvpInput> get copyWith =>
      CopyWith$Input$UpdateRsvpInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateRsvpInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$eventId = eventId;
    final lOther$eventId = other.eventId;
    if (l$eventId != lOther$eventId) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eventId = eventId;
    final l$status = status;
    return Object.hashAll([l$eventId, l$status]);
  }
}

abstract class CopyWith$Input$UpdateRsvpInput<TRes> {
  factory CopyWith$Input$UpdateRsvpInput(
    Input$UpdateRsvpInput instance,
    TRes Function(Input$UpdateRsvpInput) then,
  ) = _CopyWithImpl$Input$UpdateRsvpInput;

  factory CopyWith$Input$UpdateRsvpInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateRsvpInput;

  TRes call({String? eventId, Enum$RsvpStatus? status});
}

class _CopyWithImpl$Input$UpdateRsvpInput<TRes>
    implements CopyWith$Input$UpdateRsvpInput<TRes> {
  _CopyWithImpl$Input$UpdateRsvpInput(this._instance, this._then);

  final Input$UpdateRsvpInput _instance;

  final TRes Function(Input$UpdateRsvpInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? eventId = _undefined, Object? status = _undefined}) =>
      _then(
        Input$UpdateRsvpInput._({
          ..._instance._$data,
          if (eventId != _undefined && eventId != null)
            'eventId': (eventId as String),
          if (status != _undefined && status != null)
            'status': (status as Enum$RsvpStatus),
        }),
      );
}

class _CopyWithStubImpl$Input$UpdateRsvpInput<TRes>
    implements CopyWith$Input$UpdateRsvpInput<TRes> {
  _CopyWithStubImpl$Input$UpdateRsvpInput(this._res);

  TRes _res;

  call({String? eventId, Enum$RsvpStatus? status}) => _res;
}

class Input$UpdateTeamInput {
  factory Input$UpdateTeamInput({
    String? description,
    required String id,
    String? name,
    String? newRole,
    String? sport,
    String? targetUserId,
  }) => Input$UpdateTeamInput._({
    if (description != null) r'description': description,
    r'id': id,
    if (name != null) r'name': name,
    if (newRole != null) r'newRole': newRole,
    if (sport != null) r'sport': sport,
    if (targetUserId != null) r'targetUserId': targetUserId,
  });

  Input$UpdateTeamInput._(this._$data);

  factory Input$UpdateTeamInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('newRole')) {
      final l$newRole = data['newRole'];
      result$data['newRole'] = (l$newRole as String?);
    }
    if (data.containsKey('sport')) {
      final l$sport = data['sport'];
      result$data['sport'] = (l$sport as String?);
    }
    if (data.containsKey('targetUserId')) {
      final l$targetUserId = data['targetUserId'];
      result$data['targetUserId'] = (l$targetUserId as String?);
    }
    return Input$UpdateTeamInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get description => (_$data['description'] as String?);

  String get id => (_$data['id'] as String);

  String? get name => (_$data['name'] as String?);

  String? get newRole => (_$data['newRole'] as String?);

  String? get sport => (_$data['sport'] as String?);

  String? get targetUserId => (_$data['targetUserId'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('newRole')) {
      final l$newRole = newRole;
      result$data['newRole'] = l$newRole;
    }
    if (_$data.containsKey('sport')) {
      final l$sport = sport;
      result$data['sport'] = l$sport;
    }
    if (_$data.containsKey('targetUserId')) {
      final l$targetUserId = targetUserId;
      result$data['targetUserId'] = l$targetUserId;
    }
    return result$data;
  }

  CopyWith$Input$UpdateTeamInput<Input$UpdateTeamInput> get copyWith =>
      CopyWith$Input$UpdateTeamInput(this, (i) => i);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$UpdateTeamInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$newRole = newRole;
    final lOther$newRole = other.newRole;
    if (_$data.containsKey('newRole') != other._$data.containsKey('newRole')) {
      return false;
    }
    if (l$newRole != lOther$newRole) {
      return false;
    }
    final l$sport = sport;
    final lOther$sport = other.sport;
    if (_$data.containsKey('sport') != other._$data.containsKey('sport')) {
      return false;
    }
    if (l$sport != lOther$sport) {
      return false;
    }
    final l$targetUserId = targetUserId;
    final lOther$targetUserId = other.targetUserId;
    if (_$data.containsKey('targetUserId') !=
        other._$data.containsKey('targetUserId')) {
      return false;
    }
    if (l$targetUserId != lOther$targetUserId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$description = description;
    final l$id = id;
    final l$name = name;
    final l$newRole = newRole;
    final l$sport = sport;
    final l$targetUserId = targetUserId;
    return Object.hashAll([
      _$data.containsKey('description') ? l$description : const {},
      l$id,
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('newRole') ? l$newRole : const {},
      _$data.containsKey('sport') ? l$sport : const {},
      _$data.containsKey('targetUserId') ? l$targetUserId : const {},
    ]);
  }
}

abstract class CopyWith$Input$UpdateTeamInput<TRes> {
  factory CopyWith$Input$UpdateTeamInput(
    Input$UpdateTeamInput instance,
    TRes Function(Input$UpdateTeamInput) then,
  ) = _CopyWithImpl$Input$UpdateTeamInput;

  factory CopyWith$Input$UpdateTeamInput.stub(TRes res) =
      _CopyWithStubImpl$Input$UpdateTeamInput;

  TRes call({
    String? description,
    String? id,
    String? name,
    String? newRole,
    String? sport,
    String? targetUserId,
  });
}

class _CopyWithImpl$Input$UpdateTeamInput<TRes>
    implements CopyWith$Input$UpdateTeamInput<TRes> {
  _CopyWithImpl$Input$UpdateTeamInput(this._instance, this._then);

  final Input$UpdateTeamInput _instance;

  final TRes Function(Input$UpdateTeamInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? description = _undefined,
    Object? id = _undefined,
    Object? name = _undefined,
    Object? newRole = _undefined,
    Object? sport = _undefined,
    Object? targetUserId = _undefined,
  }) => _then(
    Input$UpdateTeamInput._({
      ..._instance._$data,
      if (description != _undefined) 'description': (description as String?),
      if (id != _undefined && id != null) 'id': (id as String),
      if (name != _undefined) 'name': (name as String?),
      if (newRole != _undefined) 'newRole': (newRole as String?),
      if (sport != _undefined) 'sport': (sport as String?),
      if (targetUserId != _undefined) 'targetUserId': (targetUserId as String?),
    }),
  );
}

class _CopyWithStubImpl$Input$UpdateTeamInput<TRes>
    implements CopyWith$Input$UpdateTeamInput<TRes> {
  _CopyWithStubImpl$Input$UpdateTeamInput(this._res);

  TRes _res;

  call({
    String? description,
    String? id,
    String? name,
    String? newRole,
    String? sport,
    String? targetUserId,
  }) => _res;
}

enum Enum$EventType {
  GAME,
  MEETING,
  PRACTICE,
  $unknown;

  factory Enum$EventType.fromJson(String value) =>
      fromJson$Enum$EventType(value);

  String toJson() => toJson$Enum$EventType(this);
}

String toJson$Enum$EventType(Enum$EventType e) {
  switch (e) {
    case Enum$EventType.GAME:
      return r'GAME';
    case Enum$EventType.MEETING:
      return r'MEETING';
    case Enum$EventType.PRACTICE:
      return r'PRACTICE';
    case Enum$EventType.$unknown:
      return r'$unknown';
  }
}

Enum$EventType fromJson$Enum$EventType(String value) {
  switch (value) {
    case r'GAME':
      return Enum$EventType.GAME;
    case r'MEETING':
      return Enum$EventType.MEETING;
    case r'PRACTICE':
      return Enum$EventType.PRACTICE;
    default:
      return Enum$EventType.$unknown;
  }
}

enum Enum$MemberRole {
  COACH,
  LEADER,
  PARENT,
  PLAYER,
  $unknown;

  factory Enum$MemberRole.fromJson(String value) =>
      fromJson$Enum$MemberRole(value);

  String toJson() => toJson$Enum$MemberRole(this);
}

String toJson$Enum$MemberRole(Enum$MemberRole e) {
  switch (e) {
    case Enum$MemberRole.COACH:
      return r'COACH';
    case Enum$MemberRole.LEADER:
      return r'LEADER';
    case Enum$MemberRole.PARENT:
      return r'PARENT';
    case Enum$MemberRole.PLAYER:
      return r'PLAYER';
    case Enum$MemberRole.$unknown:
      return r'$unknown';
  }
}

Enum$MemberRole fromJson$Enum$MemberRole(String value) {
  switch (value) {
    case r'COACH':
      return Enum$MemberRole.COACH;
    case r'LEADER':
      return Enum$MemberRole.LEADER;
    case r'PARENT':
      return Enum$MemberRole.PARENT;
    case r'PLAYER':
      return Enum$MemberRole.PLAYER;
    default:
      return Enum$MemberRole.$unknown;
  }
}

enum Enum$RsvpStatus {
  COMING,
  NOT_COMING,
  TBD,
  $unknown;

  factory Enum$RsvpStatus.fromJson(String value) =>
      fromJson$Enum$RsvpStatus(value);

  String toJson() => toJson$Enum$RsvpStatus(this);
}

String toJson$Enum$RsvpStatus(Enum$RsvpStatus e) {
  switch (e) {
    case Enum$RsvpStatus.COMING:
      return r'COMING';
    case Enum$RsvpStatus.NOT_COMING:
      return r'NOT_COMING';
    case Enum$RsvpStatus.TBD:
      return r'TBD';
    case Enum$RsvpStatus.$unknown:
      return r'$unknown';
  }
}

Enum$RsvpStatus fromJson$Enum$RsvpStatus(String value) {
  switch (value) {
    case r'COMING':
      return Enum$RsvpStatus.COMING;
    case r'NOT_COMING':
      return Enum$RsvpStatus.NOT_COMING;
    case r'TBD':
      return Enum$RsvpStatus.TBD;
    default:
      return Enum$RsvpStatus.$unknown;
  }
}

enum Enum$UserRole {
  ADMIN,
  USER,
  $unknown;

  factory Enum$UserRole.fromJson(String value) => fromJson$Enum$UserRole(value);

  String toJson() => toJson$Enum$UserRole(this);
}

String toJson$Enum$UserRole(Enum$UserRole e) {
  switch (e) {
    case Enum$UserRole.ADMIN:
      return r'ADMIN';
    case Enum$UserRole.USER:
      return r'USER';
    case Enum$UserRole.$unknown:
      return r'$unknown';
  }
}

Enum$UserRole fromJson$Enum$UserRole(String value) {
  switch (value) {
    case r'ADMIN':
      return Enum$UserRole.ADMIN;
    case r'USER':
      return Enum$UserRole.USER;
    default:
      return Enum$UserRole.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
