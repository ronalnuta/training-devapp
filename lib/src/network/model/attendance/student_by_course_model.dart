// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentByCourseModel {
  final String? studentCode;
  final String? firstName;
  final String? lastName;
  StudentByCourseModel({
    this.studentCode,
    this.firstName,
    this.lastName,
  });

  StudentByCourseModel copyWith({
    String? studentCode,
    String? firstName,
    String? lastName,
  }) {
    return StudentByCourseModel(
      studentCode: studentCode ?? this.studentCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'MaSinhVien': studentCode,
      'HoDem': firstName,
      'Ten': lastName,
    };
  }

  factory StudentByCourseModel.fromMap(Map<String, dynamic> map) {
    return StudentByCourseModel(
      studentCode:
          map['MaSinhVien'] != null ? map['MaSinhVien'] as String : null,
      firstName: map['HoDem'] != null ? map['HoDem'] as String : null,
      lastName: map['Ten'] != null ? map['Ten'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentByCourseModel.fromJson(String source) =>
      StudentByCourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentByCourseModel(studentCode: $studentCode, firstName: $firstName, lastName: $lastName)';

  @override
  bool operator ==(covariant StudentByCourseModel other) {
    if (identical(this, other)) return true;

    return other.studentCode == studentCode &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode =>
      studentCode.hashCode ^ firstName.hashCode ^ lastName.hashCode;
}
