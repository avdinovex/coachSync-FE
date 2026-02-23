import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/constants/environment.dart';
import '../../../core/services/auth_service.dart';
import '../domain/models/event.dart';

/// Base REST API URL derived from the GraphQL endpoint.
String get _baseUrl => kGraphqlEndpoint.replaceFirst('/graphql', '');

class EventException implements Exception {
  const EventException(this.message);
  final String message;

  @override
  String toString() => 'EventException: $message';
}

class EventService {
  // ─────────────────────────── Auth helpers ────────────────────────────

  Future<Map<String, String>> _authHeaders() async {
    final token = await AuthService.getStoredToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  void _throwIfError(http.Response response, String context) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      String msg;
      try {
        final body = jsonDecode(response.body) as Map<String, dynamic>;
        msg = (body['message'] as Object?)?.toString() ??
            response.reasonPhrase ??
            'Unknown error';
      } catch (_) {
        msg = response.reasonPhrase ?? 'Unknown error';
      }
      throw EventException('$context failed (${response.statusCode}): $msg');
    }
  }

  // ─────────────────────── POST /events ─────────────────────────────

  /// Create a new event for [teamId].
  Future<Event> createEvent({
    required String teamId,
    required String title,
    required EventType eventType,
    required DateTime startTime,
    String? description,
    String? location,
    DateTime? endTime,
  }) async {
    print('🔵 [EventService] createEvent: team=$teamId title=$title');
    final body = <String, dynamic>{
      'teamId': teamId,
      'title': title,
      'eventType': eventType.apiValue,
      'startTime': startTime.toIso8601String(),
      if (description != null && description.isNotEmpty)
        'description': description,
      if (location != null && location.isNotEmpty) 'location': location,
      if (endTime != null) 'endTime': endTime.toIso8601String(),
    };
    final response = await http.post(
      Uri.parse('$_baseUrl/events'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'createEvent');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] createEvent success: ${json['id']}');
    return Event.fromJson(json);
  }

  // ─────────────────────── GET /events ─────────────────────────────

  /// Fetch all events, optionally filtered by [teamId].
  Future<List<Event>> getEvents({String? teamId}) async {
    print('🔵 [EventService] getEvents: teamId=$teamId');
    final uri = Uri.parse('$_baseUrl/events').replace(
      queryParameters: {if (teamId != null) 'teamId': teamId},
    );
    final response = await http.get(uri, headers: await _authHeaders());
    _throwIfError(response, 'getEvents');
    final list = jsonDecode(response.body) as List<dynamic>;
    print('🟢 [EventService] getEvents: ${list.length} events');
    return list
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ─────────────────────── GET /events/upcoming ────────────────────

  /// Fetch upcoming events, optionally filtered by [teamId].
  Future<List<Event>> getUpcomingEvents({String? teamId}) async {
    print('🔵 [EventService] getUpcomingEvents: teamId=$teamId');
    final uri = Uri.parse('$_baseUrl/events/upcoming').replace(
      queryParameters: {if (teamId != null) 'teamId': teamId},
    );
    final response = await http.get(uri, headers: await _authHeaders());
    _throwIfError(response, 'getUpcomingEvents');
    final list = jsonDecode(response.body) as List<dynamic>;
    print('🟢 [EventService] getUpcomingEvents: ${list.length} events');
    return list
        .map((e) => Event.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ─────────────────────── GET /events/{id} ────────────────────────

  Future<Event> getEventById(String id) async {
    print('🔵 [EventService] getEventById: $id');
    final response = await http.get(
      Uri.parse('$_baseUrl/events/$id'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'getEventById');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] getEventById success');
    return Event.fromJson(json);
  }

  // ─────────────────────── PATCH /events/{id} ──────────────────────

  Future<Event> updateEvent(
    String id, {
    String? title,
    String? description,
    EventType? eventType,
    String? location,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    print('🔵 [EventService] updateEvent: $id');
    final body = <String, dynamic>{
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (eventType != null) 'eventType': eventType.apiValue,
      if (location != null) 'location': location,
      if (startTime != null) 'startTime': startTime.toIso8601String(),
      if (endTime != null) 'endTime': endTime.toIso8601String(),
    };
    final response = await http.patch(
      Uri.parse('$_baseUrl/events/$id'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'updateEvent');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] updateEvent success');
    return Event.fromJson(json);
  }

  // ─────────────────────── DELETE /events/{id} ─────────────────────

  Future<bool> deleteEvent(String id) async {
    print('🔵 [EventService] deleteEvent: $id');
    final response = await http.delete(
      Uri.parse('$_baseUrl/events/$id'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'deleteEvent');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] deleteEvent success');
    return json['deleted'] == true;
  }

  // ─────────────────────── GET /events/{id}/rsvps ──────────────────

  Future<List<EventRsvp>> getEventRsvps(String eventId) async {
    print('🔵 [EventService] getEventRsvps: $eventId');
    final response = await http.get(
      Uri.parse('$_baseUrl/events/$eventId/rsvps'),
      headers: await _authHeaders(),
    );
    _throwIfError(response, 'getEventRsvps');
    final list = jsonDecode(response.body) as List<dynamic>;
    print('🟢 [EventService] getEventRsvps: ${list.length} rsvps');
    return list
        .map((e) => EventRsvp.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ─────────────────────── POST /events/rsvp ───────────────────────

  /// Create a new RSVP for the current user (or [userId] if provided).
  Future<EventRsvp> createRsvp({
    required String eventId,
    required RsvpStatus status,
    String? userId,
  }) async {
    print(
        '🔵 [EventService] createRsvp: event=$eventId status=${status.apiValue}');
    final body = <String, dynamic>{
      'eventId': eventId,
      'status': status.apiValue,
      if (userId != null) 'userId': userId,
    };
    final response = await http.post(
      Uri.parse('$_baseUrl/events/rsvp'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'createRsvp');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] createRsvp success');
    return EventRsvp.fromJson(json);
  }

  // ─────────────────────── PATCH /events/rsvp ──────────────────────

  /// Update an existing RSVP for the current user (or [userId] if provided).
  Future<EventRsvp> updateRsvp({
    required String eventId,
    required RsvpStatus status,
    String? userId,
  }) async {
    print(
        '🔵 [EventService] updateRsvp: event=$eventId status=${status.apiValue}');
    final body = <String, dynamic>{
      'eventId': eventId,
      'status': status.apiValue,
      if (userId != null) 'userId': userId,
    };
    final response = await http.patch(
      Uri.parse('$_baseUrl/events/rsvp'),
      headers: await _authHeaders(),
      body: jsonEncode(body),
    );
    _throwIfError(response, 'updateRsvp');
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    print('🟢 [EventService] updateRsvp success');
    return EventRsvp.fromJson(json);
  }

  /// Convenience: upsert RSVP — tries update first, falls back to create.
  Future<EventRsvp> upsertRsvp({
    required String eventId,
    required RsvpStatus status,
    String? userId,
  }) async {
    try {
      return await updateRsvp(eventId: eventId, status: status, userId: userId);
    } catch (_) {
      return createRsvp(eventId: eventId, status: status, userId: userId);
    }
  }
}
