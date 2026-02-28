import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../team/data/team_service.dart';
import '../../../team/domain/models/team.dart';
import '../../../chat/data/chat_service.dart';
import '../../../chat/presentation/pages/team_chat_page.dart';
import '../../../../core/services/auth_service.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Text(
            'Messages',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Team conversations',
            style: GoogleFonts.inter(
              color: Colors.grey.shade500,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // ── Content ──
        Expanded(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.wifi_off_rounded, size: 40, color: Colors.red.shade300),
              ),
              const SizedBox(height: 16),
              Text(
                'Couldn\'t load chats',
                style: GoogleFonts.inter(color: Colors.grey.shade300, fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                'Check your connection and try again',
                style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _loadTeams,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF3A3A3A)),
                  ),
                  child: Text('Retry', style: GoogleFonts.inter(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                ),
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
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: Icon(Icons.chat_bubble_outline_rounded, size: 48, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            Text(
              'No conversations yet',
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 8),
            Text(
              'Join or create a team to start chatting',
              style: GoogleFonts.inter(fontSize: 13, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadTeams,
      color: Colors.white,
      backgroundColor: const Color(0xFF2A2A2A),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: _teams.length,
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
    final sportColor = _sportColor(team.sport);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: hasUnread ? const Color(0xFF1A1A1A) : const Color(0xFF111111),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: hasUnread ? sportColor.withOpacity(0.3) : const Color(0xFF222222),
              width: hasUnread ? 1.2 : 0.8,
            ),
          ),
          child: Row(
            children: [
              // ── Avatar ──
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [sportColor, sportColor.withOpacity(0.6)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: sportColor.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),

              // ── Content ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Team name + time
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            team.name,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (lastTime != null)
                          Text(
                            _formatTime(lastTime),
                            style: GoogleFonts.inter(
                              color: hasUnread ? sportColor : Colors.grey.shade600,
                              fontSize: 11,
                              fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // Preview + badge
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            preview ?? '${team.sport} · ${team.memberCount} member${team.memberCount == 1 ? '' : 's'}',
                            style: GoogleFonts.inter(
                              color: hasUnread ? Colors.grey.shade300 : Colors.grey.shade600,
                              fontSize: 13,
                              fontWeight: hasUnread ? FontWeight.w500 : FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (hasUnread) ...[
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: sportColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(minWidth: 24),
                            child: Text(
                              unreadInfo!.count > 99 ? '99+' : '${unreadInfo!.count}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // ── Chevron ──
              const SizedBox(width: 8),
              Icon(Icons.chevron_right_rounded, color: Colors.grey.shade700, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inMinutes < 1) return 'now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return DateFormat('EEE').format(time);
    return DateFormat('MM/dd').format(time);
  }

  Color _sportColor(String sport) {
    final lower = sport.toLowerCase();
    if (lower.contains('basket')) return const Color(0xFFE8732A);
    if (lower.contains('soccer') || lower.contains('football')) return const Color(0xFF2ECC71);
    if (lower.contains('base')) return const Color(0xFFE74C3C);
    if (lower.contains('tennis')) return const Color(0xFFCDDC39);
    if (lower.contains('swim')) return const Color(0xFF3498DB);
    if (lower.contains('hockey')) return const Color(0xFF5C6BC0);
    if (lower.contains('cricket')) return const Color(0xFF26A69A);
    if (lower.contains('volley')) return const Color(0xFFFF7043);
    return const Color(0xFF607D8B);
  }
}
