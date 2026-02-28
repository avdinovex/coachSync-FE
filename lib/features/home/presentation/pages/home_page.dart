import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:coachsync/features/team/data/team_service.dart';
import 'package:coachsync/features/team/domain/models/team.dart';
import 'package:coachsync/features/team/presentation/pages/team_detail_page.dart';
import 'package:coachsync/features/schedule/data/event_service.dart';
import 'package:coachsync/features/schedule/domain/models/event.dart';
import 'package:coachsync/features/home/presentation/pages/message_page.dart';
import 'package:coachsync/features/home/presentation/pages/events_page.dart';
import 'package:coachsync/features/home/presentation/pages/profile_page.dart';
import 'package:coachsync/features/team/presentation/pages/create_team_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email});
  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNav = 0;
  int _currentTeamPage = 0;
  int _currentEventPage = 0;

  final PageController _eventsPageController = PageController(viewportFraction: 0.52);

  // ── Live data ──
  final TeamService _teamService = TeamService();
  final EventService _eventService = EventService();

  List<Team> _teams = [];
  List<Event> _events = [];
  bool _loadingTeams = true;
  bool _loadingEvents = true;
  String? _teamError;
  String? _eventError;

  /// Map sport name → local asset image. Falls back to a default.
  static const _sportImages = <String, String>{
    'basketball': 'assets/images/basketball.jpg',
    'cricket': 'assets/images/cricket.jpg',
    'football': 'assets/images/football.jpg',
    'soccer': 'assets/images/football.jpg',
    'tennis': 'assets/images/tennis.jpg',
    'hockey': 'assets/images/hockey.png',
  };
  static const _defaultTeamImage = 'assets/images/basketball.jpg';

  String _imageForSport(String sport) =>
      _sportImages[sport.toLowerCase()] ?? _defaultTeamImage;

  @override
  void initState() {
    super.initState();
    _eventsPageController.addListener(() {
      final page = _eventsPageController.page?.round() ?? 0;
      if (page != _currentEventPage) setState(() => _currentEventPage = page);
    });
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Future.wait([_fetchTeams(), _fetchUpcomingEvents()]);
  }

  Future<void> _fetchTeams() async {
    try {
      final teams = await _teamService.fetchMyTeams();
      if (!mounted) return;
      setState(() {
        _teams = teams;
        _loadingTeams = false;
      });
      // After teams are loaded, fetch events for all teams
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _teamError = e.toString();
        _loadingTeams = false;
      });
    }
  }

  Future<void> _fetchUpcomingEvents() async {
    try {
      final events = await _eventService.getUpcomingEvents();
      if (!mounted) return;
      setState(() {
        _events = events;
        _loadingEvents = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _eventError = e.toString();
        _loadingEvents = false;
      });
    }
  }

  @override
  void dispose() {
    _eventsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedNav,
          children: [
            _buildHomeTab(),
            const MessagePage(),
            const EventsPage(),
            ProfilePage(email: widget.email),
          ],
        ),
      ),

      // ═══════════════════════════════════════════
      //  BOTTOM NAV BAR + ADD BUTTON
      // ═══════════════════════════════════════════
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
        child: Row(
          children: [
            // Nav bar
            Expanded(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xFF151515),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: const Color(0xFF2A2A2A)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _NavIcon(icon: Icons.home_rounded, label: 'Home', selected: _selectedNav == 0, onTap: () => setState(() => _selectedNav = 0)),
                    _NavIcon(icon: Icons.chat_bubble_outline_rounded, label: 'Messages', selected: _selectedNav == 1, onTap: () => setState(() => _selectedNav = 1)),
                    _NavIcon(icon: Icons.event_note_rounded, label: 'Events', selected: _selectedNav == 2, onTap: () => setState(() => _selectedNav = 2)),
                    _NavIcon(icon: Icons.person_outline_rounded, label: 'Profile', selected: _selectedNav == 3, onTap: () => setState(() => _selectedNav = 3)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Add team button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateTeamPage(email: widget.email),
                  ),
                ).then((_) => _fetchData());
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2A2A2A)),
                ),
                child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    final namePart = widget.email.split('@').first;
    final greetingName = namePart.isEmpty
        ? 'User'
        : '${namePart[0].toUpperCase()}${namePart.substring(1)}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          // ═══════════════════════════════════════════
          //  HEADER
          // ═══════════════════════════════════════════
          Row(
            children: [
              const CircleAvatar(radius: 18, backgroundColor: Color(0xFFD9D9D9)),
              const SizedBox(width: 10),
              Text(
                'Team|Reach',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Icon(Icons.notifications_none_rounded, color: Colors.grey.shade400, size: 24),
              const SizedBox(width: 14),
              Icon(Icons.account_circle_outlined, color: Colors.grey.shade400, size: 24),
            ],
          ),

          const SizedBox(height: 20),

          // ═══════════════════════════════════════════
          //  GREETING + TAGLINE
          // ═══════════════════════════════════════════
          Text(
            'Hey, $greetingName',
            style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          Text(
            'Simple, Fast Team\nCommunication',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.15,
            ),
          ),

          const SizedBox(height: 22),

          // ═══════════════════════════════════════════
          //  TEAMS SECTION
          // ═══════════════════════════════════════════
          Text(
            'Teams',
            style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 17, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 10),

          // The carousel takes as much vertical space as available
          Expanded(
            flex: 5,
            child: _loadingTeams
                ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : _teamError != null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Failed to load teams', style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 14)),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () { setState(() { _loadingTeams = true; _teamError = null; }); _fetchTeams(); },
                              child: const Text('Retry', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      )
                    : _teams.isEmpty
                        ? Center(
                            child: Text('No teams yet. Create or join a team!',
                              style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 14)),
                          )
                        : _CoverflowCarousel(
                            teams: _teams.map((t) => {'id': t.id, 'name': t.name, 'image': _imageForSport(t.sport)}).toList(),
                            onPageChanged: (p) => setState(() => _currentTeamPage = p),
                            onTeamTap: (id, name) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TeamDetailPage(teamId: id, teamName: name),
                                ),
                              ).then((_) => _fetchData());
                            },
                          ),
          ),

          const SizedBox(height: 10),

          // ═══════════════════════════════════════════
          //  UPCOMING EVENTS SECTION
          // ═══════════════════════════════════════════
          Text(
            'Upcoming Events',
            style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 17, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 12),

          // Event cards – horizontal scrolling carousel
          SizedBox(
            height: 130,
            child: _loadingEvents
                ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : _eventError != null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Failed to load events', style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 14)),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: () { setState(() { _loadingEvents = true; _eventError = null; }); _fetchUpcomingEvents(); },
                              child: const Text('Retry', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      )
                    : _events.isEmpty
                        ? Center(
                            child: Text('No upcoming events',
                              style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 14)),
                          )
                        : PageView.builder(
                            controller: _eventsPageController,
                            itemCount: _events.length,
                            itemBuilder: (context, index) {
                              final evt = _events[index];
                              final timeFmt = DateFormat('h:mma');
                              final dateFmt = DateFormat('d/M/yy');
                              final timeRange = evt.endTime != null
                                  ? '${timeFmt.format(evt.startTime)}-${timeFmt.format(evt.endTime!)}'
                                  : timeFmt.format(evt.startTime);
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: _EventCard(
                                  title: evt.title,
                                  date: timeRange,
                                  venue: evt.location ?? 'TBD',
                                  eventDate: dateFmt.format(evt.startTime),
                                ),
                              );
                            },
                          ),
          ),

          const SizedBox(height: 10),

          // ── Pagination dots (synced with Upcoming Events) ──
          if (_events.isNotEmpty)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  _events.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: i == _currentEventPage ? 10 : 7,
                    height: i == _currentEventPage ? 10 : 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: i == _currentEventPage ? Colors.white : Colors.grey.shade700,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  COVERFLOW CAROUSEL  –  infinite, overlapping, 3-D depth
