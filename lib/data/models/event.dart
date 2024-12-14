class Event {
  String id;
  String title;
  String collegeName;
  String modeOfEvent;
  String thumbnail;
  String eventSpeaker;
  DateTime dateTime;
  Map<String, String> address;

  Event({
    required this.id,
    required this.title,
    required this.collegeName,
    required this.modeOfEvent,
    required this.thumbnail,
    required this.eventSpeaker,
    required this.dateTime,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'collegeName': collegeName,
      'modeOfEvent': modeOfEvent,
      'thumbnail': thumbnail,
      'eventSpeaker': eventSpeaker,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'address': address,
    };
  }

  factory Event.fromJson(Map<String, dynamic> map) {
    return Event(
      id: map['_id'] as String,
      title: map['title'] as String,
      collegeName: map['collegeName'] as String,
      modeOfEvent: map['modeOfEvent'] as String,
      thumbnail: map['thumbnail'] as String,
      eventSpeaker: map['eventSpeaker'] as String,
      dateTime: DateTime.parse('${map['time']['startDate'].substring(0, 10)}T${map['time']['startTime']}'),
      address: Map<String, String>.from(map['address'] as Map),
    );
  }
}
