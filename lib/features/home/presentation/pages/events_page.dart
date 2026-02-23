import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      return const Color(0xFF4CAF50);
    case EventType.practice:
      return const Color(0xFF2196F3);
    case EventType.meeting:
      return const Color(0xFFFF9800);
  }
}

IconData _typeIcon(EventType t) {
  switch (t) {
    case EventType.game:
      return Icons.emoji_events_outlined;
    case EventType.practice:
      return Icons.fitness_center_outlined;
    case EventType.meeting:
      return Icons.groups_outlined;
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
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage>
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
    _loadTeams();
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
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Delete Event',
            style: TextStyle(color: Colors.white)),
        content: Text(
          'Delete "${event.title}"? This cannot be undone.',
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel',
                  style: TextStyle(color: Colors.grey))),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete',
                  style: TextStyle(color: Colors.redAccent))),
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

  // ── Event detail ──────────────────────────────────────────────────────────

  void _openEventDetail(Event event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _EventDetailSheet(
        event: event,
        eventService: _eventService,
        onDelete: () => _deleteEvent(event),
        onRsvpChanged: _loadEvents,
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
      floatingActionButton: _selectedTeamId != null
          ? FloatingActionButton(
              onPressed: _showCreateEventSheet,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              child: const Icon(Icons.add),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ──────────────────────────────────────────────────────
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Text(
              'Events',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          // ── Team selector ────────────────────────────────────────────────
          if (_teamsLoading)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(children: [
                SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white54)),
                SizedBox(width: 8),
                Text('Loading teams…',
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ]),
            )
          else if (_teams.isEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text('No teams found. Create or join a team first.',
                  style: TextStyle(color: Colors.grey[500], fontSize: 13)),
            )
          else
            SizedBox(
              height: 38,
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
                        _loadEvents();
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? Colors.white : Colors.grey[900],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected
                              ? Colors.white
                              : Colors.grey[800]!,
                        ),
                      ),
                      child: Text(
                        t.name,
                        style: TextStyle(
                          color: selected ? Colors.black : Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 12),

          // ── Tabs ─────────────────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 13),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Upcoming'),
                Tab(text: 'All Events'),
              ],
            ),
          ),

          const SizedBox(height: 12),

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
          child: CircularProgressIndicator(color: Colors.white54));
    }
    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.redAccent, size: 48),
              const SizedBox(height: 12),
              Text(_error!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _loadEvents,
                  child: const Text('Retry')),
            ],
          ),
        ),
      );
    }
    if (_selectedTeamId == null) {
      return Center(
        child: Text('Select a team to view events',
            style: TextStyle(color: Colors.grey[500])),
      );
    }
    if (_events.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event_busy_outlined,
                size: 64, color: Colors.grey[700]),
            const SizedBox(height: 12),
            Text(
              upcoming ? 'No upcoming events' : 'No events yet',
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Text(
              'Tap + to create one',
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
            ),
          ],
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: _loadEvents,
      color: Colors.white,
      backgroundColor: Colors.grey[900],
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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isToday ? color.withOpacity(.6) : Colors.grey[850]!,
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Left colour stripe + date
              Container(
                width: 72,
                decoration: BoxDecoration(
                  color: color.withOpacity(.12),
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(15)),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_typeIcon(event.eventType), color: color, size: 22),
                    const SizedBox(height: 6),
                    Text(
                      _formatShortDate(event.startTime),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      _formatTime(event.startTime),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: color.withOpacity(.8),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              // Main content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + type badge
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              event.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withOpacity(.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              event.eventType.label,
                              style: TextStyle(
                                  color: color,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Location
                      if (event.location != null &&
                          event.location!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  size: 13, color: Colors.grey[500]),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  event.location!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),

                      // RSVP summary
                      if (event.rsvps != null && event.rsvps!.isNotEmpty)
                        Row(
                          children: [
                            _RsvpPill(
                                count: event.comingCount,
                                label: 'Going',
                                color: Colors.green),
                            const SizedBox(width: 6),
                            _RsvpPill(
                                count: event.notComingCount,
                                label: 'No',
                                color: Colors.redAccent),
                            const SizedBox(width: 6),
                            _RsvpPill(
                                count: event.tbdCount,
                                label: 'TBD',
                                color: Colors.grey),
                          ],
                        ),

                      // Today badge
                      if (isToday) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: color.withOpacity(.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('TODAY',
                              style: TextStyle(
                                  color: color,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.chevron_right,
                    color: Colors.grey, size: 20),
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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$count $label',
        style: TextStyle(color: color, fontSize: 11),
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
  });

  final Event event;
  final EventService eventService;
  final VoidCallback onDelete;
  final VoidCallback onRsvpChanged;

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
      setState(() {
        _rsvps = rsvps;
        _rsvpsLoading = false;
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

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final color = _typeColor(event.eventType);

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            _DragHandle(),

            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                children: [
                  // ── Title row ──────────────────────────────────────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: color.withOpacity(.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(_typeIcon(event.eventType),
                            color: color, size: 26),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(event.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: color.withOpacity(.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(event.eventType.label,
                                  style: TextStyle(
                                      color: color,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.redAccent),
                        onPressed: widget.onDelete,
                        tooltip: 'Delete event',
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ── Info rows ──────────────────────────────────────────
                  _InfoRow(
                    icon: Icons.schedule_outlined,
                    label: 'Start',
                    value: _formatDate(event.startTime),
                  ),
                  if (event.endTime != null)
                    _InfoRow(
                      icon: Icons.flag_outlined,
                      label: 'End',
                      value: _formatDate(event.endTime!),
                    ),
                  if (event.location != null && event.location!.isNotEmpty)
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Location',
                      value: event.location!,
                    ),
                  if (event.description != null &&
                      event.description!.isNotEmpty)
                    _InfoRow(
                      icon: Icons.notes_outlined,
                      label: 'Notes',
                      value: event.description!,
                    ),

                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFF333333)),
                  const SizedBox(height: 16),

                  // ── RSVP buttons ───────────────────────────────────────
                  const Text('Your RSVP',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                  const SizedBox(height: 10),
                  _rsvpLoading
                      ? const Center(
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white54),
                          ),
                        )
                      : Row(
                          children: [
                            _RsvpButton(
                              label: 'Going',
                              icon: Icons.check_circle_outline,
                              color: Colors.green,
                              selected: _myRsvp == RsvpStatus.coming,
                              onTap: () => _rsvp(RsvpStatus.coming),
                            ),
                            const SizedBox(width: 8),
                            _RsvpButton(
                              label: 'Not Going',
                              icon: Icons.cancel_outlined,
                              color: Colors.redAccent,
                              selected: _myRsvp == RsvpStatus.not_coming,
                              onTap: () => _rsvp(RsvpStatus.not_coming),
                            ),
                            const SizedBox(width: 8),
                            _RsvpButton(
                              label: 'TBD',
                              icon: Icons.help_outline,
                              color: Colors.orange,
                              selected: _myRsvp == RsvpStatus.tbd,
                              onTap: () => _rsvp(RsvpStatus.tbd),
                            ),
                          ],
                        ),

                  const SizedBox(height: 24),

                  // ── Attendance list ────────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Attendance',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      if (!_rsvpsLoading && _rsvps.isNotEmpty)
                        Row(
                          children: [
                            _MiniCount(
                                count: _rsvps
                                    .where(
                                        (r) => r.status == RsvpStatus.coming)
                                    .length,
                                color: Colors.green),
                            const SizedBox(width: 6),
                            _MiniCount(
                                count: _rsvps
                                    .where((r) =>
                                        r.status == RsvpStatus.not_coming)
                                    .length,
                                color: Colors.redAccent),
                            const SizedBox(width: 6),
                            _MiniCount(
                                count: _rsvps
                                    .where(
                                        (r) => r.status == RsvpStatus.tbd)
                                    .length,
                                color: Colors.orange),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  if (_rsvpsLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(
                            color: Colors.white54, strokeWidth: 2),
                      ),
                    )
                  else if (_rsvps.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text('No RSVPs yet',
                          style: TextStyle(color: Colors.grey[600])),
                    )
                  else
                    ..._rsvps.map((r) => _RsvpListTile(rsvp: r)),
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
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      );
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(
      {required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: Colors.grey[500]),
            const SizedBox(width: 10),
            SizedBox(
              width: 64,
              child: Text(label,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13)),
            ),
            Expanded(
              child: Text(value,
                  style:
                      const TextStyle(color: Colors.white70, fontSize: 13)),
            ),
          ],
        ),
      );
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: selected ? color.withOpacity(.2) : Colors.grey[850],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selected ? color : Colors.grey[800]!,
                width: selected ? 1.5 : 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon,
                    color: selected ? color : Colors.grey[500], size: 20),
                const SizedBox(height: 4),
                Text(label,
                    style: TextStyle(
                        color: selected ? color : Colors.grey[500],
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      );
}

