import 'package:campusify/data/models/details.dart';
import 'package:campusify/data/models/program.dart';

class College {
  String id;
  String collegeName;
  String regulatoryBody;
  String domain;
  Details details;
  List<Program> programs;
  College({
    required this.id,
    required this.collegeName,
    required this.regulatoryBody,
    required this.domain,
    required this.details,
    required this.programs,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'collegeName': collegeName,
      'regulatoryBody': regulatoryBody,
      'domain': domain,
      'details': details.toJson(),
      'programs': programs.map((x) => x.toJson()).toList(),
    };
  }

  factory College.fromJson(Map<String, dynamic> map) {
    return College(
      id: map['_id'] as String,
      collegeName: map['collegeName'] as String,
      regulatoryBody: map['regulatoryBody'] as String,
      domain: map['domain'] as String,
      details: Details.fromJson(map['details'] as Map<String, dynamic>),
      programs: List<Program>.from(
        (map['programs'] as List).map<Program>(
          (x) => Program.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
