import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../features/stats/data/stats_service.dart';
import '../../../../features/stats/domain/models/game_stat.dart';
import '../../../../features/team/domain/models/team.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Play Type Definitions (sport-agnostic, basketball defaults)
// ─────────────────────────────────────────────────────────────────────────────

class PlayTypeOption {
  final String type;
  final String label;
  final int defaultPoints;
  final IconData icon;
  final Color color;

  const PlayTypeOption({
    required this.type,
    required this.label,
    required this.defaultPoints,
    required this.icon,
    required this.color,
  });
}

const _basketballPlays = [
  PlayTypeOption(
    type: '2PT_FG',
    label: '2-Point',
    defaultPoints: 2,
    icon: Icons.sports_basketball,
    color: Color(0xFF2ECC71),
  ),
  PlayTypeOption(
    type: '3PT_FG',
    label: '3-Point',
    defaultPoints: 3,
    icon: Icons.whatshot_rounded,
    color: Color(0xFFE74C3C),
  ),
  PlayTypeOption(
    type: 'FREE_THROW',
    label: 'Free Throw',
    defaultPoints: 1,
    icon: Icons.sports_rounded,
    color: Color(0xFF3498DB),
  ),
  PlayTypeOption(
    type: 'REBOUND',
    label: 'Rebound',
    defaultPoints: 0,
    icon: Icons.replay_rounded,
    color: Color(0xFFF39C12),
  ),
  PlayTypeOption(
    type: 'STEAL',
    label: 'Steal',
    defaultPoints: 0,
    icon: Icons.flash_on_rounded,
    color: Color(0xFF9B59B6),
  ),
  PlayTypeOption(
    type: 'TURNOVER',
    label: 'Turnover',
    defaultPoints: 0,
    icon: Icons.swap_horiz_rounded,
    color: Color(0xFFE67E22),
  ),
  PlayTypeOption(
    type: 'BLOCK',
    label: 'Block',
    defaultPoints: 0,
    icon: Icons.block_rounded,
    color: Color(0xFF1ABC9C),
  ),
  PlayTypeOption(
    type: 'FOUL',
    label: 'Foul',
    defaultPoints: 0,
    icon: Icons.warning_rounded,
    color: Color(0xFFE74C3C),
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Live Game Page
// ─────────────────────────────────────────────────────────────────────────────

class LiveGamePage extends StatefulWidget {
  const LiveGamePage({
    super.key,
    required this.eventId,
    required this.teamId,
    required this.teamName,
    this.opponentName,
    this.members = const [],
  });

  final String eventId;
  final String teamId;
  final String teamName;
  final String? opponentName;
  final List<TeamMember> members;

  @override
  State<LiveGamePage> createState() => _LiveGamePageState();
}

class _LiveGamePageState extends State<LiveGamePage>
    with SingleTickerProviderStateMixin {
  final _statsService = StatsService();
  late final TabController _tabController;

  GameStat? _gameStat;
  bool _loading = true;
  String? _error;
  bool _submitting = false;

  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadOrCreateGame();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _tabController.dispose();
    super.dispose();
  }

  // ── Data Loading ──────────────────────────────────────────────────

  Future<void> _loadOrCreateGame() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      // Try to fetch existing game stats
      final gameStat =
          await _statsService.getGameStats(eventId: widget.eventId);
      setState(() {
        _gameStat = gameStat;
        _loading = false;
      });
      _startPolling();
    } catch (e) {
      // If not found, create a new game stats record
      if (e.toString().contains('not found') ||
          e.toString().contains('Not Found')) {
        try {
          final gameStat = await _statsService.recordGameStats(
            eventId: widget.eventId,
            teamId: widget.teamId,
            opponentName: widget.opponentName,
          );
          setState(() {
            _gameStat = gameStat;
            _loading = false;
          });
          _startPolling();
        } catch (createError) {
          setState(() {
            _error = createError.toString();
            _loading = false;
          });
        }
      } else {
        setState(() {
          _error = e.toString();
          _loading = false;
        });
      }
    }
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _refreshStats();
    });
  }

  Future<void> _refreshStats() async {
    try {
      final gameStat =
          await _statsService.getGameStats(eventId: widget.eventId);
      if (mounted) {
        setState(() => _gameStat = gameStat);
      }
    } catch (_) {
      // Silently fail on poll refresh
    }
  }

  // ── Actions ───────────────────────────────────────────────────────

  Future<void> _recordPlay(
    PlayTypeOption play, {
    String? playResult,
    bool forTeam = true,
    String? playerId,
  }) async {
    if (_gameStat == null || _submitting) return;

    setState(() => _submitting = true);
    try {
      await _statsService.recordPlay(
        gameStatsId: _gameStat!.id,
        playType: play.type,
        playResult: playResult,
        pointsScored: play.defaultPoints,
        forTeam: forTeam,
        playerId: playerId,
        period: _gameStat!.currentPeriod,
      );
      await _refreshStats();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red.shade800,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _undoLastPlay() async {
    if (_gameStat == null || _submitting) return;

    setState(() => _submitting = true);
    try {
      final deleted =
          await _statsService.undoLastPlay(gameStatsId: _gameStat!.id);
      if (deleted == null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No plays to undo')),
        );
      }
      await _refreshStats();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red.shade800,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _updateGameStatus(GameStatus status, {int? period}) async {
    if (_gameStat == null || _submitting) return;

    setState(() => _submitting = true);
    try {
      final updated = await _statsService.updateGameStatus(
        gameStatsId: _gameStat!.id,
        status: status,
        currentPeriod: period,
      );
      setState(() => _gameStat = updated);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red.shade800,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _showEndGameDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'End Game',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Mark this game as FINAL? This will lock the score and prevent further play recording.',
          style: GoogleFonts.inter(color: Colors.grey.shade400),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel',
                style: GoogleFonts.inter(color: Colors.grey.shade500)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child:
                Text('End Game', style: GoogleFonts.inter(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _updateGameStatus(GameStatus.isFinal);
    }
  }

  Future<void> _showNextPeriodDialog() async {
    if (_gameStat == null) return;

    final nextPeriod = _gameStat!.currentPeriod + 1;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Next Period',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Advance to Period $nextPeriod?',
          style: GoogleFonts.inter(color: Colors.grey.shade400),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel',
                style: GoogleFonts.inter(color: Colors.grey.shade500)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3498DB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Text('Period $nextPeriod',
                style: GoogleFonts.inter(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _updateGameStatus(GameStatus.inProgress, period: nextPeriod);
    }
  }

  void _showRecordPlaySheet(PlayTypeOption play) {
    final players = widget.members
        .where((m) => m.roles.contains(MemberRole.player))
        .toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _RecordPlaySheet(
        play: play,
        players: players,
        onRecordForTeam: (playerId) {
          Navigator.pop(context);
          _recordPlay(play, forTeam: true, playerId: playerId, playResult: 'MADE');
        },
        onRecordForOpponent: () {
          Navigator.pop(context);
          _recordPlay(play, forTeam: false, playResult: 'MADE');
        },
        onRecordMissed: (playerId) {
          Navigator.pop(context);
          _recordPlay(
            PlayTypeOption(
              type: play.type,
              label: play.label,
              defaultPoints: 0,
              icon: play.icon,
              color: play.color,
            ),
            forTeam: true,
            playerId: playerId,
            playResult: 'MISSED',
          );
        },
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          _gameStat?.isLive == true ? '🏀 LIVE' : 'Game Stats',
          style: GoogleFonts.inter(
            color: _gameStat?.isLive == true
                ? const Color(0xFF2ECC71)
                : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_gameStat != null && !_gameStat!.isFinal)
            IconButton(
              icon:
                  Icon(Icons.undo_rounded, color: Colors.grey.shade400, size: 22),
              onPressed: _submitting ? null : _undoLastPlay,
              tooltip: 'Undo last play',
            ),
          if (_gameStat != null && !_gameStat!.isFinal)
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.grey.shade400),
              color: const Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onSelected: (value) {
                switch (value) {
                  case 'next_period':
                    _showNextPeriodDialog();
                    break;
                  case 'end_game':
                    _showEndGameDialog();
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'next_period',
                  child: Row(
                    children: [
                      Icon(Icons.skip_next_rounded,
                          color: Colors.grey.shade400, size: 18),
                      const SizedBox(width: 8),
                      Text('Next Period',
                          style: GoogleFonts.inter(color: Colors.white)),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'end_game',
                  child: Row(
                    children: [
                      const Icon(Icons.flag_rounded,
                          color: Color(0xFFE74C3C), size: 18),
                      const SizedBox(width: 8),
                      Text('End Game',
                          style: GoogleFonts.inter(
                              color: const Color(0xFFE74C3C))),
                    ],
                  ),
                ),
              ],
            ),
        ],
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
            Text(
              _error!,
              style: GoogleFonts.inter(color: Colors.grey.shade400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadOrCreateGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
              ),
              child: Text('Retry', style: GoogleFonts.inter(color: Colors.white)),
            ),
          ],
        ),
      );
    }

    if (_gameStat == null) return const SizedBox.shrink();

    return Column(
      children: [
        // ── Scoreboard ──
        _buildScoreboard(),

        // ── Status Bar ──
        _buildStatusBar(),

        // ── Tabs ──
        TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF2ECC71),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade600,
          labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
          tabs: const [
            Tab(text: 'SCORE'),
            Tab(text: 'PLAYS'),
          ],
        ),

        // ── Tab Content ──
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildScoreTab(),
              _buildPlaysTab(),
            ],
          ),
        ),
      ],
    );
  }

  // ── Scoreboard ────────────────────────────────────────────────────

  Widget _buildScoreboard() {
    final gs = _gameStat!;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gs.isLive
              ? [const Color(0xFF0A2A1A), const Color(0xFF0A1A0A)]
              : [const Color(0xFF1A1A1A), const Color(0xFF111111)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: gs.isLive
              ? const Color(0xFF2ECC71).withOpacity(0.3)
              : const Color(0xFF2A2A2A),
        ),
      ),
      child: Row(
        children: [
          // Home team
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.teamName,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '${gs.homeScore}',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 48,
                  ),
                ),
                Text(
                  'HOME',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Divider + Period
          Column(
            children: [
              if (gs.isLive)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2ECC71).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'LIVE',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF2ECC71),
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                )
              else if (gs.isFinal)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'FINAL',
                    style: GoogleFonts.inter(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                'vs',
                style: GoogleFonts.inter(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'P${gs.currentPeriod}',
                style: GoogleFonts.inter(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          // Away team
          Expanded(
            child: Column(
              children: [
                Text(
                  gs.opponentName ?? 'Opponent',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '${gs.awayScore}',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w800,
                    fontSize: 48,
                  ),
                ),
                Text(
                  'AWAY',
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Status Bar ────────────────────────────────────────────────────

  Widget _buildStatusBar() {
    final gs = _gameStat!;

    if (gs.isNotStarted) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _submitting
                ? null
                : () => _updateGameStatus(GameStatus.inProgress),
            icon: const Icon(Icons.play_arrow_rounded, size: 20),
            label: Text('Start Game',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600, fontSize: 14)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2ECC71),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ),
      );
    }

    if (gs.isFinal) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flag_rounded, color: Colors.grey.shade500, size: 16),
            const SizedBox(width: 8),
            Text(
              'Game Over · ${gs.resultLabel}',
              style: GoogleFonts.inter(
                color: gs.isWinning
                    ? const Color(0xFF2ECC71)
                    : gs.isLosing
                        ? const Color(0xFFE74C3C)
                        : Colors.grey.shade400,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  // ── Score Tab ─────────────────────────────────────────────────────

  Widget _buildScoreTab() {
    final gs = _gameStat!;

    if (gs.isFinal) {
      return _buildPlayerStatsList();
    }

    if (gs.isNotStarted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_basketball_rounded,
                color: Colors.grey.shade700, size: 64),
            const SizedBox(height: 16),
            Text(
              'Game hasn\'t started yet',
              style: GoogleFonts.inter(
                color: Colors.grey.shade500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap "Start Game" to begin recording plays',
              style: GoogleFonts.inter(
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    // Live scoring buttons
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick score buttons
          Text(
            'QUICK ACTIONS',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),

          // Scoring plays grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: _basketballPlays.map((play) {
              return _PlayButton(
                play: play,
                enabled: !_submitting && gs.isLive,
                onTap: () => _showRecordPlaySheet(play),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Opponent score button
          Text(
            'OPPONENT',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _OpponentScoreButton(
                label: '+1',
                points: 1,
                enabled: !_submitting && gs.isLive,
                onTap: () => _recordPlay(
                  const PlayTypeOption(
                    type: 'FREE_THROW',
                    label: 'FT',
                    defaultPoints: 1,
                    icon: Icons.sports,
                    color: Color(0xFF95A5A6),
                  ),
                  forTeam: false,
                  playResult: 'MADE',
                ),
              ),
              const SizedBox(width: 10),
              _OpponentScoreButton(
                label: '+2',
                points: 2,
                enabled: !_submitting && gs.isLive,
                onTap: () => _recordPlay(
                  const PlayTypeOption(
                    type: '2PT_FG',
                    label: '2PT',
                    defaultPoints: 2,
                    icon: Icons.sports_basketball,
                    color: Color(0xFF95A5A6),
                  ),
                  forTeam: false,
                  playResult: 'MADE',
                ),
              ),
              const SizedBox(width: 10),
              _OpponentScoreButton(
                label: '+3',
                points: 3,
                enabled: !_submitting && gs.isLive,
                onTap: () => _recordPlay(
                  const PlayTypeOption(
                    type: '3PT_FG',
                    label: '3PT',
                    defaultPoints: 3,
                    icon: Icons.whatshot,
                    color: Color(0xFF95A5A6),
                  ),
                  forTeam: false,
                  playResult: 'MADE',
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Player stats summary
          if (gs.playerStats.isNotEmpty) ...[
            Text(
              'PLAYER STATS',
              style: GoogleFonts.inter(
                color: Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            _buildPlayerStatsList(),
          ],
        ],
      ),
    );
  }

  // ── Plays Tab ─────────────────────────────────────────────────────

  Widget _buildPlaysTab() {
    final plays = _gameStat?.plays ?? [];

    if (plays.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history_rounded,
                color: Colors.grey.shade700, size: 48),
            const SizedBox(height: 16),
            Text(
              'No plays recorded yet',
              style: GoogleFonts.inter(
                color: Colors.grey.shade500,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: plays.length,
      itemBuilder: (context, index) {
        // Show in reverse chronological order
        final play = plays[plays.length - 1 - index];
        return _PlayTile(
          play: play,
          members: widget.members,
        );
      },
    );
  }

  // ── Player Stats List ─────────────────────────────────────────────

  Widget _buildPlayerStatsList() {
    final stats = _gameStat?.playerStats ?? [];

    if (stats.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'No player stats yet',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        final member = widget.members
            .where((m) => m.userId == stat.userId)
            .firstOrNull;
        final name = member != null
            ? '${member.firstName ?? ''} ${member.lastName ?? ''}'.trim()
            : 'Player';

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1E1E1E)),
          ),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF2ECC71).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF2ECC71),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Name
              Expanded(
                child: Text(
                  name.isEmpty ? 'Unknown' : name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),

              // Points
              _StatChip(
                  label: 'PTS', value: stat.totalPoints.toString()),
              const SizedBox(width: 6),
              _StatChip(
                  label: 'AST', value: stat.totalAssists.toString()),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Extracted Widgets
// ─────────────────────────────────────────────────────────────────────────────

class _PlayButton extends StatelessWidget {
  const _PlayButton({
    required this.play,
    required this.enabled,
    required this.onTap,
  });

  final PlayTypeOption play;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: enabled
              ? play.color.withOpacity(0.08)
              : const Color(0xFF0A0A0A),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: enabled
                ? play.color.withOpacity(0.2)
                : const Color(0xFF1A1A1A),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(play.icon,
                color:
                    enabled ? play.color : Colors.grey.shade800,
                size: 22),
            const SizedBox(height: 4),
            Text(
              play.label,
              style: GoogleFonts.inter(
                color: enabled ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            if (play.defaultPoints > 0)
              Text(
                '+${play.defaultPoints}',
                style: GoogleFonts.inter(
                  color: enabled ? play.color : Colors.grey.shade800,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _OpponentScoreButton extends StatelessWidget {
  const _OpponentScoreButton({
    required this.label,
    required this.points,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final int points;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: enabled
                ? const Color(0xFFE74C3C).withOpacity(0.06)
                : const Color(0xFF0A0A0A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: enabled
                  ? const Color(0xFFE74C3C).withOpacity(0.15)
                  : const Color(0xFF1A1A1A),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: enabled
                    ? const Color(0xFFE74C3C)
                    : Colors.grey.shade800,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayTile extends StatelessWidget {
  const _PlayTile({required this.play, required this.members});

  final GamePlay play;
  final List<TeamMember> members;

  @override
  Widget build(BuildContext context) {
    final member = play.playerId != null
        ? members.where((m) => m.userId == play.playerId).firstOrNull
        : null;
    final playerName = member != null
        ? '${member.firstName ?? ''} ${member.lastName ?? ''}'.trim()
        : (play.forTeam ? 'Team' : 'Opponent');

    final time = DateFormat('h:mm a').format(play.createdAt.toLocal());

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E1E1E)),
      ),
      child: Row(
        children: [
          // Points badge
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: play.forTeam
                  ? const Color(0xFF2ECC71).withOpacity(0.1)
                  : const Color(0xFFE74C3C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                play.pointsScored > 0
                    ? '+${play.pointsScored}'
                    : play.shortLabel,
                style: GoogleFonts.inter(
                  color: play.forTeam
                      ? const Color(0xFF2ECC71)
                      : const Color(0xFFE74C3C),
                  fontWeight: FontWeight.w700,
                  fontSize: play.pointsScored > 0 ? 14 : 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerName.isEmpty ? 'Unknown' : playerName,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  play.displayText,
                  style: GoogleFonts.inter(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          // Time + Period
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: GoogleFonts.inter(
                  color: Colors.grey.shade600,
                  fontSize: 11,
                ),
              ),
              Text(
                'P${play.period}',
                style: GoogleFonts.inter(
                  color: Colors.grey.shade700,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Record Play Bottom Sheet
// ─────────────────────────────────────────────────────────────────────────────

class _RecordPlaySheet extends StatelessWidget {
  const _RecordPlaySheet({
    required this.play,
    required this.players,
    required this.onRecordForTeam,
    required this.onRecordForOpponent,
    required this.onRecordMissed,
  });

  final PlayTypeOption play;
  final List<TeamMember> players;
  final void Function(String? playerId) onRecordForTeam;
  final VoidCallback onRecordForOpponent;
  final void Function(String? playerId) onRecordMissed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Row(
            children: [
              Icon(play.icon, color: play.color, size: 24),
              const SizedBox(width: 10),
              Text(
                play.label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              if (play.defaultPoints > 0) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: play.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '+${play.defaultPoints} pts',
                    style: GoogleFonts.inter(
                      color: play.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 20),

          // No player / quick record
          if (players.isEmpty) ...[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => onRecordForTeam(null),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2ECC71),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text('Made',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                ),
                if (play.defaultPoints > 0) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => onRecordMissed(null),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE74C3C).withOpacity(0.15),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Missed',
                          style: GoogleFonts.inter(
                              color: const Color(0xFFE74C3C),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ],
            ),
          ] else ...[
            // Player selection
            Text(
              'SELECT PLAYER',
              style: GoogleFonts.inter(
                color: Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            ...players.map((player) {
              final name =
                  '${player.firstName ?? ''} ${player.lastName ?? ''}'.trim();
              return Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onRecordForTeam(player.userId),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A1A0A),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  const Color(0xFF2ECC71).withOpacity(0.15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2ECC71)
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    name.isNotEmpty
                                        ? name[0].toUpperCase()
                                        : '?',
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF2ECC71),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  name.isEmpty ? 'Unknown' : name,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(Icons.check_circle_outline,
                                  color: const Color(0xFF2ECC71)
                                      .withOpacity(0.3),
                                  size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (play.defaultPoints > 0) ...[
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => onRecordMissed(player.userId),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE74C3C).withOpacity(0.06),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  const Color(0xFFE74C3C).withOpacity(0.12),
                            ),
                          ),
                          child: Text(
                            'MISS',
                            style: GoogleFonts.inter(
                              color: const Color(0xFFE74C3C),
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
          ],

          SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
        ],
      ),
    );
  }
}
