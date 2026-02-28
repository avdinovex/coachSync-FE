import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/services/auth_service.dart';
import '../../../../features/schedule/data/event_service.dart';
import '../../../../features/schedule/domain/models/event.dart';
import '../../../../features/team/data/team_service.dart';
import '../../../../features/team/domain/models/team.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers
// ─────────────────────────────────────────────────────────────────────────────

Color _typeColor(EventType t) {
  switch (t) {
    case EventType.game:
      return const Color(0xFF2ECC71);
    case EventType.practice:
      return const Color(0xFF3498DB);
    case EventType.meeting:
      return const Color(0xFFF39C12);
  }
}

IconData _typeIcon(EventType t) {
  switch (t) {
    case EventType.game:
      return Icons.emoji_events_rounded;
    case EventType.practice:
      return Icons.fitness_center_rounded;
    case EventType.meeting:
      return Icons.groups_rounded;
  }
}

String _formatDate(DateTime dt) =>
    DateFormat('EEE, MMM d · h:mm a').format(dt.toLocal());

String _formatShortDate(DateTime dt) =>
    DateFormat('MMM d').format(dt.toLocal());

String _formatTime(DateTime dt) => DateFormat('h:mm a').format(dt.toLocal());

// ─────────────────────────────────────────────────────────────────────────────
// EventsPage
// ─────────────────────────────────────────────────────────────────────────────

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage>
    with SingleTickerProviderStateMixin {
  final _eventService = EventService();
  final _teamService = TeamService();

  late final TabController _tabController;

  List<Team> _teams = [];
  String? _selectedTeamId;
  bool _teamsLoading = true;

  List<Event> _events = [];
  bool _eventsLoading = false;
  String? _error;

  /// Current user's ID for permission checks.
  String? _currentUserId;

  /// Current user's roles in the selected team.
  List<MemberRole> _myTeamRoles = [];

  /// All members of the selected team (for full attendance view).
  List<TeamMember> _teamMembers = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    _currentUserId = AuthService.currentUser?.id;
    print('🔵 [EventsPage] currentUserId from AuthService: $_currentUserId');
    if (_currentUserId == null) {
      _resolveUserIdFromToken();
    }
    _loadTeams();
  }

  /// Fallback: decode the user ID from the stored JWT token.
  Future<void> _resolveUserIdFromToken() async {
    try {
      final token = await AuthService.getStoredToken();
      if (token != null) {
        final parts = token.split('.');
        if (parts.length == 3) {
          final payload = utf8.decode(
            base64Url.decode(base64Url.normalize(parts[1])),
          );
          final map = jsonDecode(payload) as Map<String, dynamic>;
          final sub = map['sub'] as String?;
          print('🔵 [EventsPage] resolved userId from JWT: $sub');
          if (sub != null && mounted) {
            setState(() => _currentUserId = sub);
          }
        }
      }
    } catch (e) {
      print('🔴 [EventsPage] failed to decode JWT: $e');
    }
  }

  @override
  void dispose() {
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) _loadEvents();
  }

  // ── Data loading ──────────────────────────────────────────────────────────

  Future<void> _loadTeams() async {
    setState(() => _teamsLoading = true);
    try {
      final teams = await _teamService.fetchMyTeams();
      setState(() {
        _teams = teams;
        _teamsLoading = false;
        if (teams.isNotEmpty) {
          _selectedTeamId = teams.first.id;
        }
      });
      await _loadTeamMembers();
      await _loadEvents();
    } catch (e) {
      setState(() {
        _teamsLoading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _loadEvents() async {
    if (_selectedTeamId == null) return;
    setState(() {
      _eventsLoading = true;
      _error = null;
    });
    try {
      final List<Event> events;
      if (_tabController.index == 0) {
        events = await _eventService.getUpcomingEvents(
            teamId: _selectedTeamId);
      } else {
        events = await _eventService.getEvents(teamId: _selectedTeamId);
      }
      setState(() {
        _events = events;
        _eventsLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _eventsLoading = false;
      });
    }
  }

  // ── Create event ─────────────────────────────────────────────────────────

  /// Whether the current user is a leader or coach in the selected team.
  bool get _isLeaderOrCoach =>
      _myTeamRoles.contains(MemberRole.leader) ||
      _myTeamRoles.contains(MemberRole.coach);

  /// Load members of the selected team and resolve current user's roles.
  Future<void> _loadTeamMembers() async {
    if (_selectedTeamId == null) return;
    try {
      final members = await _teamService.getTeamMembers(_selectedTeamId!);
      final me = members.where((m) => m.userId == _currentUserId).toList();
      setState(() {
        _teamMembers = members;
        _myTeamRoles = me.isNotEmpty ? me.first.roles : [];
      });
    } catch (_) {
      // Silently fail; permissions will default to non-privileged.
    }
  }

  Future<void> _showCreateEventSheet() async {
    if (_selectedTeamId == null) {
      _showSnack('Select a team first', isError: true);
      return;
    }
    final created = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _CreateEventSheet(
        teamId: _selectedTeamId!,
        eventService: _eventService,
      ),
    );
    if (created == true) {
      _showSnack('Event created');
      _loadEvents();
    }
  }

  // ── Delete event ─────────────────────────────────────────────────────────

  Future<void> _deleteEvent(Event event) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF151515),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('Delete Event',
            style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
        content: Text(
          'Delete "${event.title}"? This cannot be undone.',
          style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 14),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel',
                  style: GoogleFonts.inter(color: Colors.grey.shade500))),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete',
                  style: GoogleFonts.inter(color: const Color(0xFFE74C3C), fontWeight: FontWeight.w600))),
        ],
      ),
    );
    if (confirm != true) return;
    try {
      await _eventService.deleteEvent(event.id);
      if (mounted) {
        Navigator.of(context).pop(); // close detail sheet
        _showSnack('Event deleted');
        _loadEvents();
      }
    } catch (e) {
      _showSnack(e.toString(), isError: true);
    }
  }

  // ── Open event by ID (called from chat event cards) ────────────────────

  /// Fetches an event by ID and opens its detail sheet.
  Future<void> openEventById(String eventId) async {
    try {
      final event = await _eventService.getEventById(eventId);
      if (mounted) {
        _openEventDetail(event);
      }
    } catch (e) {
      if (mounted) {
        _showSnack('Could not load event: $e', isError: true);
      }
    }
  }

  // ── Event detail ──────────────────────────────────────────────────────────

  void _openEventDetail(Event event) {
    final isCreator = event.createdBy == _currentUserId;
    final canDelete = isCreator || _isLeaderOrCoach;
    final canEdit = _isLeaderOrCoach;
    // Creator, leader, and coach see full member list for the event
    final showFullAttendance = isCreator || _isLeaderOrCoach;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EventDetailSheet(
        event: event,
        eventService: _eventService,
        onDelete: canDelete ? () => _deleteEvent(event) : null,
        onRsvpChanged: _loadEvents,
        canEdit: canEdit,
        showFullAttendance: showFullAttendance,
        teamMembers: _teamMembers,
        currentUserId: _currentUserId,
      ),
    );
  }

  // ── Snack ─────────────────────────────────────────────────────────────────

  void _showSnack(String msg, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: isError ? Colors.redAccent : Colors.green,
    ));
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Text(
                  'Events',
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                if (_selectedTeamId != null)
                  GestureDetector(
                    onTap: _showCreateEventSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.add_rounded, color: Colors.white, size: 18),
                          const SizedBox(width: 6),
                          Text('New', style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Manage your schedule',
              style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),

          // ── Team selector ────────────────────────────────────────────────
          if (_teamsLoading)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(children: [
                const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white54)),
                const SizedBox(width: 10),
                Text('Loading teams…',
                    style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13)),
              ]),
            )
          else if (_teams.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('No teams found. Create or join a team first.',
                  style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 13)),
            )
          else
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: _teams.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final t = _teams[i];
                  final selected = t.id == _selectedTeamId;
                  return GestureDetector(
                    onTap: () {
                      if (!selected) {
                        setState(() => _selectedTeamId = t.id);
                        _loadTeamMembers();
                        _loadEvents();
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 9),
                      decoration: BoxDecoration(
                        color: selected ? Colors.white : const Color(0xFF151515),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? Colors.white : const Color(0xFF2A2A2A),
                        ),
                      ),
                      child: Text(
                        t.name,
                        style: GoogleFonts.inter(
                          color: selected ? Colors.black : Colors.grey.shade400,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 14),

          // ── Tabs ─────────────────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFF1E1E1E)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(11),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade600,
              labelStyle: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
              unselectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 13),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'All Events'),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // ── Event list ───────────────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildEventList(upcoming: true),
                _buildEventList(upcoming: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventList({required bool upcoming}) {
    if (_eventsLoading) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5));
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
                child: Icon(Icons.wifi_off_rounded, size: 36, color: Colors.red.shade300),
              ),
              const SizedBox(height: 16),
              Text('Couldn\'t load events',
                  style: GoogleFonts.inter(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _loadEvents,
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
    if (_selectedTeamId == null) {
      return Center(
        child: Text('Select a team to view events',
            style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 14)),
      );
    }
    if (_events.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111111),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF222222)),
              ),
              child: Icon(Icons.event_busy_rounded,
                  size: 44, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            Text(
              upcoming ? 'No upcoming events' : 'No events yet',
              style: GoogleFonts.inter(
                  color: Colors.grey.shade400,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap "+ New" to create one',
              style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _loadEvents,
      color: Colors.white,
      backgroundColor: const Color(0xFF2A2A2A),
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
        itemCount: _events.length,
        itemBuilder: (_, i) => _EventCard(
          event: _events[i],
          onTap: () => _openEventDetail(_events[i]),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _EventCard
// ─────────────────────────────────────────────────────────────────────────────

class _EventCard extends StatelessWidget {
  const _EventCard({required this.event, required this.onTap});
  final Event event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = _typeColor(event.eventType);
    final bool isToday = _isSameDay(event.startTime, DateTime.now());
    final local = event.startTime.toLocal();
    final dayNum = local.day.toString();
    final monthAbbr = DateFormat('MMM').format(local).toUpperCase();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isToday ? color.withOpacity(.35) : const Color(0xFF1E1E1E),
            width: isToday ? 1.2 : 0.8,
          ),
          boxShadow: isToday
              ? [BoxShadow(color: color.withOpacity(.08), blurRadius: 16, offset: const Offset(0, 4))]
              : [const BoxShadow(color: Color(0x18000000), blurRadius: 8, offset: Offset(0, 2))],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // ── Left accent strip ──
              Container(
                width: 4,
                margin: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 14),

              // ── Date block ──
              Container(
                width: 52,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      monthAbbr,
                      style: GoogleFonts.inter(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dayNum,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withOpacity(.12),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _formatTime(event.startTime),
                        style: GoogleFonts.inter(color: color.withOpacity(.9), fontSize: 9, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),

              // ── Vertical separator ──
              Container(width: 0.5, color: const Color(0xFF222222), margin: const EdgeInsets.symmetric(vertical: 14)),
              const SizedBox(width: 14),

              // ── Main content ──
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title + type badge
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              event.title,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withOpacity(.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: color.withOpacity(.15)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(_typeIcon(event.eventType), color: color, size: 10),
                                const SizedBox(width: 4),
                                Text(
                                  event.eventType.label,
                                  style: GoogleFonts.inter(color: color, fontSize: 10, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Info row: time + today badge + location
                      Row(
                        children: [
                          if (isToday) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [color.withOpacity(.25), color.withOpacity(.1)],
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text('TODAY',
                                  style: GoogleFonts.inter(
                                    color: color,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.8,
                                  )),
                            ),
                            const SizedBox(width: 8),
                          ],
                          if (event.location != null && event.location!.isNotEmpty) ...[
                            Icon(Icons.location_on_rounded, size: 11, color: Colors.grey.shade600),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                event.location!,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 12),
                              ),
                            ),
                          ] else
                            const Spacer(),
                        ],
                      ),

                      // RSVP summary
                      if (event.rsvps != null && event.rsvps!.isNotEmpty) ...[
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _RsvpPill(count: event.comingCount, label: 'Going', color: const Color(0xFF2ECC71)),
                            const SizedBox(width: 5),
                            _RsvpPill(count: event.notComingCount, label: 'No', color: const Color(0xFFE74C3C)),
                            const SizedBox(width: 5),
                            _RsvpPill(count: event.tbdCount, label: 'TBD', color: Colors.grey),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // ── Arrow ──
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.chevron_right_rounded, color: Colors.grey.shade600, size: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

class _RsvpPill extends StatelessWidget {
  const _RsvpPill(
      {required this.count, required this.label, required this.color});
  final int count;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(.15)),
      ),
      child: Text(
        '$count $label',
        style: GoogleFonts.inter(color: color, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _EventDetailSheet  (view + RSVP + delete)
// ─────────────────────────────────────────────────────────────────────────────

class _EventDetailSheet extends StatefulWidget {
  const _EventDetailSheet({
    required this.event,
    required this.eventService,
    required this.onDelete,
    required this.onRsvpChanged,
    this.canEdit = false,
    this.showFullAttendance = false,
    this.teamMembers = const [],
    this.currentUserId,
  });

  final Event event;
  final EventService eventService;
  /// Null when the current user is NOT allowed to delete.
  final VoidCallback? onDelete;
  final VoidCallback onRsvpChanged;
  final bool canEdit;
  final bool showFullAttendance;
  final List<TeamMember> teamMembers;
  final String? currentUserId;

  @override
  State<_EventDetailSheet> createState() => _EventDetailSheetState();
}

class _EventDetailSheetState extends State<_EventDetailSheet> {
  List<EventRsvp> _rsvps = [];
  bool _rsvpsLoading = true;
  RsvpStatus? _myRsvp;
  bool _rsvpLoading = false;

  @override
  void initState() {
    super.initState();
    _rsvps = widget.event.rsvps ?? [];
    _rsvpsLoading = _rsvps.isEmpty;
    _loadRsvps();
  }

  Future<void> _loadRsvps() async {
    try {
      final rsvps =
          await widget.eventService.getEventRsvps(widget.event.id);
      if (!mounted) return;
      // Auto-detect the current user's RSVP status
      final myRsvp = rsvps
          .where((r) => r.userId == widget.currentUserId)
          .toList();
      setState(() {
        _rsvps = rsvps;
        _rsvpsLoading = false;
        if (myRsvp.isNotEmpty) {
          _myRsvp = myRsvp.first.status;
        }
      });
    } catch (_) {
      if (mounted) setState(() => _rsvpsLoading = false);
    }
  }

  Future<void> _rsvp(RsvpStatus status) async {
    setState(() => _rsvpLoading = true);
    try {
      await widget.eventService
          .upsertRsvp(eventId: widget.event.id, status: status);
      if (!mounted) return;
      setState(() {
        _myRsvp = status;
        _rsvpLoading = false;
      });
      widget.onRsvpChanged();
      await _loadRsvps();
    } catch (e) {
      if (!mounted) return;
      setState(() => _rsvpLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  /// Build the full attendance list for privileged users.
  /// Shows every team member with their RSVP status.
  /// Members who have not RSVPed are shown as "No Response".
  List<Widget> _buildFullAttendanceList() {
    final rsvpMap = <String, EventRsvp>{};
    for (final r in _rsvps) {
      rsvpMap[r.userId] = r;
    }

    // Sort: RSVPed members first (coming > not_coming > tbd), then no-response
    final sorted = List<TeamMember>.from(widget.teamMembers);
    sorted.sort((a, b) {
      final rsvpA = rsvpMap[a.userId];
      final rsvpB = rsvpMap[b.userId];
      int priority(EventRsvp? r) {
        if (r == null) return 4;
        switch (r.status) {
          case RsvpStatus.coming:
            return 1;
          case RsvpStatus.not_coming:
            return 2;
          case RsvpStatus.tbd:
            return 3;
        }
      }
      return priority(rsvpA).compareTo(priority(rsvpB));
    });

    return sorted.map((member) {
      final rsvp = rsvpMap[member.userId];
      final isMe = member.userId == widget.currentUserId;
      return _FullAttendanceTile(
        name: member.displayName,
        rsvp: rsvp,
        isMe: isMe,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final color = _typeColor(event.eventType);
    final goingCount = _rsvps.where((r) => r.status == RsvpStatus.coming).length;
    final notGoingCount = _rsvps.where((r) => r.status == RsvpStatus.not_coming).length;
    final tbdCount = _rsvps.where((r) => r.status == RsvpStatus.tbd).length;
    final noResponseCount = widget.showFullAttendance && widget.teamMembers.isNotEmpty
        ? widget.teamMembers.where((m) => !_rsvps.any((r) => r.userId == m.userId)).length
        : 0;

    return DraggableScrollableSheet(
      initialChildSize: 0.78,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0D0D0D),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          border: const Border(top: BorderSide(color: Color(0xFF1E1E1E), width: 0.5)),
        ),
        child: Column(
          children: [
            // ── Drag handle ──
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A3A3A),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  // ══════════════════════════════════════════════════════════
                  // ── Hero Header Card ──
                  // ══════════════════════════════════════════════════════════
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color.withOpacity(.08),
                          const Color(0xFF111111),
                          const Color(0xFF111111),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withOpacity(.12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon block
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [color.withOpacity(.25), color.withOpacity(.08)],
                                ),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: color.withOpacity(.15)),
                              ),
                              child: Icon(_typeIcon(event.eventType), color: color, size: 26),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(event.title,
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      )),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: color.withOpacity(.12),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: color.withOpacity(.2)),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(_typeIcon(event.eventType), color: color, size: 12),
                                            const SizedBox(width: 5),
                                            Text(event.eventType.label,
                                                style: GoogleFonts.inter(
                                                    color: color, fontSize: 11, fontWeight: FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                      if (_isSameDay(event.startTime, DateTime.now())) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [color.withOpacity(.2), color.withOpacity(.08)],
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text('TODAY',
                                              style: GoogleFonts.inter(
                                                color: color,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 0.6,
                                              )),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Actions
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.onDelete != null) ...[
                                  GestureDetector(
                                    onTap: widget.onDelete,
                                    child: Container(
                                      width: 34,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE74C3C).withOpacity(.08),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: const Color(0xFFE74C3C).withOpacity(.15)),
                                      ),
                                      child: const Icon(Icons.delete_outline_rounded,
                                          color: Color(0xFFE74C3C), size: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1A1A),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: const Color(0xFF2A2A2A)),
                                    ),
                                    child: const Icon(Icons.close_rounded, color: Colors.white60, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ══════════════════════════════════════════════════════════
                  // ── Details Card ──
                  // ══════════════════════════════════════════════════════════
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFF1E1E1E)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.info_outline_rounded, color: Colors.grey.shade600, size: 15),
                            const SizedBox(width: 8),
                            Text('Details',
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                )),
                          ],
                        ),
                        const SizedBox(height: 14),
                        _InfoRow(
                          icon: Icons.schedule_rounded,
                          label: 'Start',
                          value: _formatDate(event.startTime),
                          accentColor: color,
                        ),
                        if (event.endTime != null)
                          _InfoRow(
                            icon: Icons.flag_rounded,
                            label: 'End',
                            value: _formatDate(event.endTime!),
                            accentColor: color,
                          ),
                        if (event.location != null && event.location!.isNotEmpty)
                          _InfoRow(
                            icon: Icons.location_on_rounded,
                            label: 'Location',
                            value: event.location!,
                            accentColor: color,
                          ),
                        if (event.description != null && event.description!.isNotEmpty)
                          _InfoRow(
                            icon: Icons.notes_rounded,
                            label: 'Notes',
                            value: event.description!,
                            accentColor: color,
                            isLast: true,
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ══════════════════════════════════════════════════════════
                  // ── RSVP Section ──
                  // ══════════════════════════════════════════════════════════
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFF1E1E1E)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.how_to_vote_rounded, color: Colors.grey.shade600, size: 15),
                            const SizedBox(width: 8),
                            Text('Your Response',
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                )),
                            const Spacer(),
                            if (_myRsvp != null)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: (_myRsvp == RsvpStatus.coming
                                          ? const Color(0xFF2ECC71)
                                          : _myRsvp == RsvpStatus.not_coming
                                              ? const Color(0xFFE74C3C)
                                              : const Color(0xFFF39C12))
                                      .withOpacity(.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  _myRsvp == RsvpStatus.coming
                                      ? '✓ Going'
                                      : _myRsvp == RsvpStatus.not_coming
                                          ? '✗ Not Going'
                                          : '? TBD',
                                  style: GoogleFonts.inter(
                                    color: _myRsvp == RsvpStatus.coming
                                        ? const Color(0xFF2ECC71)
                                        : _myRsvp == RsvpStatus.not_coming
                                            ? const Color(0xFFE74C3C)
                                            : const Color(0xFFF39C12),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        _rsvpLoading
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: SizedBox(
                                    height: 28,
                                    width: 28,
                                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white38),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  _RsvpButton(
                                    label: 'Going',
                                    icon: Icons.check_circle_outline_rounded,
                                    color: const Color(0xFF2ECC71),
                                    selected: _myRsvp == RsvpStatus.coming,
                                    onTap: () => _rsvp(RsvpStatus.coming),
                                  ),
                                  const SizedBox(width: 8),
                                  _RsvpButton(
                                    label: 'Not Going',
                                    icon: Icons.cancel_outlined,
                                    color: const Color(0xFFE74C3C),
                                    selected: _myRsvp == RsvpStatus.not_coming,
                                    onTap: () => _rsvp(RsvpStatus.not_coming),
                                  ),
                                  const SizedBox(width: 8),
                                  _RsvpButton(
                                    label: 'TBD',
                                    icon: Icons.help_outline_rounded,
                                    color: const Color(0xFFF39C12),
                                    selected: _myRsvp == RsvpStatus.tbd,
                                    onTap: () => _rsvp(RsvpStatus.tbd),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ══════════════════════════════════════════════════════════
                  // ── Attendance Section ──
                  // ══════════════════════════════════════════════════════════
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111111),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFF1E1E1E)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            Icon(Icons.people_outline_rounded, color: Colors.grey.shade600, size: 15),
                            const SizedBox(width: 8),
                            Text('Attendance',
                                style: GoogleFonts.inter(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                )),
                            const Spacer(),
                            if (!_rsvpsLoading)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _MiniCount(count: goingCount, color: const Color(0xFF2ECC71), icon: Icons.check_circle_rounded),
                                  const SizedBox(width: 5),
                                  _MiniCount(count: notGoingCount, color: const Color(0xFFE74C3C), icon: Icons.cancel_rounded),
                                  const SizedBox(width: 5),
                                  _MiniCount(count: tbdCount, color: const Color(0xFFF39C12), icon: Icons.help_rounded),
                                  if (widget.showFullAttendance && widget.teamMembers.isNotEmpty && noResponseCount > 0) ...[
                                    const SizedBox(width: 5),
                                    _MiniCount(count: noResponseCount, color: Colors.grey, icon: Icons.remove_circle_outline_rounded),
                                  ],
                                ],
                              ),
                          ],
                        ),

                        // Summary bar
                        if (!_rsvpsLoading && _rsvps.isNotEmpty) ...[
                          const SizedBox(height: 14),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: SizedBox(
                              height: 6,
                              child: Row(
                                children: [
                                  if (goingCount > 0)
                                    Expanded(
                                      flex: goingCount,
                                      child: Container(color: const Color(0xFF2ECC71)),
                                    ),
                                  if (notGoingCount > 0)
                                    Expanded(
                                      flex: notGoingCount,
                                      child: Container(color: const Color(0xFFE74C3C)),
                                    ),
                                  if (tbdCount > 0)
                                    Expanded(
                                      flex: tbdCount,
                                      child: Container(color: const Color(0xFFF39C12)),
                                    ),
                                  if (noResponseCount > 0)
                                    Expanded(
                                      flex: noResponseCount,
                                      child: Container(color: Colors.grey.shade800),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 14),

                        if (_rsvpsLoading)
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: CircularProgressIndicator(color: Colors.white38, strokeWidth: 2),
                            ),
                          )
                        else if (widget.showFullAttendance && widget.teamMembers.isNotEmpty)
                          ..._buildFullAttendanceList()
                        else if (_rsvps.isEmpty)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D0D0D),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.how_to_reg_outlined, color: Colors.grey.shade700, size: 28),
                                const SizedBox(height: 8),
                                Text('No responses yet',
                                    style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13)),
                              ],
                            ),
                          )
                        else
                          ..._rsvps.map((r) => _RsvpListTile(
                              rsvp: r,
                              isMe: r.userId == widget.currentUserId,
                          )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Small widgets ────────────────────────────────────────────────────────────

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(
      {required this.icon, required this.label, required this.value, this.accentColor, this.isLast = false});
  final IconData icon;
  final String label;
  final String value;
  final Color? accentColor;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final iconColor = accentColor?.withOpacity(.6) ?? Colors.grey.shade500;
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: (accentColor ?? Colors.grey).withOpacity(.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: (accentColor ?? Colors.grey).withOpacity(.08)),
            ),
            child: Icon(icon, size: 16, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 11, fontWeight: FontWeight.w500, letterSpacing: 0.3)),
                const SizedBox(height: 3),
                Text(value,
                    style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RsvpButton extends StatelessWidget {
  const _RsvpButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Expanded(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              gradient: selected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [color.withOpacity(.15), color.withOpacity(.05)],
                    )
                  : null,
              color: selected ? null : const Color(0xFF0D0D0D),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? color.withOpacity(.4) : const Color(0xFF222222),
                width: selected ? 1.5 : 1,
              ),
              boxShadow: selected
                  ? [BoxShadow(color: color.withOpacity(.1), blurRadius: 10, offset: const Offset(0, 3))]
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: selected ? color.withOpacity(.15) : const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon,
                      color: selected ? color : Colors.grey.shade600, size: 18),
                ),
                const SizedBox(height: 6),
                Text(label,
                    style: GoogleFonts.inter(
                        color: selected ? color : Colors.grey.shade600,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
                if (selected) ...[
                  const SizedBox(height: 4),
                  Container(
                    width: 14,
                    height: 2.5,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
}

class _MiniCount extends StatelessWidget {
  const _MiniCount({required this.count, required this.color, this.icon});
  final int count;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color.withOpacity(.7), size: 10),
            const SizedBox(width: 3),
          ],
          Text('$count',
              style: GoogleFonts.inter(
                  color: color, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _RsvpListTile extends StatelessWidget {
  const _RsvpListTile({required this.rsvp, this.isMe = false});
  final EventRsvp rsvp;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final IconData icon;
    switch (rsvp.status) {
      case RsvpStatus.coming:
        color = const Color(0xFF2ECC71);
        icon = Icons.check_circle_rounded;
        break;
      case RsvpStatus.not_coming:
        color = const Color(0xFFE74C3C);
        icon = Icons.cancel_rounded;
        break;
      case RsvpStatus.tbd:
        color = const Color(0xFFF39C12);
        icon = Icons.help_rounded;
        break;
    }
    final displayText = isMe ? '${rsvp.displayName} (You)' : rsvp.displayName;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          color: isMe ? color.withOpacity(.04) : const Color(0xFF0D0D0D),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isMe ? color.withOpacity(.12) : const Color(0xFF1A1A1A)),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(.15), color.withOpacity(.05)],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color.withOpacity(.1)),
              ),
              child: Center(
                child: Text(
                  rsvp.displayName.isNotEmpty
                      ? rsvp.displayName[0].toUpperCase()
                      : '?',
                  style: GoogleFonts.inter(color: color, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(displayText,
                      style: GoogleFonts.inter(
                        color: isMe ? Colors.white : Colors.white.withOpacity(0.75),
                        fontSize: 13,
                        fontWeight: isMe ? FontWeight.w600 : FontWeight.w400,
                      )),
                  if (isMe)
                    Text('That\'s you',
                        style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 10)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(.1)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: color, size: 14),
                  const SizedBox(width: 4),
                  Text(rsvp.status.label,
                      style: GoogleFonts.inter(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Attendance tile for privileged view showing all team members.
/// If the member has an RSVP it shows their status; otherwise "No Response".
class _FullAttendanceTile extends StatelessWidget {
  const _FullAttendanceTile({required this.name, this.rsvp, this.isMe = false});
  final String name;
  final EventRsvp? rsvp;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final IconData icon;
    final String label;

    if (rsvp != null) {
      switch (rsvp!.status) {
        case RsvpStatus.coming:
          color = const Color(0xFF2ECC71);
          icon = Icons.check_circle_rounded;
          label = 'Coming';
          break;
        case RsvpStatus.not_coming:
          color = const Color(0xFFE74C3C);
          icon = Icons.cancel_rounded;
          label = 'Not Coming';
          break;
        case RsvpStatus.tbd:
          color = const Color(0xFFF39C12);
          icon = Icons.help_rounded;
          label = 'TBD';
          break;
      }
    } else {
      color = Colors.grey;
      icon = Icons.remove_circle_outline_rounded;
      label = 'No Response';
    }

    final displayText = isMe ? '$name (You)' : name;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        decoration: BoxDecoration(
          color: isMe ? color.withOpacity(.04) : const Color(0xFF0D0D0D),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isMe ? color.withOpacity(.12) : const Color(0xFF1A1A1A)),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color.withOpacity(.15), color.withOpacity(.05)],
                ),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color.withOpacity(.1)),
              ),
              child: Center(
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: GoogleFonts.inter(color: color, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(displayText,
                      style: GoogleFonts.inter(
                        color: isMe ? Colors.white : Colors.white.withOpacity(0.75),
                        fontSize: 13,
                        fontWeight: isMe ? FontWeight.w600 : FontWeight.w400,
                      )),
                  if (isMe)
                    Text('That\'s you',
                        style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 10)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: color.withOpacity(.1)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: color, size: 14),
                  const SizedBox(width: 4),
                  Text(label, style: GoogleFonts.inter(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _CreateEventSheet
// ─────────────────────────────────────────────────────────────────────────────

class _CreateEventSheet extends StatefulWidget {
  const _CreateEventSheet({
    required this.teamId,
    required this.eventService,
  });

  final String teamId;
  final EventService eventService;

  @override
  State<_CreateEventSheet> createState() => _CreateEventSheetState();
}

class _CreateEventSheetState extends State<_CreateEventSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();

  EventType _eventType = EventType.practice;
  DateTime _startTime = DateTime.now().add(const Duration(hours: 1));
  DateTime? _endTime;
  bool _loading = false;
  bool _submitting = false; // synchronous guard against double-tap

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _locationCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime({required bool isEnd}) async {
    final now = DateTime.now();
    final initial = isEnd ? (_endTime ?? _startTime) : _startTime;

    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: now.add(const Duration(days: 365 * 2)),
      builder: (ctx, child) => Theme(
        data: ThemeData.dark(),
        child: child!,
      ),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
      builder: (ctx, child) => Theme(
        data: ThemeData.dark(),
        child: child!,
      ),
    );
    if (time == null || !mounted) return;

    final picked = DateTime(
        date.year, date.month, date.day, time.hour, time.minute);

    setState(() {
      if (isEnd) {
        _endTime = picked;
      } else {
        _startTime = picked;
        if (_endTime != null && _endTime!.isBefore(picked)) {
          _endTime = picked.add(const Duration(hours: 1));
        }
      }
    });
  }

  Future<void> _submit() async {
    if (_submitting) return;
    _submitting = true;
    if (!_formKey.currentState!.validate()) {
      _submitting = false;
      return;
    }
    setState(() => _loading = true);
    try {
      await widget.eventService.createEvent(
        teamId: widget.teamId,
        title: _titleCtrl.text.trim(),
        eventType: _eventType,
        startTime: _startTime,
        description: _descCtrl.text.trim().isEmpty
            ? null
            : _descCtrl.text.trim(),
        location: _locationCtrl.text.trim().isEmpty
            ? null
            : _locationCtrl.text.trim(),
        endTime: _endTime,
      );
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      print('🔴 [EventsPage] createEvent error: $e');
      _submitting = false;
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    final selectedColor = _typeColor(_eventType);

    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20 + bottom),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0D0D),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: const Border(top: BorderSide(color: Color(0xFF1E1E1E), width: 0.5)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Drag handle ──
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3A3A3A),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),

              // ── Header with icon ──
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [const Color(0xFF2B7DE9).withOpacity(.2), const Color(0xFF2B7DE9).withOpacity(.06)],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF2B7DE9).withOpacity(.12)),
                    ),
                    child: const Icon(Icons.event_note_rounded, color: Color(0xFF2B7DE9), size: 22),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Event',
                          style: GoogleFonts.inter(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 3),
                      Text('Fill in the details below',
                          style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ═══ Event Info Section ═══
              _sectionLabel('EVENT INFO'),
              const SizedBox(height: 10),
              
              // Title
              TextFormField(
                controller: _titleCtrl,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                decoration: _inputDecoration(
                  label: 'Event Title',
                  hint: 'e.g. Weekly Practice',
                  icon: Icons.edit_rounded,
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 14),

              // Event type
              Text('Event Type',
                  style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.3)),
              const SizedBox(height: 10),
              Row(
                children: EventType.values.map((t) {
                  final selected = t == _eventType;
                  final color = _typeColor(t);
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _eventType = t),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.only(right: t == EventType.values.last ? 0 : 8),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          gradient: selected
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [color.withOpacity(.18), color.withOpacity(.06)],
                                )
                              : null,
                          color: selected ? null : const Color(0xFF151515),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: selected ? color.withOpacity(.4) : const Color(0xFF222222),
                            width: selected ? 1.5 : 1,
                          ),
                          boxShadow: selected
                              ? [BoxShadow(color: color.withOpacity(.12), blurRadius: 10, offset: const Offset(0, 3))]
                              : null,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: selected ? color.withOpacity(.15) : const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(_typeIcon(t),
                                  color: selected ? color : Colors.grey.shade600,
                                  size: 18),
                            ),
                            const SizedBox(height: 8),
                            Text(t.label,
                                style: GoogleFonts.inter(
                                    color: selected ? color : Colors.grey.shade500,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                            if (selected) ...[
                              const SizedBox(height: 4),
                              Container(
                                width: 16,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 22),

              // ═══ Schedule Section ═══
              _sectionLabel('SCHEDULE'),
              const SizedBox(height: 10),

              _DateTimeTile(
                label: 'Start Time',
                dateTime: _startTime,
                onTap: () => _pickDateTime(isEnd: false),
                accentColor: selectedColor,
                required: true,
              ),
              const SizedBox(height: 10),
              _DateTimeTile(
                label: 'End Time',
                dateTime: _endTime,
                onTap: () => _pickDateTime(isEnd: true),
                accentColor: selectedColor,
                onClear: _endTime != null
                    ? () => setState(() => _endTime = null)
                    : null,
              ),

              const SizedBox(height: 22),

              // ═══ Additional Details Section ═══
              _sectionLabel('ADDITIONAL DETAILS'),
              const SizedBox(height: 10),

              // Location
              TextFormField(
                controller: _locationCtrl,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                decoration: _inputDecoration(
                  label: 'Location',
                  hint: 'e.g. Main Field',
                  icon: Icons.location_on_rounded,
                ),
              ),
              const SizedBox(height: 14),

              // Description
              TextFormField(
                controller: _descCtrl,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                maxLines: 3,
                decoration: _inputDecoration(
                  label: 'Notes',
                  hint: 'Any additional details...',
                  icon: Icons.notes_rounded,
                  alignHint: true,
                ),
              ),
              const SizedBox(height: 28),

              // ═══ Submit button ═══
              SizedBox(
                width: double.infinity,
                height: 54,
                child: GestureDetector(
                  onTap: _loading ? null : _submit,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      gradient: _loading
                          ? null
                          : LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                selectedColor.withOpacity(.9),
                                selectedColor,
                              ],
                            ),
                      color: _loading ? const Color(0xFF1A1A1A) : null,
                      borderRadius: BorderRadius.circular(16),
                      border: _loading ? Border.all(color: const Color(0xFF2A2A2A)) : null,
                      boxShadow: _loading
                          ? null
                          : [
                              BoxShadow(
                                color: selectedColor.withOpacity(0.25),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                    ),
                    child: Center(
                      child: _loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add_rounded, color: Colors.white, size: 20),
                                const SizedBox(width: 8),
                                Text('Create Event',
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.3)),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper: Section label ──
  Widget _sectionLabel(String text) => Row(
    children: [
      Container(
        width: 3,
        height: 14,
        decoration: BoxDecoration(
          color: _typeColor(_eventType).withOpacity(.5),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      const SizedBox(width: 8),
      Text(text,
          style: GoogleFonts.inter(
            color: Colors.grey.shade500,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          )),
    ],
  );

  // ── Helper: Input decoration factory ──
  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    String? hint,
    bool alignHint = false,
  }) =>
      InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 14),
        hintStyle: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 14),
        prefixIcon: Icon(icon, color: Colors.grey.shade600, size: 20),
        alignLabelWithHint: alignHint,
        filled: true,
        fillColor: const Color(0xFF111111),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF1E1E1E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: _typeColor(_eventType).withOpacity(.5)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE74C3C)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE74C3C)),
        ),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// _DateTimeTile
