# GraphQL Codegen (Dart)

Workflow:
1. Refresh schema: `./scripts/sync-schema.ps1` (runs in Windows PowerShell). You can:
  - pass `-GraphQLEndpoint https://api.example.com/graphql` (optionally `-GraphQLHeaders "Authorization: Bearer ..."`)
  - or provide `-BackendSchemaPath` / `-BackendRoot` / env vars `COACH_SYNC_BACKEND_*` when copying from a local backend checkout.
2. Keep `.graphql` operations/fragments in `lib/graphql/operations/` alongside the copied `schema.graphql`.
3. Generate types/widgets/hooks with `dart run build_runner build --delete-conflicting-outputs` (requires `build_runner` + `graphql_codegen`).
4. (Optional) Watch for changes: `dart run build_runner watch --delete-conflicting-outputs`.

Example usage with `graphql_flutter` after generation:
```dart
import 'package:graphql_flutter/graphql_flutter.dart';
import 'operations/teams.graphql.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Query$GetTeams$Widget(
      builder: (result, {refetch, fetchMore}) {
        if (result.isLoading) return const CircularProgressIndicator();
        final teams = result.parsedData?.teams ?? [];
        return ListView.builder(
          itemCount: teams.length,
          itemBuilder: (_, index) => ListTile(title: Text(teams[index].name)),
        );
      },
    );
  }
}
```

Regenerate whenever schema or operations change.
