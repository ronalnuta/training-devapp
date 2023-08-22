// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SemesterStudentModel {
  final String? id;
  final String? tenDot;

  SemesterStudentModel({
    this.id,
    this.tenDot,
  });

  SemesterStudentModel copyWith({
    String? id,
    String? tenDot,
  }) {
    return SemesterStudentModel(
      id: id ?? this.id,
      tenDot: tenDot ?? this.tenDot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'TenDot': tenDot,
    };
  }

  factory SemesterStudentModel.fromMap(Map<String, dynamic> map) {
    return SemesterStudentModel(
      id: map['Id'] != null ? map['Id'] as String : null,
      tenDot: map['TenDot'] != null ? map['TenDot'] as String : null,
    );
  }

  factory SemesterStudentModel.fromJson(String source) =>
      SemesterStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SemesterStudentModel(id: $id, tenDot: $tenDot)';

  @override
  bool operator ==(covariant SemesterStudentModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.tenDot == tenDot;
  }

  @override
  int get hashCode => id.hashCode ^ tenDot.hashCode;

  String toJson() => json.encode(toMap());
}
