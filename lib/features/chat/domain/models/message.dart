import '../../../../graphql/operations/chat.graphql.dart';

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.teamId,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.messageType = 'text',
    this.metadata,
    this.isEdited = false,
    this.isDeletedForEveryone = false,
    this.editedAt,
    this.senderFirstName,
    this.senderLastName,
    this.senderEmail,
  });

  final String id;
  final String teamId;
  final String userId;
  String content;
  final DateTime createdAt;
  final String messageType;
  final Map<String, dynamic>? metadata;
  bool isEdited;
  bool isDeletedForEveryone;
  DateTime? editedAt;
  final String? senderFirstName;
  final String? senderLastName;
  final String? senderEmail;

  /// Whether this is an event-created system message.
  bool get isEventCreated => messageType == 'event_created';

  /// Display name: "First Last", falls back to email, then userId.
  String get senderDisplayName {
    final name = [senderFirstName, senderLastName]
        .where((s) => s != null && s.isNotEmpty)
        .join(' ');
    return name.isNotEmpty ? name : (senderEmail ?? userId);
  }

  /// Initials for the avatar (e.g. "JD" for "John Doe").
  String get senderInitials {
    final first = (senderFirstName ?? '').isNotEmpty ? senderFirstName![0] : '';
    final last = (senderLastName ?? '').isNotEmpty ? senderLastName![0] : '';
    if (first.isNotEmpty || last.isNotEmpty) return '$first$last'.toUpperCase();
    if (senderEmail != null && senderEmail!.isNotEmpty) {
      return senderEmail![0].toUpperCase();
    }
    return '?';
  }

  factory ChatMessage.fromQuery(Query$GetMessages$messages msg) => ChatMessage(
        id: msg.id,
        teamId: msg.teamId,
        userId: msg.userId,
        content: msg.content,
        createdAt: msg.createdAt,
        messageType: msg.messageType,
        metadata: msg.metadata,
        isEdited: msg.isEdited,
        isDeletedForEveryone: msg.isDeletedForEveryone,
        editedAt: msg.editedAt,
        senderFirstName: msg.user?.firstName,
        senderLastName: msg.user?.lastName,
        senderEmail: msg.user?.email,
      );

  factory ChatMessage.fromMutation(
          Mutation$SendMessage$sendMessage msg) =>
      ChatMessage(
        id: msg.id,
        teamId: msg.teamId,
        userId: msg.userId,
        content: msg.content,
        createdAt: msg.createdAt,
        messageType: msg.messageType,
        metadata: msg.metadata,
        isEdited: msg.isEdited,
        isDeletedForEveryone: msg.isDeletedForEveryone,
        editedAt: msg.editedAt,
        senderFirstName: msg.user?.firstName,
        senderLastName: msg.user?.lastName,
        senderEmail: msg.user?.email,
      );

  factory ChatMessage.fromEditMutation(
          Mutation$EditMessage$editMessage msg) =>
      ChatMessage(
        id: msg.id,
        teamId: msg.teamId,
        userId: msg.userId,
        content: msg.content,
        createdAt: msg.createdAt,
        messageType: msg.messageType,
        metadata: msg.metadata,
        isEdited: msg.isEdited,
        isDeletedForEveryone: msg.isDeletedForEveryone,
        editedAt: msg.editedAt,
      );

  factory ChatMessage.fromDeleteMutation(
          Mutation$DeleteMessageForEveryone$deleteMessageForEveryone msg) =>
      ChatMessage(
        id: msg.id,
        teamId: msg.teamId,
        userId: msg.userId,
        content: msg.content,
        createdAt: msg.createdAt,
        messageType: msg.messageType,
        metadata: msg.metadata,
        isEdited: msg.isEdited,
        isDeletedForEveryone: msg.isDeletedForEveryone,
        editedAt: msg.editedAt,
      );
}
