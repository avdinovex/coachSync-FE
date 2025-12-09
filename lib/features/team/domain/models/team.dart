import '../../../../graphql/operations/teams.graphql.dart';

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
}