// ══════════════════════════════════════════════════════════════
class _CoverflowCarousel extends StatefulWidget {
  const _CoverflowCarousel({required this.teams, required this.onPageChanged, this.onTeamTap});
  final List<Map<String, String>> teams;
  final ValueChanged<int> onPageChanged;
  final void Function(String id, String name)? onTeamTap;

  @override
  State<_CoverflowCarousel> createState() => _CoverflowCarouselState();
}

class _CoverflowCarouselState extends State<_CoverflowCarousel> {
  PageController? _ctrl;
  double _page = 0;

  static const int _kMultiplier = 1000;
  int get _virtualCount => widget.teams.length * _kMultiplier;
  int get _startPage => widget.teams.length * (_kMultiplier ~/ 2);

  PageController _ensureController() {
    if (_ctrl == null) {
      _ctrl = PageController(viewportFraction: 0.34, initialPage: _startPage);
      _page = _startPage.toDouble();
      _ctrl!.addListener(() {
        setState(() => _page = _ctrl!.page ?? _startPage.toDouble());
        widget.onPageChanged(_page.round() % widget.teams.length);
      });
    }
    return _ctrl!;
  }

  @override
  void initState() {
    super.initState();
    _ensureController();
  }

  @override
  void dispose() {
    _ctrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.teams.length;

    return LayoutBuilder(builder: (context, box) {
      final areaW = box.maxWidth;
      final areaH = box.maxHeight;

      // Base card size – square, respects area
      final baseSize = areaH * 0.58;

      // Build visible items (±2 around center)
      final center = _page.round();
      final items = <_CItem>[];
      for (int v = center - 2; v <= center + 2; v++) {
        final real = ((v % n) + n) % n;
        final diff = v - _page;
        items.add(_CItem(
          virtual: v,
          diff: diff,
          id: widget.teams[real]['id'] ?? '',
          name: widget.teams[real]['name']!,
          image: widget.teams[real]['image']!,
        ));
      }

      // Sort: farthest first → center last (paints on top)
      items.sort((a, b) => b.diff.abs().compareTo(a.diff.abs()));

      return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // ── visual cards ──
          for (final item in items)
            Builder(builder: (_) {
              final absDiff = item.diff.abs();
              final isCenter = absDiff < 0.5;

              // Scale: center = 1.0, sides shrink significantly
              final scale = isCenter ? 1.0 : (0.72 - (absDiff - 1) * 0.08).clamp(0.55, 0.72);

              // Opacity: center = 1.0, sides fade
              final opacity = (1.0 - absDiff * 0.28).clamp(0.30, 1.0);

              // Horizontal offset – tight overlap
              final xShift = item.diff * baseSize * 0.62;

              final cardSize = baseSize * scale;

              return Positioned(
                left: (areaW - cardSize) / 2 + xShift,
                top: (areaH - cardSize) / 2,
                child: isCenter
                    ? GestureDetector(
                        onTap: () => widget.onTeamTap?.call(item.id, item.name),
                        child: Opacity(
                          opacity: opacity,
                          child: SizedBox(
                            width: cardSize,
                            height: cardSize,
                            child: _TeamCard(name: item.name, image: item.image, isCenter: isCenter),
                          ),
                        ),
                      )
                    : IgnorePointer(
                        child: Opacity(
                          opacity: opacity,
                          child: SizedBox(
                            width: cardSize,
                            height: cardSize,
                            child: _TeamCard(name: item.name, image: item.image, isCenter: isCenter),
                          ),
                        ),
                      ),
              );
            }),

          // ── invisible PageView for swipe gestures ──
          // Wrap in a listener that detects taps on the center card
          Positioned.fill(
            child: _TapThroughPageView(
              onCenterTap: () {
                final centerIndex = _page.round() % widget.teams.length;
                final team = widget.teams[centerIndex];
                widget.onTeamTap?.call(team['id'] ?? '', team['name']!);
              },
              child: PageView.builder(
                controller: _ensureController(),
                itemCount: _virtualCount,
                itemBuilder: (_, __) => const SizedBox(),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class _CItem {
  _CItem({required this.virtual, required this.diff, required this.id, required this.name, required this.image});
  final int virtual;
  final double diff;
  final String id;
  final String name;
  final String image;
}

/// Passes taps through to [onCenterTap] while letting
/// horizontal drags reach the underlying [PageView].
class _TapThroughPageView extends StatefulWidget {
  const _TapThroughPageView({required this.child, required this.onCenterTap});
  final Widget child;
  final VoidCallback onCenterTap;

  @override
  State<_TapThroughPageView> createState() => _TapThroughPageViewState();
}

class _TapThroughPageViewState extends State<_TapThroughPageView> {
  Offset? _downPos;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (e) => _downPos = e.localPosition,
      onPointerUp: (e) {
        if (_downPos != null) {
          final dist = (e.localPosition - _downPos!).distance;
          // If the finger barely moved, treat it as a tap
          if (dist < 15) {
            widget.onCenterTap();
          }
        }
        _downPos = null;
      },
      child: widget.child,
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  TEAM CARD  – 1:1 square, gradient + label
// ══════════════════════════════════════════════════════════════
class _TeamCard extends StatelessWidget {
  const _TeamCard({required this.name, required this.image, required this.isCenter});
  final String name;
  final String image;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isCenter ? Colors.white.withOpacity(0.25) : const Color(0xFF333333),
          width: isCenter ? 1.5 : 1,
        ),
        boxShadow: isCenter
            ? [BoxShadow(color: Colors.white.withOpacity(0.08), blurRadius: 24, spreadRadius: 2)]
            : [],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          // Dark gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isCenter
                    ? [const Color(0x55000000), const Color(0x88000000)]
                    : [const Color(0xCC1C1C1C), const Color(0xCC111111)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Notch at top (subtle)
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                width: 22,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          // Name badge at bottom – center card only
          if (isCenter)
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.78),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white54),
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  EVENT CARD
// ══════════════════════════════════════════════════════════════
class _EventCard extends StatelessWidget {
  const _EventCard({required this.title, required this.date, required this.venue, required this.eventDate});
  final String title;
  final String date;
  final String venue;
  final String eventDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2C2C2C)),
      ),
      child: Stack(
        children: [
          // Subtle red glow
          Positioned(
            right: -16,
            bottom: -20,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [Color(0x66B11313), Color(0x00111111)]),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title chip
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Text(
                  title,
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              // Time row
              Row(
                children: [
                  const Icon(Icons.access_time_rounded, size: 14, color: Color(0xFFFF5B5B)),
                  const SizedBox(width: 5),
                  Text(date, style: GoogleFonts.inter(color: const Color(0xFFFF5B5B), fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 6),
              // Venue row
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 14, color: Colors.white60),
                  const SizedBox(width: 5),
                  Text(venue, style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              // Date row
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 13, color: Colors.white60),
                  const SizedBox(width: 5),
                  Text(eventDate, style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  BOTTOM NAV ICON
// ══════════════════════════════════════════════════════════════
class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, required this.selected, required this.onTap, this.label});
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF3A3A3A) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: selected ? Colors.white : Colors.grey.shade600, size: 22),
            ),
            if (label != null) ...[
              const SizedBox(height: 2),
              Text(
                label!,
                style: GoogleFonts.inter(
                  color: selected ? Colors.white : Colors.grey.shade600,
                  fontSize: 10,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
