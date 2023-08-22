// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SemesterTeacherModel {
  final String? id;
  final String? tenDot;
  SemesterTeacherModel({
    this.id,
    this.tenDot,
  });

  SemesterTeacherModel copyWith({
    String? id,
    String? tenDot,
  }) {
    return SemesterTeacherModel(
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

  factory SemesterTeacherModel.fromMap(Map<String, dynamic> map) {
    return SemesterTeacherModel(
      id: map['Id'] != null ? map['Id'] as String : null,
      tenDot: map['TenDot'] != null ? map['TenDot'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SemesterTeacherModel.fromJson(String source) =>
      SemesterTeacherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SemesterTeacherModel(id: $id, tenDot: $tenDot)';

  @override
  bool operator ==(covariant SemesterTeacherModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.tenDot == tenDot;
  }

  @override
  int get hashCode => id.hashCode ^ tenDot.hashCode;
}
