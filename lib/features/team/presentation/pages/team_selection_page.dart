import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/services/auth_service.dart';
import '../../data/team_service.dart';
import '../../domain/models/team.dart';
import '../../../auth/presentation/pages/login_page.dart';
import 'team_detail_page.dart';


class TeamSelectionPage extends StatefulWidget {
  const TeamSelectionPage({
    super.key,
    required this.email,
    this.isEmbedded = false,
  });

  final String email;
  final bool isEmbedded;

  @override
  State<TeamSelectionPage> createState() => _TeamSelectionPageState();
}


class _TeamSelectionPageState extends State<TeamSelectionPage> {
  final TeamService _teamService = TeamService();
  final List<Team> _teams = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    print('🔵 [TeamSelectionPage] _loadTeams started');
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      print('🔵 [TeamSelectionPage] Calling TeamService.fetchMyTeams()');
      final teams = await _teamService.fetchMyTeams();
      print('🟢 [TeamSelectionPage] Teams fetched: ${teams.length} teams');
      
      if (!mounted) {
        print('⚠️ [TeamSelectionPage] Widget not mounted, skipping UI update');
        return;
      }
      
      setState(() {
        _teams
          ..clear()
          ..addAll(teams);
      });
      print('🟢 [TeamSelectionPage] UI updated with teams');
    } on TimeoutException catch (e) {
      print('🔴 [TeamSelectionPage] TimeoutException caught: $e');
      if (!mounted) return;
      setState(() {
        _error = 'Connection timeout. Please check your internet connection and try again.';
      });
    } catch (e, stackTrace) {
      print('🔴 [TeamSelectionPage] Error caught: $e');
      print('🔴 [TeamSelectionPage] Stack trace: $stackTrace');
      if (!mounted) return;
      setState(() {
        _error = e.toString()
            .replaceFirst('TeamException: ', '')
            .replaceFirst('TimeoutException: ', 'Connection timeout: ');
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
        print('🔵 [TeamSelectionPage] _loadTeams completed');
      }
    }
  }

  Future<void> _logout() async {
    await AuthService.clearToken();
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override

  Widget build(BuildContext context) {
    final content = SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, ${widget.email}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Here are the teams you belong to',
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(child: _buildTeamList()),
          ],
        ),
      ),
    );

    if (widget.isEmbedded) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('CoachSync', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loading ? null : _loadTeams,
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
      ),
      body: content,
    );
  }


  Widget _buildTeamList() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return _ErrorState(message: _error!, onRetry: _loadTeams);
    }
    if (_teams.isEmpty) {
      return _EmptyState(onRefresh: _loadTeams);
    }
    return RefreshIndicator(
      onRefresh: _loadTeams,
      child: ListView.separated(
        itemCount: _teams.length,
        itemBuilder: (_, index) => _TeamCard(
          team: _teams[index],
          onTap: () async {
            final result = await Navigator.push<String>(
              context,
              MaterialPageRoute(
                builder: (_) => TeamDetailPage(
                  teamId: _teams[index].id,
                  teamName: _teams[index].name,
                ),
              ),
            );
            if (result == 'deleted') _loadTeams();
          },
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 12),
      ),
    );
  }
}

class _TeamCard extends StatelessWidget {
  const _TeamCard({required this.team, this.onTap});

  final Team team;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sports, color: Colors.white.withOpacity(0.8)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  team.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '${team.memberCount} members',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            team.sport,
            style: TextStyle(color: Colors.grey[400]),
          ),
          if (team.description?.isNotEmpty == true) ...[
            const SizedBox(height: 8),
            Text(
              team.description!,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.vpn_key, size: 16, color: Colors.white70),
                const SizedBox(width: 8),
                Text(
                  'Join Code: ${team.joinCode}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Created ${_formatDate(team.createdAt)}',
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ],
      ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final month = months[local.month - 1];
    return '$month ${local.day}, ${local.year}';
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.flag_outlined, size: 64, color: Colors.white70),
          const SizedBox(height: 16),
          const Text(
            'No teams yet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Create a team or join one using an invite ID.',
            style: TextStyle(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: Colors.red[300], size: 48),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text('Try again', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
