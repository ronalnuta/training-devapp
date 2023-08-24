// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  final ScheduleType type;
  final String semesterIdTeacher;
  final List<TimetableTeacherModel> list;
  final List<ExamScheduleTeacherModel> listExam;

  final String semesterIdStudent;
  final List<TimetableStudentModel> listStudent;
  final List<ExamScheduleStudentModel> listExamStudent;

  const ScheduleState({
    this.type = ScheduleType.myClass,
    this.semesterIdTeacher = "",
    this.list = const [],
    this.listExam = const [],
    this.semesterIdStudent = "",
    this.listStudent = const [],
    this.listExamStudent = const [],
  });

  @override
  List<Object?> get props => [
        type,
        semesterIdTeacher,
        list,
        listExam,
        semesterIdStudent,
        listStudent,
        listExamStudent,
      ];

  ScheduleState copyWith({
    ScheduleType? type,
    String? semesterIdTeacher,
    List<TimetableTeacherModel>? list,
    List<ExamScheduleTeacherModel>? listExam,
    String? semesterIdStudent,
    List<TimetableStudentModel>? listStudent,
    List<ExamScheduleStudentModel>? listExamStudent,
  }) {
    return ScheduleState(
      type: type ?? this.type,
      semesterIdTeacher: semesterIdTeacher ?? this.semesterIdTeacher,
      list: list ?? this.list,
      listExam: listExam ?? this.listExam,
      semesterIdStudent: semesterIdStudent ?? this.semesterIdStudent,
      listStudent: listStudent ?? this.listStudent,
      listExamStudent: listExamStudent ?? this.listExamStudent,
    );
  }
}

enum ScheduleType { myClass, exam, all }

extension ScheduleTypeExt on ScheduleType {
  String nameOf(bool isTeacher) {
    switch (this) {
      case ScheduleType.myClass:
        return isTeacher ? "Lịch dạy" : "Lịch học";
      case ScheduleType.exam:
        return "Lịch thi";
      case ScheduleType.all:
        return "Tất cả";
      default:
        return '';
    }
  }
}
