// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TimetableStudentModel {
  final String? date;
  final String? dayOfWeek;
  final String? startPeriod;
  final String? endPeriod;
  final String? courseCode;
  final String? courseName;
  final String? roomName;
  TimetableStudentModel({
    this.date,
    this.dayOfWeek,
    this.startPeriod,
    this.endPeriod,
    this.courseCode,
    this.courseName,
    this.roomName,
  });

  TimetableStudentModel copyWith({
    String? date,
    String? dayOfWeek,
    String? startPeriod,
    String? endPeriod,
    String? courseCode,
    String? courseName,
    String? roomName,
  }) {
    return TimetableStudentModel(
      date: date ?? this.date,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      courseCode: courseCode ?? this.courseCode,
      courseName: courseName ?? this.courseName,
      roomName: roomName ?? this.roomName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Ngay': date,
      'Thu': dayOfWeek,
      'TietBD': startPeriod,
      'TietKT': endPeriod,
      'MaLopHocPhan': courseCode,
      'TenMonHoc': courseName,
      'TenPhong': roomName,
    };
  }

  factory TimetableStudentModel.fromMap(Map<String, dynamic> map) {
    return TimetableStudentModel(
      date: map['Ngay'] != null ? map['Ngay'] as String : null,
      dayOfWeek: map['Thu'] != null ? map['Thu'] as String : null,
      startPeriod: map['TietBD'] != null ? map['TietBD'] as String : null,
      endPeriod: map['TietKT'] != null ? map['TietKT'] as String : null,
      courseCode:
          map['MaLopHocPhan'] != null ? map['MaLopHocPhan'] as String : null,
      courseName: map['TenMonHoc'] != null ? map['TenMonHoc'] as String : null,
      roomName: map['TenPhong'] != null ? map['TenPhong'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimetableStudentModel.fromJson(String source) =>
      TimetableStudentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TimetableStudentModel(date: $date, dayOfWeek: $dayOfWeek, startPeriod: $startPeriod, endPeriod: $endPeriod, courseCode: $courseCode, courseName: $courseName, roomName: $roomName)';
  }

  @override
  bool operator ==(covariant TimetableStudentModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.dayOfWeek == dayOfWeek &&
        other.startPeriod == startPeriod &&
        other.endPeriod == endPeriod &&
        other.courseCode == courseCode &&
        other.courseName == courseName &&
        other.roomName == roomName;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        dayOfWeek.hashCode ^
        startPeriod.hashCode ^
        endPeriod.hashCode ^
        courseCode.hashCode ^
        courseName.hashCode ^
        roomName.hashCode;
  }
}
