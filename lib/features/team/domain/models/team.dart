import '../../../../graphql/operations/teams.graphql.dart';

enum MemberRole { player, coach, parent, leader }

class TeamMember {
  const TeamMember({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.roles,
    required this.joinedAt,
    this.firstName,
    this.lastName,
    this.email,
  });

  final String id;
  final String teamId;
  final String userId;
  final List<MemberRole> roles;
  final DateTime joinedAt;
  final String? firstName;
  final String? lastName;
  final String? email;

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    final roleList = (json['role'] as List<dynamic>? ?? []).map((r) {
      switch (r.toString()) {
        case 'coach': return MemberRole.coach;
        case 'parent': return MemberRole.parent;
        case 'leader': return MemberRole.leader;
        default: return MemberRole.player;
      }
    }).toList();
    // Backend now returns firstName/lastName directly on the member object.
    // Fall back to nested `user` object for backwards compatibility.
    final user = json['user'] as Map<String, dynamic>?;
    return TeamMember(
      id: json['id'] as String,
      teamId: json['teamId'] as String,
      userId: json['userId'] as String,
      roles: roleList,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      firstName: (json['firstName'] as String?) ?? user?['firstName'] as String?,
      lastName: (json['lastName'] as String?) ?? user?['lastName'] as String?,
      email: (json['email'] as String?) ?? user?['email'] as String?,
    );
  }

  String get displayName {
    final name = [firstName, lastName].where((s) => s != null && s.isNotEmpty).join(' ');
    return name.isNotEmpty ? name : email ?? userId;
  }
}

class Team {
  const Team({
    required this.id,
    required this.name,
    required this.sport,
    this.description,
    required this.joinCode,
    required this.createdAt,
    required this.updatedAt,
    this.memberCount = 0,
  });

  final String id;
  final String name;
  final String sport;
  final String? description;
  final String joinCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int memberCount;

  factory Team.fromMyTeamsQuery(Query$GetMyTeams$myTeams team) => Team(
        id: team.id,
        name: team.name,
        sport: team.sport,
        description: team.description,
        joinCode: team.joinCode,
        createdAt: team.createdAt,
        updatedAt: team.updatedAt,
        memberCount: team.members?.length ?? 0,
      );

  factory Team.fromCreateMutation(Mutation$CreateTeam$createTeam team) => Team(
        id: team.id,
        name: team.name,
        sport: team.sport,
        description: team.description,
        joinCode: team.joinCode,
        createdAt: team.createdAt,
        updatedAt: team.updatedAt,
        memberCount: team.members?.length ?? 0,
      );

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'] as String,
        name: json['name'] as String,
        sport: json['sport'] as String,
        description: json['description'] as String?,
        joinCode: json['joinCode'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        memberCount: (json['members'] as List?)?.length ?? 0,
      );
}
