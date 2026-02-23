enum EventType { game, practice, meeting }

enum RsvpStatus { coming, not_coming, tbd }

extension EventTypeLabel on EventType {
  String get label {
    switch (this) {
      case EventType.game:
        return 'Game';
      case EventType.practice:
        return 'Practice';
      case EventType.meeting:
        return 'Meeting';
    }
  }

  String get apiValue {
    switch (this) {
      case EventType.game:
        return 'game';
      case EventType.practice:
        return 'practice';
      case EventType.meeting:
        return 'meeting';
    }
  }
}

extension RsvpStatusLabel on RsvpStatus {
  String get label {
    switch (this) {
      case RsvpStatus.coming:
        return 'Coming';
      case RsvpStatus.not_coming:
        return 'Not Coming';
      case RsvpStatus.tbd:
        return 'TBD';
    }
  }

  String get apiValue {
    switch (this) {
      case RsvpStatus.coming:
        return 'coming';
      case RsvpStatus.not_coming:
        return 'not_coming';
      case RsvpStatus.tbd:
        return 'tbd';
    }
  }
}

class EventRsvp {
  const EventRsvp({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.respondedAt,
    this.firstName,
    this.lastName,
    this.email,
  });

  final String id;
  final String eventId;
  final String userId;
  final RsvpStatus status;
  final DateTime? respondedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? firstName;
  final String? lastName;
  final String? email;

  String get displayName {
    final n = [firstName, lastName]
        .where((s) => s != null && s.isNotEmpty)
        .join(' ');
    return n.isNotEmpty ? n : email ?? userId;
  }

  factory EventRsvp.fromJson(Map<String, dynamic> json) {
    final statusStr = json['status'] as String? ?? 'tbd';
    final RsvpStatus status;
    switch (statusStr) {
      case 'coming':
        status = RsvpStatus.coming;
        break;
      case 'not_coming':
        status = RsvpStatus.not_coming;
        break;
      default:
        status = RsvpStatus.tbd;
    }
    final user = json['user'] as Map<String, dynamic>?;
    return EventRsvp(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      userId: json['userId'] as String,
      status: status,
      respondedAt: json['respondedAt'] != null
          ? DateTime.parse(json['respondedAt'] as String)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      firstName: user?['firstName'] as String?,
      lastName: user?['lastName'] as String?,
      email: user?['email'] as String?,
    );
  }
}

class Event {
  const Event({
    required this.id,
    required this.teamId,
    required this.title,
    required this.eventType,
    required this.startTime,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.location,
    this.endTime,
    this.rsvps,
  });

  final String id;
  final String teamId;
  final String title;
  final String? description;
  final EventType eventType;
  final String? location;
  final DateTime startTime;
  final DateTime? endTime;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<EventRsvp>? rsvps;

  bool get isUpcoming => startTime.isAfter(DateTime.now());

  int get comingCount =>
      rsvps?.where((r) => r.status == RsvpStatus.coming).length ?? 0;
  int get notComingCount =>
      rsvps?.where((r) => r.status == RsvpStatus.not_coming).length ?? 0;
  int get tbdCount =>
      rsvps?.where((r) => r.status == RsvpStatus.tbd).length ?? 0;

  factory Event.fromJson(Map<String, dynamic> json) {
    final typeStr = json['eventType'] as String? ?? 'practice';
    final EventType eventType;
    switch (typeStr) {
      case 'game':
        eventType = EventType.game;
        break;
      case 'meeting':
        eventType = EventType.meeting;
        break;
      default:
        eventType = EventType.practice;
    }

    final rsvpList = (json['rsvps'] as List<dynamic>?)
        ?.map((e) => EventRsvp.fromJson(e as Map<String, dynamic>))
        .toList();

    return Event(
      id: json['id'] as String,
      teamId: json['teamId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      eventType: eventType,
      location: json['location'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] != null
          ? DateTime.parse(json['endTime'] as String)
          : null,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      rsvps: rsvpList,
    );
  }
}
