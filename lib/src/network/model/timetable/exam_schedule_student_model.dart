// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExamScheduleStudentModel {
  final String? date;
  final String? dayOfWeek;
  final String? startPeriod;
  final String? endPeriod;
  final String? examTime;
  final String? courseCode;
  final String? courseName;
  final String? roomName;
  ExamScheduleStudentModel({
    this.date,
    this.dayOfWeek,
    this.startPeriod,
    this.endPeriod,
    this.examTime,
    this.courseCode,
    this.courseName,
    this.roomName,
  });

  ExamScheduleStudentModel copyWith({
    String? date,
    String? dayOfWeek,
    String? startPeriod,
    String? endPeriod,
    String? examTime,
    String? courseCode,
    String? courseName,
    String? roomName,
  }) {
    return ExamScheduleStudentModel(
      date: date ?? this.date,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startPeriod: startPeriod ?? this.startPeriod,
      endPeriod: endPeriod ?? this.endPeriod,
      examTime: examTime ?? this.examTime,
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
      'ThoiGianThi': examTime,
      'MaLopHocPhan': courseCode,
      'TenMonHoc': courseName,
      'TenPhong': roomName,
    };
  }

  factory ExamScheduleStudentModel.fromMap(Map<String, dynamic> map) {
    return ExamScheduleStudentModel(
      date: map['Ngay'] != null ? map['Ngay'] as String : null,
      dayOfWeek: map['Thu'] != null ? map['Thu'] as String : null,
      startPeriod: map['TietBD'] != null ? map['TietBD'] as String : null,
      endPeriod: map['TietKT'] != null ? map['TietKT'] as String : null,
      examTime:
          map['ThoiGianThi'] != null ? map['ThoiGianThi'] as String : null,
      courseCode:
          map['MaLopHocPhan'] != null ? map['MaLopHocPhan'] as String : null,
      courseName: map['TenMonHoc'] != null ? map['TenMonHoc'] as String : null,
      roomName: map['TenPhong'] != null ? map['TenPhong'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamScheduleStudentModel.fromJson(String source) =>
      ExamScheduleStudentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExamScheduleStudentModel(date: $date, dayOfWeek: $dayOfWeek, startPeriod: $startPeriod, endPeriod: $endPeriod, examTime: $examTime, courseCode: $courseCode, courseName: $courseName, roomName: $roomName)';
  }

  @override
  bool operator ==(covariant ExamScheduleStudentModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.dayOfWeek == dayOfWeek &&
        other.startPeriod == startPeriod &&
        other.endPeriod == endPeriod &&
        other.examTime == examTime &&
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
        examTime.hashCode ^
        courseCode.hashCode ^
        courseName.hashCode ^
        roomName.hashCode;
  }
}