// ─────────────────────────────────────────────────────────────────────────────

class _DateTimeTile extends StatelessWidget {
  const _DateTimeTile({
    required this.label,
    required this.dateTime,
    required this.onTap,
    this.onClear,
    this.accentColor,
    this.required = false,
  });
  final String label;
  final DateTime? dateTime;
  final VoidCallback onTap;
  final VoidCallback? onClear;
  final Color? accentColor;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final hasValue = dateTime != null;
    final iconColor = hasValue ? (accentColor ?? Colors.grey.shade500) : Colors.grey.shade600;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: hasValue
                ? (accentColor?.withOpacity(.2) ?? const Color(0xFF2A2A2A))
                : const Color(0xFF1E1E1E),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: (accentColor ?? Colors.grey).withOpacity(.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: (accentColor ?? Colors.grey).withOpacity(.08)),
              ),
              child: Icon(Icons.calendar_today_rounded, color: iconColor, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(label,
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade500,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.3,
                          )),
                      if (required)
                        Text(' *',
                            style: GoogleFonts.inter(color: accentColor ?? const Color(0xFF3498DB), fontSize: 11, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hasValue ? _formatDate(dateTime!) : 'Tap to select',
                    style: GoogleFonts.inter(
                      color: hasValue ? Colors.white : Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: hasValue ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (onClear != null)
              GestureDetector(
                onTap: onClear,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF2A2A2A)),
                  ),
                  child: Icon(Icons.close_rounded, color: Colors.grey.shade500, size: 14),
                ),
              )
            else
              Icon(Icons.chevron_right_rounded, color: Colors.grey.shade700, size: 18),
          ],
        ),
      ),
    );
  }
}
