import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/services/auth_service.dart';
import '../../../schedule/data/event_service.dart';
import '../../../schedule/domain/models/event.dart';
import '../../data/team_service.dart';
import '../../domain/models/team.dart';

class TeamDetailPage extends StatefulWidget {
  const TeamDetailPage({super.key, required this.teamId, required this.teamName});

  final String teamId;
  final String teamName;

  @override
  State<TeamDetailPage> createState() => _TeamDetailPageState();
}

class _TeamDetailPageState extends State<TeamDetailPage> {
  final TeamService _teamService = TeamService();
  final EventService _eventService = EventService();

  Team? _team;
  List<TeamMember> _members = [];
  List<Event> _upcomingEvents = [];
  bool _loadingTeam = true;
  bool _loadingMembers = true;
  bool _loadingEvents = true;
  String? _error;
  bool _infoExpanded = true;

  // ── Derived helpers ──

  /// Members sorted: leaders → coaches → parents → players, current user last.
  List<TeamMember> get _sortedMembers {
    final currentUserId = AuthService.currentUser?.id;
    int priority(TeamMember m) {
      if (m.roles.contains(MemberRole.leader)) return 0;
      if (m.roles.contains(MemberRole.coach)) return 1;
      if (m.roles.contains(MemberRole.parent)) return 2;
      return 3;
    }

    final me = currentUserId != null
        ? _members.where((m) => m.userId == currentUserId).toList()
        : <TeamMember>[];
    final others = currentUserId != null
        ? _members.where((m) => m.userId != currentUserId).toList()
        : List<TeamMember>.of(_members);
    others.sort((a, b) => priority(a).compareTo(priority(b)));
    return [...others, ...me];
  }

  /// True when the current user is a leader or coach in this team.
  bool get _canAddMembers {
    final currentUserId = AuthService.currentUser?.id;
    if (currentUserId == null) return false;
    final myMember = _members.cast<TeamMember?>().firstWhere(
          (m) => m!.userId == currentUserId,
          orElse: () => null,
        );
    if (myMember == null) return false;
    return myMember.roles
        .any((r) => r == MemberRole.leader || r == MemberRole.coach);
  }

  /// True when the current user is a leader in this team.
  bool get _currentUserIsLeader {
    final currentUserId = AuthService.currentUser?.id;
    if (currentUserId == null) return false;
    final myMember = _members.cast<TeamMember?>().firstWhere(
          (m) => m!.userId == currentUserId,
          orElse: () => null,
        );
    return myMember?.roles.contains(MemberRole.leader) == true;
  }

  /// True when the current user is a coach (but not a leader) in this team.
  bool get _currentUserIsCoach {
    final currentUserId = AuthService.currentUser?.id;
    if (currentUserId == null) return false;
    final myMember = _members.cast<TeamMember?>().firstWhere(
          (m) => m!.userId == currentUserId,
          orElse: () => null,
        );
    if (myMember == null) return false;
    return myMember.roles.contains(MemberRole.coach) &&
        !myMember.roles.contains(MemberRole.leader);
  }

  @override
  void initState() {
    super.initState();
    _loadAll();
  }

  Future<void> _loadAll() async {
    await Future.wait([_loadTeam(), _loadMembers(), _loadEvents()]);
  }