class _MiniCount extends StatelessWidget {
  const _MiniCount({required this.count, required this.color});
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        decoration: BoxDecoration(
          color: color.withOpacity(.12),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text('$count',
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w700)),
      );
}

class _RsvpListTile extends StatelessWidget {
  const _RsvpListTile({required this.rsvp});
  final EventRsvp rsvp;

  @override
  Widget build(BuildContext context) {
    final Color color;
    final IconData icon;
    switch (rsvp.status) {
      case RsvpStatus.coming:
        color = Colors.green;
        icon = Icons.check_circle_outline;
        break;
      case RsvpStatus.not_coming:
        color = Colors.redAccent;
        icon = Icons.cancel_outlined;
        break;
      case RsvpStatus.tbd:
        color = Colors.orange;
        icon = Icons.help_outline;
        break;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[800],
            child: Text(
              rsvp.displayName.isNotEmpty
                  ? rsvp.displayName[0].toUpperCase()
                  : '?',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(rsvp.displayName,
                style: const TextStyle(color: Colors.white70, fontSize: 13)),
          ),
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 4),
          Text(rsvp.status.label,
              style: TextStyle(color: color, fontSize: 12)),
        ],
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

    return Container(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + bottom),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DragHandle(),

              const Text('Create Event',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Title
              TextFormField(
                controller: _titleCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Title *',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon:
                      Icon(Icons.title_outlined, color: Colors.grey),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 14),

              // Event type
              const Text('Type',
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 8),
              Row(
                children: EventType.values.map((t) {
                  final selected = t == _eventType;
                  final color = _typeColor(t);
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _eventType = t),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        margin: const EdgeInsets.only(right: 6),
                        padding:
                            const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selected
                              ? color.withOpacity(.2)
                              : Colors.grey[850],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: selected
                                  ? color
                                  : Colors.grey[800]!),
                        ),
                        child: Column(
                          children: [
                            Icon(_typeIcon(t),
                                color: selected
                                    ? color
                                    : Colors.grey[600],
                                size: 20),
                            const SizedBox(height: 4),
                            Text(t.label,
                                style: TextStyle(
                                    color: selected
                                        ? color
                                        : Colors.grey[600],
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 14),

              // Start time
              _DateTimeTile(
                label: 'Start Time *',
                dateTime: _startTime,
                onTap: () => _pickDateTime(isEnd: false),
              ),
              const SizedBox(height: 10),

              // End time
              _DateTimeTile(
                label: 'End Time (optional)',
                dateTime: _endTime,
                onTap: () => _pickDateTime(isEnd: true),
                onClear: _endTime != null
                    ? () => setState(() => _endTime = null)
                    : null,
              ),
              const SizedBox(height: 14),

              // Location
              TextFormField(
                controller: _locationCtrl,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.location_on_outlined,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(height: 14),

              // Description
              TextFormField(
                controller: _descCtrl,
                style: const TextStyle(color: Colors.white),
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon:
                      Icon(Icons.notes_outlined, color: Colors.grey),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 24),

              // Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _submit,
                  child: _loading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black),
                        )
                      : const Text('Create Event',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateTimeTile extends StatelessWidget {
  const _DateTimeTile({
    required this.label,
    required this.dateTime,
    required this.onTap,
    this.onClear,
  });
  final String label;
  final DateTime? dateTime;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[800]!),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today_outlined,
                  color: Colors.grey, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 11)),
                    const SizedBox(height: 2),
                    Text(
                      dateTime != null
                          ? _formatDate(dateTime!)
                          : 'Tap to select',
                      style: TextStyle(
                          color: dateTime != null
                              ? Colors.white
                              : Colors.grey[600],
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
              if (onClear != null)
                GestureDetector(
                  onTap: onClear,
                  child: const Icon(Icons.close,
                      color: Colors.grey, size: 18),
                ),
            ],
          ),
        ),
      );
}
