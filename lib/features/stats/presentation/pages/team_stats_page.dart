import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../features/stats/data/stats_service.dart';
import '../../../../features/stats/domain/models/game_stat.dart';
import '../../../../features/stats/presentation/pages/live_game_page.dart';
import '../../../../features/team/domain/models/team.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Team Stats Page — shows all game history for a team
// ─────────────────────────────────────────────────────────────────────────────

class TeamStatsPage extends StatefulWidget {
  const TeamStatsPage({
    super.key,
    required this.teamId,
    required this.teamName,
    this.members = const [],
  });

  final String teamId;
  final String teamName;
  final List<TeamMember> members;

  @override
  State<TeamStatsPage> createState() => _TeamStatsPageState();
}

class _TeamStatsPageState extends State<TeamStatsPage> {
  final _statsService = StatsService();

  List<GameStat> _games = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final games = await _statsService.getTeamStats(teamId: widget.teamId);
      // Sort by newest first
      games.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      setState(() {
        _games = games;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Team Stats',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF2ECC71)),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red.shade400, size: 48),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _error!,
                style: GoogleFonts.inter(color: Colors.grey.shade400),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadStats,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
              ),
              child: Text('Retry',
                  style: GoogleFonts.inter(color: Colors.white)),
            ),
          ],
        ),
      );
    }

    if (_games.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart_rounded,
                color: Colors.grey.shade700, size: 64),
            const SizedBox(height: 16),
            Text(
              'No games recorded yet',
              style: GoogleFonts.inter(
                color: Colors.grey.shade500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Stats will appear here after game events are played',
              style: GoogleFonts.inter(
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // ── Stats Summary Header ──
    final finalGames = _games.where((g) => g.isFinal).toList();
    final wins = finalGames.where((g) => g.isWinning).length;
    final losses = finalGames.where((g) => g.isLosing).length;
    final ties = finalGames.where((g) => g.isTied).length;

    return RefreshIndicator(
      onRefresh: _loadStats,
      color: const Color(0xFF2ECC71),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Record summary
          _buildRecordCard(wins, losses, ties, finalGames.length),
          const SizedBox(height: 20),

          // Game list
          Text(
            'GAME HISTORY',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),

          ..._games.map((game) => _buildGameCard(game)),
        ],
      ),
    );
  }

  Widget _buildRecordCard(int wins, int losses, int ties, int total) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A1A1A), Color(0xFF111111)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        children: [
          Text(
            widget.teamName,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _RecordItem(
                  label: 'W', value: '$wins', color: const Color(0xFF2ECC71)),
              Container(
                  width: 1, height: 30, color: const Color(0xFF2A2A2A)),
              _RecordItem(
                  label: 'L',
                  value: '$losses',
                  color: const Color(0xFFE74C3C)),
              Container(
                  width: 1, height: 30, color: const Color(0xFF2A2A2A)),
              _RecordItem(
                  label: 'T', value: '$ties', color: const Color(0xFFF39C12)),
              Container(
                  width: 1, height: 30, color: const Color(0xFF2A2A2A)),
              _RecordItem(
                  label: 'GP',
                  value: '$total',
                  color: Colors.grey.shade400),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(GameStat game) {
    final date = DateFormat('MMM d, yyyy').format(game.createdAt.toLocal());

    Color statusColor;
    String statusText;
    if (game.isLive) {
      statusColor = const Color(0xFF2ECC71);
      statusText = 'LIVE';
    } else if (game.isFinal) {
      statusColor = game.isWinning
          ? const Color(0xFF2ECC71)
          : game.isLosing
              ? const Color(0xFFE74C3C)
              : const Color(0xFFF39C12);
      statusText = game.resultLabel;
    } else {
      statusColor = Colors.grey.shade600;
      statusText = 'UPCOMING';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LiveGamePage(
              eventId: game.eventId,
              teamId: game.teamId,
              teamName: widget.teamName,
              opponentName: game.opponentName,
              members: widget.members,
            ),
          ),
        ).then((_) => _loadStats());
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: game.isLive
                ? const Color(0xFF2ECC71).withOpacity(0.3)
                : const Color(0xFF1E1E1E),
          ),
        ),
        child: Row(
          children: [
            // Status badge
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                statusText,
                style: GoogleFonts.inter(
                  color: statusColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Team vs Opponent
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'vs ${game.opponentName ?? 'Opponent'}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            // Score
            Text(
              game.scoreDisplay,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right_rounded,
                color: Colors.grey.shade700, size: 18),
          ],
        ),
      ),
    );
  }
}

class _RecordItem extends StatelessWidget {
  const _RecordItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            color: color,
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.grey.shade600,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