  Future<void> _loadTeam() async {
    setState(() {
      _loadingTeam = true;
      _error = null;
    });
    try {
      final team = await _teamService.getTeamById(widget.teamId);
      if (!mounted) return;
      setState(() => _team = team);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = e.toString().replaceFirst('TeamException: ', ''));
    } finally {
      if (mounted) setState(() => _loadingTeam = false);
    }
  }

  Future<void> _loadMembers() async {
    setState(() => _loadingMembers = true);
    try {
      final members = await _teamService.getTeamMembers(widget.teamId);
      if (!mounted) return;
      setState(() => _members = members);
    } catch (e) {
      // members error handled silently, main error shown from _loadTeam
    } finally {
      if (mounted) setState(() => _loadingMembers = false);
    }
  }

  Future<void> _loadEvents() async {
    setState(() => _loadingEvents = true);
    try {
      final events = await _eventService.getUpcomingEvents(teamId: widget.teamId);
      if (!mounted) return;
      setState(() => _upcomingEvents = events);
    } catch (e) {
      // events error handled silently
    } finally {
      if (mounted) setState(() => _loadingEvents = false);
    }
  }

  // ─────────────────────── Edit Team ───────────────────────

  void _showEditSheet() {
    if (_team == null) return;
    final nameCtrl = TextEditingController(text: _team!.name);
    final sportCtrl = TextEditingController(text: _team!.sport);
    final descCtrl = TextEditingController(text: _team!.description ?? '');
    bool saving = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSheet) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Edit Team',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _inputField(nameCtrl, 'Team Name', Icons.group),
                const SizedBox(height: 12),
                _inputField(sportCtrl, 'Sport', Icons.sports),
                const SizedBox(height: 12),
                _inputField(descCtrl, 'Description (optional)', Icons.notes,
                    maxLines: 3),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: saving
                      ? null
                      : () async {
                          setSheet(() => saving = true);
                          try {
                            final updated = await _teamService.updateTeam(
                              widget.teamId,
                              name: nameCtrl.text.trim(),
                              sport: sportCtrl.text.trim(),
                              description: descCtrl.text.trim().isEmpty
                                  ? null
                                  : descCtrl.text.trim(),
                            );
                            if (!mounted) return;
                            Navigator.pop(ctx);
                            setState(() => _team = updated);
                            _showSnack('Team updated successfully');
                          } catch (e) {
                            setSheet(() => saving = false);
                            _showSnack(
                                e.toString().replaceFirst('TeamException: ', ''),
                                error: true);
                          }
                        },
                  child: saving
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Save Changes',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // ─────────────────────── Delete Team ───────────────────────

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Delete Team',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: Text(
          'Are you sure you want to delete "${_team?.name}"? This cannot be undone.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child:
                const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete',
                style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await _teamService.deleteTeam(widget.teamId);
      if (!mounted) return;
      Navigator.pop(context, 'deleted');
    } catch (e) {
      _showSnack(e.toString().replaceFirst('TeamException: ', ''), error: true);
    }
  }

  // ─────────────────────── Add Member ───────────────────────

  void _showAddMemberSheet() {
    final emailCtrl = TextEditingController();
    // Leaders can assign any role; coaches can only assign player or coach
    final availableRoles = _currentUserIsLeader
        ? MemberRole.values
        : [MemberRole.player, MemberRole.coach];
    MemberRole selectedRole = MemberRole.player;
    bool saving = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSheet) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Member',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _inputField(emailCtrl, 'Email Address', Icons.email,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                const Text('Role',
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: availableRoles.map((role) {
                    final selected = selectedRole == role;
                    return ChoiceChip(
                      label: Text(
                        role.name[0].toUpperCase() + role.name.substring(1),
                        style: TextStyle(
                            color: selected ? Colors.black : Colors.white70),
                      ),
                      selected: selected,
                      onSelected: (_) => setSheet(() => selectedRole = role),
                      selectedColor: Colors.white,
                      backgroundColor: Colors.grey[800],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: saving
                      ? null
                      : () async {
                          final email = emailCtrl.text.trim();
                          if (email.isEmpty) {
                            _showSnack('Email is required', error: true);
                            return;
                          }
                          setSheet(() => saving = true);
                          try {
                            await _teamService.addMember(
                              teamId: widget.teamId,
                              email: email,
                              roles: [selectedRole],
                            );
                            if (!mounted) return;
                            Navigator.pop(ctx);
                            await _loadMembers();
                            _showSnack('Member added successfully');
                          } catch (e) {
                            if (mounted) setSheet(() => saving = false);
                            final msg = e
                                .toString()
                                .replaceFirst('TeamException: ', '');
                            debugPrint('❌ addMember error: $e');
                            if (mounted) _showSnack(msg, error: true);
                          }
                        },
                  child: saving
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Add Member',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // ─────────────────────── Change Member Roles ───────────────────────

  void _showRoleChangeSheet(TeamMember target) {
    // Roles this manager can assign
    final assignableRoles = _currentUserIsLeader
        ? MemberRole.values.toList()
        : [MemberRole.player, MemberRole.coach];
    List<MemberRole> selectedRoles = List.of(target.roles);
    bool saving = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSheet) {
          return Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 32,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[800],
                      child: Text(
                        target.displayName.isNotEmpty
                            ? target.displayName[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            target.displayName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          if (target.email != null)
                            Text(target.email!,
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Assign Roles',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: assignableRoles.map((role) {
                    final selected = selectedRoles.contains(role);
                    return FilterChip(
                      label: Text(
                        role.name[0].toUpperCase() + role.name.substring(1),
                        style: TextStyle(
                            color: selected ? Colors.black : Colors.white70,
                            fontSize: 13),
                      ),
                      selected: selected,
                      onSelected: (val) => setSheet(() {
                        if (val) {
                          selectedRoles.add(role);
                        } else {
                          selectedRoles.remove(role);
                          if (selectedRoles.isEmpty) {
                            selectedRoles.add(MemberRole.player);
                          }
                        }
                      }),
                      selectedColor: Colors.white,
                      backgroundColor: Colors.grey[800],
                      checkmarkColor: Colors.black,
                      side: BorderSide.none,
                    );
                  }).toList(),
                ),
                if (!_currentUserIsLeader)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'As a coach, you can only assign player or coach roles.',
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: saving
                      ? null
                      : () async {
                          if (selectedRoles.isEmpty) {
                            _showSnack('Select at least one role', error: true);
                            return;
                          }
                          setSheet(() => saving = true);
                          try {
                            await _teamService.updateMemberRoles(
                              teamId: widget.teamId,
                              userId: target.userId,
                              roles: selectedRoles,
                            );
                            if (!mounted) return;
                            Navigator.pop(ctx);
                            await _loadMembers();
                            _showSnack('Roles updated successfully');
                          } catch (e) {
                            if (mounted) setSheet(() => saving = false);
                            final msg = e
                                .toString()
                                .replaceFirst('TeamException: ', '');
                            debugPrint('❌ updateMemberRoles error: $e');
                            if (mounted) _showSnack(msg, error: true);
                          }
                        },
                  child: saving
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('Save Roles',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // ─────────────────────── Helpers ───────────────────────

  /// Map sport to a local asset image.
  static const _sportImages = <String, String>{
    'basketball': 'assets/images/basketball.jpg',
    'cricket': 'assets/images/cricket.jpg',
    'football': 'assets/images/football.jpg',
    'soccer': 'assets/images/football.jpg',
    'tennis': 'assets/images/tennis.jpg',
    'hockey': 'assets/images/hockey.png',
  };
  static const _defaultTeamImage = 'assets/images/basketball.jpg';

  String get _teamImage =>
      _sportImages[_team?.sport.toLowerCase() ?? ''] ?? _defaultTeamImage;

  void _showSnack(String msg, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: error ? Colors.red[700] : Colors.green[700],
      ),
    );
  }

  Widget _inputField(
    TextEditingController ctrl,
    String label,
    IconData icon, {
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[400]),
        prefixIcon: Icon(icon, color: Colors.grey[500], size: 20),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ─────────────────────── Build ───────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _loadingTeam
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : _error != null
              ? _ErrorState(message: _error!, onRetry: _loadAll)
              : RefreshIndicator(
                  onRefresh: _loadAll,
                  color: Colors.white,
                  backgroundColor: const Color(0xFF1A1A1A),
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      // ───── Hero image + overlaid back / actions ─────
                      SliverAppBar(
                        expandedHeight: 220,
                        pinned: true,
                        backgroundColor: const Color(0xFF0A0A0A),
                        leading: _CircleBackButton(onPressed: () => Navigator.pop(context)),
                        actions: [
                          _CircleIconButton(
                            icon: Icons.refresh_rounded,
                            onPressed: _loadAll,
                          ),
                          PopupMenuButton<String>(
                            color: const Color(0xFF1E1E1E),
                            icon: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.more_vert, color: Colors.white, size: 20),
                            ),
                            onSelected: (val) {
                              if (val == 'edit') _showEditSheet();
                              if (val == 'delete') _confirmDelete();
                            },
                            itemBuilder: (_) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Row(children: [
                                  Icon(Icons.edit_outlined, color: Colors.white70, size: 18),
                                  SizedBox(width: 10),
                                  Text('Edit Team', style: TextStyle(color: Colors.white)),
                                ]),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Row(children: [
                                  Icon(Icons.delete_outline, color: Colors.redAccent, size: 18),
                                  SizedBox(width: 10),
                                  Text('Delete Team', style: TextStyle(color: Colors.redAccent)),
                                ]),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(_teamImage, fit: BoxFit.cover),
                              // Bottom gradient so text is readable
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black],
                                    stops: [0.4, 1.0],
                                  ),
                                ),
                              ),
                              // Team name + sport chip overlaid at bottom
                              Positioned(
                                bottom: 16,
                                left: 20,
                                right: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _team!.name,
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.white24),
                                      ),
                                      child: Text(
                                        _team!.sport,
                                        style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ───── BODY ─────
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ── Description ──
                              if (_team!.description?.isNotEmpty == true) ...[
                                Text(
                                  _team!.description!,
                                  style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 14, height: 1.5),
                                ),
                                const SizedBox(height: 20),
                              ],

                              // ── Stats Row ──
                              Row(
                                children: [
                                  _StatChip(
                                    icon: Icons.people_alt_rounded,
                                    label: 'Members',
                                    value: '${_members.length}',
                                  ),
                                  const SizedBox(width: 10),
                                  _StatChip(
                                    icon: Icons.event_rounded,
                                    label: 'Upcoming',
                                    value: '${_upcomingEvents.length}',
                                  ),
                                  const SizedBox(width: 10),
                                  _StatChip(
                                    icon: Icons.calendar_today_rounded,
                                    label: 'Created',
                                    value: DateFormat('MMM d, yyyy').format(_team!.createdAt.toLocal()),
                                    flex: 2,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              // ── Join Code ──
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF141414),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: const Color(0xFF2A2A2A)),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.08),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(Icons.vpn_key_rounded, color: Colors.white70, size: 18),
                                    ),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Join Code', style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 11, fontWeight: FontWeight.w500)),
                                          const SizedBox(height: 2),
                                          Text(
                                            _team!.joinCode,
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(ClipboardData(text: _team!.joinCode));
                                        _showSnack('Join code copied!');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.08),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Icon(Icons.copy_rounded, color: Colors.white70, size: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 28),

                              // ── Upcoming Events ──
                              _SectionHeader(title: 'Upcoming Events', count: _upcomingEvents.length),
                              const SizedBox(height: 12),
                              if (_loadingEvents)
                                const Center(child: Padding(padding: EdgeInsets.all(20), child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)))
                              else if (_upcomingEvents.isEmpty)
                                _EmptyCard(
                                  icon: Icons.event_busy_rounded,
                                  title: 'No upcoming events',
                                  subtitle: 'Events for this team will appear here.',
                                )
                              else
                                SizedBox(
                                  height: 110,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _upcomingEvents.length,
                                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                                    itemBuilder: (_, i) => _UpcomingEventCard(event: _upcomingEvents[i]),
                                  ),
                                ),

                              const SizedBox(height: 28),

                              // ── Members ──
                              Row(
                                children: [
                                  Expanded(child: _SectionHeader(title: 'Members', count: _members.length)),
                                  if (_canAddMembers)
                                    GestureDetector(
                                      onTap: _showAddMemberSheet,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.person_add_alt_1_rounded, color: Colors.black, size: 16),
                                            const SizedBox(width: 6),
                                            Text('Add', style: GoogleFonts.inter(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700)),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              if (_loadingMembers)
                                const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)))
                              else if (_members.isEmpty)
                                _EmptyCard(
                                  icon: Icons.group_off_rounded,
                                  title: 'No members yet',
                                  subtitle: 'Tap "Add" to invite someone.',
                                )
                              else
                                ..._sortedMembers.map((m) {
                                  final isCurrentUser = m.userId == AuthService.currentUser?.id;
                                  final canManage = !isCurrentUser && _canAddMembers;
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: _MemberTile(
                                      member: m,
                                      isCurrentUser: isCurrentUser,
                                      onTap: canManage ? () => _showRoleChangeSheet(m) : null,
                                    ),
                                  );
                                }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

