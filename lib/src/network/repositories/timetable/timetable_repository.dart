import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_student_model.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/semester_student_model.dart';
import 'package:my_app/src/network/model/timetable/semester_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_student_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_teacher_model.dart';

abstract class TimetableRepository {
  Future<XResult<BaseModel<List<SemesterTeacherModel>>>> getListSemesterTeacher(
      String token);

  Future<XResult<BaseModel<List<TimetableTeacherModel>>>> getTimetableTeacher({
    required String semesterId,
    required String token,
  });

  Future<XResult<BaseModel<List<ExamScheduleTeacherModel>>>>
      getexamscheduleteacher({
    required String semesterId,
    required String token,
  });

  Future<XResult<BaseModel<List<SemesterStudentModel>>>> getlistsemesterstudent(
      String token);

  Future<XResult<BaseModel<List<TimetableStudentModel>>>> gettimetablestudent({
    required String semesterId,
    required String token,
  });

  Future<XResult<BaseModel<List<ExamScheduleStudentModel>>>>
      getexamschedulestudent({
    required String semesterId,
    required String token,
  });
}
