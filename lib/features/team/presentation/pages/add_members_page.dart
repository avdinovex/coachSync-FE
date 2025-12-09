import 'package:flutter/material.dart';

/// Deprecated placeholder kept to avoid stale imports from older branches.
///
/// Members should now be managed through the backend-driven flows in
/// [TeamSelectionPage] and related screens. Attempting to use this page will
/// throw to highlight the deprecation.
class AddMembersPage extends StatelessWidget {
  const AddMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError(
      'AddMembersPage has been removed. Use the team GraphQL flows instead.',
    );
  }
}