// ─────────────────────────── Sub-widgets ───────────────────────────

class _CircleBackButton extends StatelessWidget {
  const _CircleBackButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.label, required this.value, this.flex = 1});
  final IconData icon;
  final String label;
  final String value;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF141414),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.grey.shade500, size: 18),
            const SizedBox(height: 8),
            Text(value, style: GoogleFonts.inter(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(label, style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.count});
  final String title;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
        if (count != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
            decoration: BoxDecoration(color: const Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(12)),
            child: Text('$count', style: GoogleFonts.inter(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ],
      ],
    );
  }
}

class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard({required this.event});
  final Event event;

  @override
  Widget build(BuildContext context) {
    final timeFmt = DateFormat('h:mm a');
    final dateFmt = DateFormat('MMM d');
    final timeStr = event.endTime != null
        ? '${timeFmt.format(event.startTime)} – ${timeFmt.format(event.endTime!)}'
        : timeFmt.format(event.startTime);

    return Container(
      width: 210,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              event.title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          // Time
          Row(
            children: [
              const Icon(Icons.access_time_rounded, size: 13, color: Color(0xFFFF5B5B)),
              const SizedBox(width: 5),
              Expanded(
                child: Text(timeStr, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(color: const Color(0xFFFF5B5B), fontSize: 11, fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Location
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 13, color: Colors.white54),
              const SizedBox(width: 5),
              Expanded(
                child: Text(event.location ?? 'TBD', overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 11)),
              ),
            ],
          ),
          const Spacer(),
          // Date
          Row(
            children: [
              const Icon(Icons.calendar_today_rounded, size: 12, color: Colors.white54),
              const SizedBox(width: 5),
              Text(dateFmt.format(event.startTime), style: GoogleFonts.inter(color: Colors.grey.shade500, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.grey.shade700),
          const SizedBox(height: 10),
          Text(title, style: GoogleFonts.inter(color: Colors.grey.shade400, fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(subtitle, style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({
    required this.member,
    this.isCurrentUser = false,
    this.onTap,
  });
  final TeamMember member;
  final bool isCurrentUser;
  final VoidCallback? onTap;

  static const _roleColors = <MemberRole, Color>{
    MemberRole.coach: Colors.amber,
    MemberRole.leader: Colors.deepPurpleAccent,
    MemberRole.parent: Colors.tealAccent,
    MemberRole.player: Colors.blueAccent,
  };

  @override
  Widget build(BuildContext context) {
    final initials = _initials(member.displayName);
    final avatarColor = _roleColors[member.roles.first] ?? Colors.blueAccent;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isCurrentUser ? const Color(0xFF1A1A1A) : const Color(0xFF111111),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCurrentUser ? Colors.white.withOpacity(0.12) : const Color(0xFF2A2A2A),
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [avatarColor.withOpacity(0.4), avatarColor.withOpacity(0.15)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(
                initials,
                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
            const SizedBox(width: 12),
            // Name + email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          member.displayName,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                      if (isCurrentUser) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('You', style: GoogleFonts.inter(color: Colors.white54, fontSize: 10, fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ],
                  ),
                  if (member.email != null)
                    Text(member.email!, style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 12)),
                ],
              ),
            ),
            // Role badges
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...member.roles.map((role) {
                  final color = _roleColors[role] ?? Colors.grey;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withOpacity(0.4)),
                    ),
                    child: Text(
                      role.name[0].toUpperCase() + role.name.substring(1),
                      style: GoogleFonts.inter(color: color, fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  );
                }),
                if (onTap != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.edit_outlined, size: 13, color: Colors.grey.shade600),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.red[300], size: 48),
            const SizedBox(height: 14),
            Text(message, style: GoogleFonts.inter(color: Colors.white, fontSize: 14), textAlign: TextAlign.center),
            const SizedBox(height: 18),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, color: Colors.white),
              label: Text('Retry', style: GoogleFonts.inter(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
