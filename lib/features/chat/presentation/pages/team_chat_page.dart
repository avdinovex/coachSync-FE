import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../chat/data/chat_service.dart';
import '../../../chat/domain/models/message.dart';
import '../../../../core/services/auth_service.dart';

class TeamChatPage extends StatefulWidget {
  const TeamChatPage({
    super.key,
    required this.teamId,
    required this.teamName,
  });

  final String teamId;
  final String teamName;

  @override
  State<TeamChatPage> createState() => _TeamChatPageState();
}

class _TeamChatPageState extends State<TeamChatPage> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  List<ChatMessage> _messages = [];
  bool _isLoading = true;
  bool _isSending = false;
  String? _error;
  Timer? _pollTimer;

  String? get _currentUserId => AuthService.currentUser?.id;

  @override
  void initState() {
    super.initState();
    _loadMessages();
    _markAsRead();
    // Poll for new messages every 3 seconds
    _pollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      _refreshMessages();
      _markAsRead();
    });
  }

  Future<void> _markAsRead() async {
    try {
      await _chatService.markAsRead(teamId: widget.teamId);
    } catch (_) {}
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadMessages() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final messages = await _chatService.fetchMessages(
        teamId: widget.teamId,
        limit: 100,
      );
      if (mounted) {
        setState(() {
          _messages = messages;
          _isLoading = false;
        });
        _scrollToBottom();
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

  Future<void> _refreshMessages() async {
    try {
      final messages = await _chatService.fetchMessages(
        teamId: widget.teamId,
        limit: 100,
      );
      if (mounted && messages.length != _messages.length) {
        final wasAtBottom = _isAtBottom();
        setState(() {
          _messages = messages;
        });
        if (wasAtBottom) {
          _scrollToBottom();
        }
      }
    } catch (_) {
      // Silently ignore poll errors
    }
  }

  bool _isAtBottom() {
    if (!_scrollController.hasClients) return true;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return (maxScroll - currentScroll) < 80;
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty || _isSending) return;

    _messageController.clear();
    setState(() => _isSending = true);

    try {
      final sent = await _chatService.sendMessage(
        teamId: widget.teamId,
        content: content,
      );
      if (mounted) {
        setState(() {
          _messages.add(sent);
          _isSending = false;
        });
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send: $e'),
            backgroundColor: Colors.red[700],
          ),
        );
      }
    }
  }

  void _showMessageActions(ChatMessage msg) {
    final isMe = msg.userId == _currentUserId;
    // Don't show actions on already-deleted messages
    if (msg.isDeletedForEveryone) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A3A3A),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                if (isMe)
                  _buildActionTile(
                    icon: Icons.edit_rounded,
                    label: 'Edit',
                    color: const Color(0xFF2B7DE9),
                    onTap: () {
                      Navigator.pop(ctx);
                      _startEditMessage(msg);
                    },
                  ),
                _buildActionTile(
                  icon: Icons.delete_outline_rounded,
                  label: 'Delete for me',
                  color: Colors.grey.shade400,
                  onTap: () {
                    Navigator.pop(ctx);
                    _deleteForMe(msg);
                  },
                ),
                if (isMe)
                  _buildActionTile(
                    icon: Icons.delete_forever_rounded,
                    label: 'Delete for everyone',
                    color: const Color(0xFFE74C3C),
                    onTap: () {
                      Navigator.pop(ctx);
                      _deleteForEveryone(msg);
                    },
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionTile({required IconData icon, required String label, required Color color, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 14),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startEditMessage(ChatMessage msg) {
    final controller = TextEditingController(text: msg.content);
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: const Color(0xFF151515),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text('Edit Message', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
          content: TextField(
            controller: controller,
            autofocus: true,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Edit your message...',
              hintStyle: GoogleFonts.inter(color: Colors.grey.shade600),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF2B7DE9)),
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color(0xFF0D0D0D),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('Cancel', style: GoogleFonts.inter(color: Colors.grey.shade500)),
            ),
            TextButton(
              onPressed: () async {
                final newContent = controller.text.trim();
                if (newContent.isEmpty || newContent == msg.content) {
                  Navigator.pop(ctx);
                  return;
                }
                Navigator.pop(ctx);
                await _performEditMessage(msg, newContent);
              },
              child: Text('Save', style: GoogleFonts.inter(color: const Color(0xFF2B7DE9), fontWeight: FontWeight.w600)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _performEditMessage(ChatMessage msg, String newContent) async {
    try {
      final edited = await _chatService.editMessage(
        messageId: msg.id,
        content: newContent,
      );
      if (mounted) {
        setState(() {
          final idx = _messages.indexWhere((m) => m.id == msg.id);
          if (idx != -1) {
            _messages[idx].content = edited.content;
            _messages[idx].isEdited = true;
            _messages[idx].editedAt = edited.editedAt;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to edit: $e'),
            backgroundColor: Colors.red[700],
          ),
        );
      }
    }
  }

  Future<void> _deleteForMe(ChatMessage msg) async {
    try {
      await _chatService.deleteForMe(messageId: msg.id);
      if (mounted) {
        setState(() {
          _messages.removeWhere((m) => m.id == msg.id);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: $e'),
            backgroundColor: Colors.red[700],
          ),
        );
      }
    }
  }

  Future<void> _deleteForEveryone(ChatMessage msg) async {
    try {
      final deleted = await _chatService.deleteForEveryone(messageId: msg.id);
      if (mounted) {
        setState(() {
          final idx = _messages.indexWhere((m) => m.id == msg.id);
          if (idx != -1) {
            _messages[idx].content = deleted.content;
            _messages[idx].isDeletedForEveryone = true;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete: $e'),
            backgroundColor: Colors.red[700],
          ),
        );
      }
    }
  }

  /// Check if consecutive messages are from the same user to group them.
  bool _isSameSenderAsPrevious(int index) {
    if (index == 0) return false;
    return _messages[index].userId == _messages[index - 1].userId;
  }

  /// Check if we should show a date separator.
  bool _shouldShowDateSeparator(int index) {
    if (index == 0) return true;
    final current = _messages[index].createdAt;
    final previous = _messages[index - 1].createdAt;
    return current.year != previous.year ||
        current.month != previous.month ||
        current.day != previous.day;
  }

  String _formatDateSeparator(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final msgDay = DateTime(date.year, date.month, date.day);
    final diff = today.difference(msgDay).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff < 7) return DateFormat('EEEE').format(date);
    return DateFormat('MMM d, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0D0D0D),
            border: Border(bottom: BorderSide(color: Color(0xFF1E1E1E), width: 0.5)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Team avatar
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _teamColor,
                          _teamColor.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        widget.teamName.isNotEmpty ? widget.teamName[0].toUpperCase() : 'T',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Team info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.teamName,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Team Chat',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Refresh button
                  GestureDetector(
                    onTap: _loadMessages,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: Icon(Icons.refresh_rounded, color: Colors.grey.shade500, size: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Messages list
          Expanded(child: _buildMessageList()),
          // Input bar
          _buildInputBar(),
        ],
      ),
    );
  }

  Color get _teamColor {
    final hash = widget.teamName.codeUnits.fold<int>(0, (prev, c) => prev + c);
    const colors = [
      Color(0xFFE8732A),
      Color(0xFF2ECC71),
      Color(0xFF3498DB),
      Color(0xFF9B59B6),
      Color(0xFFE74C3C),
      Color(0xFF1ABC9C),
      Color(0xFFF39C12),
      Color(0xFF5C6BC0),
    ];
    return colors[hash % colors.length];
  }

  Widget _buildMessageList() {
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
                child: Icon(Icons.wifi_off_rounded, size: 36, color: Colors.red.shade300),
              ),
              const SizedBox(height: 16),
              Text(
                'Couldn\'t load messages',
                style: GoogleFonts.inter(color: Colors.grey.shade300, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Text(
                _error!,
                style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _loadMessages,
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

    if (_messages.isEmpty) {
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
              child: Icon(Icons.chat_bubble_outline_rounded, size: 44, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            Text(
              'No messages yet',
              style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 8),
            Text(
              'Be the first to send a message!',
              style: GoogleFonts.inter(fontSize: 13, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        final isMe = msg.userId == _currentUserId;
        final sameSender = _isSameSenderAsPrevious(index);
        final showDate = _shouldShowDateSeparator(index);

        return Column(
          children: [
            if (showDate) _buildDateSeparator(msg.createdAt),
            if (msg.isEventCreated)
              _buildEventCard(msg)
            else
              GestureDetector(
                onLongPress: () => _showMessageActions(msg),
                child: _buildMessageBubble(msg, isMe: isMe, showAvatar: !sameSender),
              ),
          ],
        );
      },
    );
  }

  Widget _buildDateSeparator(DateTime date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF252525)),
          ),
          child: Text(
            _formatDateSeparator(date),
            style: GoogleFonts.inter(
              fontSize: 11,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage msg,
      {required bool isMe, required bool showAvatar}) {
    final time = DateFormat('h:mm a').format(msg.createdAt.toLocal());
    final avatarColor = _colorForUserId(msg.userId);
    final isDeleted = msg.isDeletedForEveryone;

    return Padding(
      padding: EdgeInsets.only(
        top: showAvatar ? 12 : 3,
        bottom: 3,
        left: isMe ? 56 : 0,
        right: isMe ? 0 : 56,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) ...[
            if (showAvatar)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [avatarColor, avatarColor.withOpacity(0.6)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    msg.senderInitials,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(width: 32),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (showAvatar && !isMe)
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 4),
                    child: Text(
                      msg.senderDisplayName,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: avatarColor,
                      ),
                    ),
                  ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isDeleted
                        ? Colors.transparent
                        : (isMe ? const Color(0xFF1E6FD9) : const Color(0xFF1A1A1A)),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(18),
                      topRight: const Radius.circular(18),
                      bottomLeft: Radius.circular(isMe ? 18 : 4),
                      bottomRight: Radius.circular(isMe ? 4 : 18),
                    ),
                    border: isDeleted
                        ? Border.all(color: const Color(0xFF2A2A2A), width: 1)
                        : (isMe ? null : Border.all(color: const Color(0xFF252525), width: 0.5)),
                    boxShadow: isDeleted
                        ? null
                        : [
                            BoxShadow(
                              color: (isMe ? const Color(0xFF1E6FD9) : Colors.black).withOpacity(0.15),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                  ),
                  child: isDeleted
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.block_rounded, size: 14, color: Colors.grey.shade600),
                            const SizedBox(width: 6),
                            Text(
                              'This message was deleted',
                              style: GoogleFonts.inter(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              msg.content,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (msg.isEdited) ...[
                                  Text(
                                    'edited',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontStyle: FontStyle.italic,
                                      color: isMe
                                          ? Colors.white.withOpacity(0.45)
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                Text(
                                  time,
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    color: isMe
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Event card for event_created messages ─────────────────────────────

  Widget _buildEventCard(ChatMessage msg) {
    final meta = msg.metadata ?? {};
    final eventTitle = meta['eventTitle'] as String? ?? 'New Event';
    final eventType = meta['eventType'] as String? ?? 'event';
    final startTime = meta['startTime'] as String?;
    final location = meta['location'] as String?;

    // Format the start time
    String formattedTime = '';
    if (startTime != null) {
      try {
        final dt = DateTime.parse(startTime).toLocal();
        formattedTime = DateFormat('EEE, MMM d · h:mm a').format(dt);
      } catch (_) {
        formattedTime = startTime;
      }
    }

    // Event type icon and color
    IconData typeIcon;
    Color typeColor;
    switch (eventType) {
      case 'game':
        typeIcon = Icons.emoji_events_outlined;
        typeColor = const Color(0xFF4CAF50);
        break;
      case 'practice':
        typeIcon = Icons.fitness_center_outlined;
        typeColor = const Color(0xFF2196F3);
        break;
      case 'meeting':
        typeIcon = Icons.groups_outlined;
        typeColor = const Color(0xFFFF9800);
        break;
      default:
        typeIcon = Icons.event_outlined;
        typeColor = const Color(0xFF9C27B0);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              typeColor.withOpacity(0.15),
              typeColor.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: typeColor.withOpacity(0.3), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(typeIcon, color: typeColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${eventType[0].toUpperCase()}${eventType.substring(1)} Created',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: typeColor,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          eventTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Details
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (formattedTime.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(Icons.access_time,
                              size: 14, color: Colors.grey[400]),
                          const SizedBox(width: 6),
                          Text(
                            formattedTime,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (location != null && location.isNotEmpty)
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 14, color: Colors.grey[400]),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[300],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            // CTA button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: OutlinedButton.icon(
                onPressed: () => _navigateToEvent(meta['eventId'] as String?),
                icon: const Icon(Icons.open_in_new, size: 16),
                label: const Text('View Event'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: typeColor,
                  side: BorderSide(color: typeColor.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                ),
              ),
            ),
            // Sender + time footer
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: Text(
                '${msg.senderDisplayName} · ${DateFormat('h:mm a').format(msg.createdAt.toLocal())}',
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToEvent(String? eventId) {
    if (eventId == null) return;
    // Pop back to MessagePage, passing the eventId as a result
    Navigator.of(context).pop({'navigateToEvent': eventId});
  }

  Widget _buildInputBar() {
    return Container(
      padding: EdgeInsets.only(
        left: 14,
        right: 10,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
        border: Border(top: BorderSide(color: Color(0xFF1E1E1E), width: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF151515),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: TextField(
                controller: _messageController,
                focusNode: _focusNode,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
                maxLines: 4,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _isSending ? null : _sendMessage,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: _isSending
                    ? null
                    : const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF2B7DE9), Color(0xFF1E6FD9)],
                      ),
                color: _isSending ? const Color(0xFF2A2A2A) : null,
                borderRadius: BorderRadius.circular(14),
                boxShadow: _isSending
                    ? null
                    : [
                        BoxShadow(
                          color: const Color(0xFF1E6FD9).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
              ),
              child: _isSending
                  ? const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  /// Generate a consistent color from a user ID for their avatar/name.
  Color _colorForUserId(String userId) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.amber,
      Colors.cyan,
      Colors.deepOrange,
    ];
    final hash = userId.codeUnits.fold<int>(0, (prev, c) => prev + c);
    return colors[hash % colors.length];
  }
}
