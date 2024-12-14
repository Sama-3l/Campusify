class Regulation {
  String id;
  String type;
  String regulation;
  List<int> validYears;

  Regulation({
    required this.id,
    required this.type,
    required this.regulation,
    required this.validYears,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'regulation': regulation,
      'validYears': validYears,
    };
  }

  factory Regulation.fromJson(Map<String, dynamic> map) {
    return Regulation(
      id: map['_id'] as String,
      type: map['type'] as String,
      regulation: map['regulation'] as String,
      validYears: (map['validYears'] as List).map((e) => e as int).toList(),
    );
  }
}
