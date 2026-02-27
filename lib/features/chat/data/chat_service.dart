import 'package:graphql/client.dart' as graphql;

import '../../../core/services/graphql_client_factory.dart';
import '../../../graphql/operations/chat.graphql.dart';
import '../../../graphql/schema.graphql.dart';
import '../domain/models/message.dart';

class ChatService {
  ChatService({graphql.GraphQLClient? client})
      : _client = client ?? GraphQLClientFactory.authenticatedClient;

  final graphql.GraphQLClient _client;

  /// Fetch messages for a team (most recent first, reversed to chronological).
  Future<List<ChatMessage>> fetchMessages({
    required String teamId,
    int? limit,
  }) async {
    final result = await _client.query$GetMessages(
      Options$Query$GetMessages(
        variables: Variables$Query$GetMessages(teamId: teamId, limit: limit),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) {
      throw ChatException('No data returned for messages');
    }

    return data.messages.map(ChatMessage.fromQuery).toList();
  }

  /// Send a message to a team chat.
  Future<ChatMessage> sendMessage({
    required String teamId,
    required String content,
  }) async {
    final result = await _client.mutate$SendMessage(
      Options$Mutation$SendMessage(
        variables: Variables$Mutation$SendMessage(
          input: Input$SendMessageInput(
            teamId: teamId,
            content: content,
          ),
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }

    final msg = result.parsedData?.sendMessage;
    if (msg == null) {
      throw ChatException('Send message returned empty payload');
    }

    return ChatMessage.fromMutation(msg);
  }

  /// Edit a message.
  Future<ChatMessage> editMessage({
    required String messageId,
    required String content,
  }) async {
    final result = await _client.mutate$EditMessage(
      Options$Mutation$EditMessage(
        variables: Variables$Mutation$EditMessage(
          input: Input$EditMessageInput(
            messageId: messageId,
            content: content,
          ),
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }

    final msg = result.parsedData?.editMessage;
    if (msg == null) {
      throw ChatException('Edit message returned empty payload');
    }

    return ChatMessage.fromEditMutation(msg);
  }

  /// Delete a message for everyone (only for own messages).
  Future<ChatMessage> deleteForEveryone({required String messageId}) async {
    final result = await _client.mutate$DeleteMessageForEveryone(
      Options$Mutation$DeleteMessageForEveryone(
        variables: Variables$Mutation$DeleteMessageForEveryone(
          messageId: messageId,
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }

    final msg = result.parsedData?.deleteMessageForEveryone;
    if (msg == null) {
      throw ChatException('Delete message returned empty payload');
    }

    return ChatMessage.fromDeleteMutation(msg);
  }

  /// Delete a message only for me.
  Future<void> deleteForMe({required String messageId}) async {
    final result = await _client.mutate$DeleteMessageForMe(
      Options$Mutation$DeleteMessageForMe(
        variables: Variables$Mutation$DeleteMessageForMe(
          messageId: messageId,
        ),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }
  }

  /// Fetch unread message counts for all teams the user belongs to.
  /// Returns a map of teamId -> {count, lastMessage}.
  Future<Map<String, UnreadInfo>> fetchUnreadCounts() async {
    final result = await _client.query$GetUnreadCounts(
      Options$Query$GetUnreadCounts(
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      throw ChatException(_formatException(result.exception));
    }

    final data = result.parsedData;
    if (data == null) return {};

    final map = <String, UnreadInfo>{};
    for (final uc in data.unreadCounts) {
      final lastMsg = uc.lastMessage;
      map[uc.teamId] = UnreadInfo(
        count: uc.count,
        lastMessageContent: lastMsg?.content,
        lastMessageType: lastMsg?.messageType,
        lastMessageTime: lastMsg?.createdAt,
        lastMessageSenderId: lastMsg?.userId,
        lastMessageSenderFirstName: lastMsg?.user?.firstName,
        lastMessageSenderLastName: lastMsg?.user?.lastName,
      );
    }
    return map;
  }

  /// Mark all messages in a team as read for the current user.
  Future<void> markAsRead({required String teamId}) async {
    final result = await _client.mutate$MarkMessagesAsRead(
      Options$Mutation$MarkMessagesAsRead(
        variables: Variables$Mutation$MarkMessagesAsRead(teamId: teamId),
        fetchPolicy: graphql.FetchPolicy.noCache,
      ),
    );

    if (result.hasException) {
      // Silently ignore mark-as-read errors — not critical
    }
  }

  String _formatException(graphql.OperationException? exception) {
    if (exception == null) return 'Unknown error occurred';
    if (exception.graphqlErrors.isNotEmpty) {
      return exception.graphqlErrors.first.message;
    }
    if (exception.linkException != null) {
      final linkEx = exception.linkException;
      if (linkEx.toString().contains('TimeoutException')) {
        return 'Connection timeout. Please check your internet and try again.';
      }
      if (linkEx.toString().contains('SocketException')) {
        return 'Cannot connect to server. Please check your connection.';
      }
      return linkEx?.originalException?.toString() ?? 'Network error occurred';
    }
    return 'Unknown error occurred';
  }
}

class ChatException implements Exception {
  ChatException(this.message);
  final String message;
  @override
  String toString() => 'ChatException: $message';
}

/// Holds unread info for a single team.
class UnreadInfo {
  const UnreadInfo({
    required this.count,
    this.lastMessageContent,
    this.lastMessageType,
    this.lastMessageTime,
    this.lastMessageSenderId,
    this.lastMessageSenderFirstName,
    this.lastMessageSenderLastName,
  });

  final int count;
  final String? lastMessageContent;
  final String? lastMessageType;
  final DateTime? lastMessageTime;
  final String? lastMessageSenderId;
  final String? lastMessageSenderFirstName;
  final String? lastMessageSenderLastName;

  /// Returns "You: msg" for own messages, "Name: msg" for others.
  /// Event messages show as "📅 Event: Title".
  String lastMessagePreview(String? currentUserId) {
    if (lastMessageContent == null) return '';
    // Event-created messages get a special preview
    if (lastMessageType == 'event_created') {
      return '📅 $lastMessageContent';
    }
    if (lastMessageSenderId != null && lastMessageSenderId == currentUserId) {
      return 'You: $lastMessageContent';
    }
    final sender = [lastMessageSenderFirstName, lastMessageSenderLastName]
        .where((s) => s != null && s.isNotEmpty)
        .join(' ');
    if (sender.isNotEmpty) return '$sender: $lastMessageContent';
    return lastMessageContent!;
  }
}
