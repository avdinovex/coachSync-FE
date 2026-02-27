import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../team/data/team_service.dart';
import '../../../team/domain/models/team.dart';
import '../../../chat/data/chat_service.dart';
import '../../../chat/presentation/pages/team_chat_page.dart';
import '../../../../core/services/auth_service.dart';
import 'home_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TeamService _teamService = TeamService();
  final ChatService _chatService = ChatService();

  List<Team> _teams = [];
  Map<String, UnreadInfo> _unreadCounts = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final teams = await _teamService.fetchMyTeams();
      // Fetch unread counts in parallel
      Map<String, UnreadInfo> unreadCounts = {};
      try {
        unreadCounts = await _chatService.fetchUnreadCounts();
      } catch (_) {
        // Unread counts are non-critical; don't block the page
      }
      if (mounted) {
        setState(() {
          _teams = teams;
          _unreadCounts = unreadCounts;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _refreshUnreadCounts() async {
    try {
      final unreadCounts = await _chatService.fetchUnreadCounts();
      if (mounted) {
        setState(() {
          _unreadCounts = unreadCounts;
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red[300]),
              const SizedBox(height: 12),
              Text(
                'Failed to load teams',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadTeams,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_teams.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey[700]),
            const SizedBox(height: 16),
            Text(
              'No team chats yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Join or create a team to start chatting',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadTeams,
      color: Colors.white,
      backgroundColor: Colors.grey[800],
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _teams.length,
        separatorBuilder: (_, __) => Divider(
          color: Colors.grey[850],
          height: 1,
          indent: 76,
        ),
        itemBuilder: (context, index) {
          final team = _teams[index];
          final unreadInfo = _unreadCounts[team.id];
          return _TeamChatTile(
            team: team,
            unreadInfo: unreadInfo,
            currentUserId: AuthService.currentUser?.id,
            onTap: () => _openTeamChat(team),
          );
        },
      ),
    );
  }

  void _openTeamChat(Team team) async {
    final result = await Navigator.push<dynamic>(
      context,
      MaterialPageRoute(
        builder: (_) => TeamChatPage(
          teamId: team.id,
          teamName: team.name,
        ),
      ),
    );
    // Refresh unread counts when returning from chat
    _refreshUnreadCounts();
    // If the result contains a navigateToEvent key, switch to Events tab
    if (result is Map && result['navigateToEvent'] != null) {
      final eventId = result['navigateToEvent'] as String;
      final homeState = context.findAncestorStateOfType<HomePageState>();
      homeState?.navigateToEvent(eventId);
    }
  }
}

class _TeamChatTile extends StatelessWidget {
  const _TeamChatTile({
    required this.team,
    required this.onTap,
    this.unreadInfo,
    this.currentUserId,
  });

  final Team team;
  final VoidCallback onTap;
  final UnreadInfo? unreadInfo;
  final String? currentUserId;

  @override
  Widget build(BuildContext context) {
    final initial = team.name.isNotEmpty ? team.name[0].toUpperCase() : 'T';
    final hasUnread = unreadInfo != null && unreadInfo!.count > 0;
    final preview = unreadInfo?.lastMessagePreview(currentUserId);
    final lastTime = unreadInfo?.lastMessageTime;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: _sportColor(team.sport),
        child: Text(
          initial,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              team.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: hasUnread ? FontWeight.bold : FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (lastTime != null)
            Text(
              _formatTime(lastTime),
              style: TextStyle(
                color: hasUnread ? const Color(0xFF25D366) : Colors.grey[500],
                fontSize: 12,
                fontWeight: hasUnread ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                preview ?? '${team.sport} \u2022 ${team.memberCount} member${team.memberCount == 1 ? '' : 's'}',
                style: TextStyle(
                  color: hasUnread ? Colors.grey[300] : Colors.grey[500],
                  fontSize: 13,
                  fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (hasUnread) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF25D366),
                  borderRadius: BorderRadius.circular(12),
                ),
                constraints: const BoxConstraints(minWidth: 22),
                child: Text(
                  unreadInfo!.count > 99 ? '99+' : '${unreadInfo!.count}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return DateFormat('EEE').format(time);
    return DateFormat('MM/dd').format(time);
  }

  Color _sportColor(String sport) {
    final lower = sport.toLowerCase();
    if (lower.contains('basket')) return Colors.orange[700]!;
    if (lower.contains('soccer') || lower.contains('football')) {
      return Colors.green[700]!;
    }
    if (lower.contains('base')) return Colors.red[700]!;
    if (lower.contains('tennis')) return Colors.lime[700]!;
    if (lower.contains('swim')) return Colors.blue[700]!;
    if (lower.contains('hockey')) return Colors.indigo[700]!;
    return Colors.blueGrey[700]!;
  }
}
