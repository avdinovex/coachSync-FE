import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/services/auth_service.dart';
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

  Team? _team;
  List<TeamMember> _members = [];
  bool _loadingTeam = true;
  bool _loadingMembers = true;
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
    await Future.wait([_loadTeam(), _loadMembers()]);
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          widget.teamName,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _loadAll,
          ),
          PopupMenuButton<String>(
            color: Colors.grey[900],
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (val) {
              if (val == 'edit') _showEditSheet();
              if (val == 'delete') _confirmDelete();
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: 'edit',
                child: Row(children: [
                  Icon(Icons.edit, color: Colors.white70, size: 18),
                  SizedBox(width: 8),
                  Text('Edit Team', style: TextStyle(color: Colors.white)),
                ]),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(children: [
                  Icon(Icons.delete_outline, color: Colors.redAccent, size: 18),
                  SizedBox(width: 8),
                  Text('Delete Team',
                      style: TextStyle(color: Colors.redAccent)),
                ]),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: _canAddMembers
          ? FloatingActionButton.extended(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Add Member',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: _showAddMemberSheet,
            )
          : null,
      body: _loadingTeam
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _ErrorState(message: _error!, onRetry: _loadAll)
              : RefreshIndicator(
                  onRefresh: _loadAll,
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
                    children: [
                      _TeamInfoCard(
                        team: _team!,
                        memberCount: _members.length,
                        isExpanded: _infoExpanded,
                        onToggle: () =>
                            setState(() => _infoExpanded = !_infoExpanded),
                      ),
                      const SizedBox(height: 24),
                      _MembersSectionHeader(
                        count: _members.length,
                        loading: _loadingMembers,
                      ),
                      const SizedBox(height: 12),
                      if (_loadingMembers)
                        const Center(
                            child: Padding(
                          padding: EdgeInsets.all(24),
                          child: CircularProgressIndicator(),
                        ))
                      else if (_members.isEmpty)
                        _EmptyMembers()
                      else
                        ..._sortedMembers
                            .map((m) {
                              final isCurrentUser =
                                  m.userId == AuthService.currentUser?.id;
                              // Can manage if current user is leader or coach,
                              // but not managing themselves
                              final canManage =
                                  !isCurrentUser && _canAddMembers;
                              return _MemberTile(
                                member: m,
                                isCurrentUser: isCurrentUser,
                                onTap: canManage
                                    ? () => _showRoleChangeSheet(m)
                                    : null,
                              );
                            })
                            .toList(),
                    ],
                  ),
                ),
    );
  }
}

// ─────────────────────────── Sub-widgets ───────────────────────────

class _TeamInfoCard extends StatelessWidget {
  const _TeamInfoCard({
    required this.team,
    required this.memberCount,
    required this.isExpanded,
    required this.onToggle,
  });
  final Team team;
  final int memberCount;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header (always visible, tap to collapse) ──
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.vertical(
              top: const Radius.circular(16),
              bottom: isExpanded ? Radius.zero : const Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child:
                        const Icon(Icons.sports, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          team.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            team.sport,
                            style:
                                TextStyle(color: Colors.grey[300], fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.expand_less,
                        color: Colors.grey[500], size: 22),
                  ),
                ],
              ),
            ),
          ),
          // ── Collapsible body ──
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          if (team.description?.isNotEmpty == true) ...[
            const SizedBox(height: 14),
            Text(
              team.description!,
              style: const TextStyle(color: Colors.white70, height: 1.4),
            ),
          ],
          const SizedBox(height: 16),
          const Divider(color: Colors.white12),
          const SizedBox(height: 12),
          _InfoRow(
            icon: Icons.vpn_key,
            label: 'Join Code',
            value: team.joinCode,
            copyable: true,
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.people_outline,
            label: 'Members',
            value: '$memberCount',
          ),
          const SizedBox(height: 8),
          _InfoRow(
            icon: Icons.calendar_today,
            label: 'Created',
            value: _formatDate(team.createdAt),
          ),
                ],
              ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final d = date.toLocal();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.copyable = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool copyable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[500]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(color: Colors.grey[500], fontSize: 13),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'Courier',
            ),
          ),
        ),
        if (copyable)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Join code copied!'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Icon(Icons.copy, size: 16, color: Colors.grey[500]),
          ),
      ],
    );
  }
}

class _MembersSectionHeader extends StatelessWidget {
  const _MembersSectionHeader({required this.count, required this.loading});
  final int count;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Members',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        if (!loading)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
      ],
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

  static const _roleColors = {
    MemberRole.coach: Colors.amber,
    MemberRole.leader: Colors.deepPurpleAccent,
    MemberRole.parent: Colors.tealAccent,
    MemberRole.player: Colors.blueAccent,
  };

  @override
  Widget build(BuildContext context) {
    final initials = _initials(member.displayName);
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.grey[850] : Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCurrentUser
              ? Colors.white.withOpacity(0.15)
              : onTap != null
                  ? Colors.white.withOpacity(0.12)
                  : Colors.grey[800]!,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[800],
            child: Text(
              initials,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.displayName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
                if (member.email != null)
                  Text(
                    member.email!,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                const SizedBox(height: 4),
                Text(
                  'Joined ${_formatDate(member.joinedAt)}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 11),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...member.roles.map((role) {
                final color = _roleColors[role] ?? Colors.grey;
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: color.withOpacity(0.5)),
                  ),
                  child: Text(
                    role.name[0].toUpperCase() + role.name.substring(1),
                    style: TextStyle(
                        color: color,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                );
              }),
              if (onTap != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(Icons.edit,
                      size: 13, color: Colors.grey[600]),
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
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }

  String _formatDate(DateTime date) {
    final d = date.toLocal();
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[d.month - 1]} ${d.day}';
  }
}

class _EmptyMembers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        children: [
          Icon(Icons.group_off, size: 48, color: Colors.grey[700]),
          const SizedBox(height: 12),
          const Text(
            'No members yet',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Text(
            'Tap "Add Member" to invite someone.',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
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
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
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
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label:
                  const Text('Retry', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
