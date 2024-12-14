// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:campusify/data/models/regulation.dart';

class Program {
  String id;
  String name;
  List<String> specializations;
  List<int> years;
  List<Regulation> regulations;

  Program({
    required this.id,
    required this.name,
    required this.specializations,
    required this.years,
    required this.regulations,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'specializations': specializations,
      'years': years,
      'regulations': regulations.map((x) => x.toJson()).toList(),
    };
  }

  factory Program.fromJson(Map<String, dynamic> map) {
    return Program(
      id: map['_id'] as String,
      name: map['name'] as String,
      specializations: (map['specializations'] as List).map((e) => e as String).toList(),
      years: (map['years'] as List).map((e) => e as int).toList(),
      regulations: List<Regulation>.from(
        (map['regulations'] as List).map<Regulation>(
          (x) => Regulation.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
