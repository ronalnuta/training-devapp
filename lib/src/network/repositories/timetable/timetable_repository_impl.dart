import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_student_model.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/semester_student_model.dart';
import 'package:my_app/src/network/model/timetable/semester_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_student_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_teacher_model.dart';
import 'package:my_app/src/network/repositories/timetable/timetable_repository.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class TimetableRepositoryImpl extends TimetableRepository {
  @override
  Future<XResult<BaseModel<List<SemesterTeacherModel>>>> getListSemesterTeacher(
      String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getlistsemesterteacher,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<SemesterTeacherModel> list = [];
        p0['list'].forEach((v) {
          list.add(SemesterTeacherModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET getListSemesterTeacher CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<TimetableTeacherModel>>>> getTimetableTeacher({
    required String semesterId,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.gettimetableteacher}/${semesterId.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<TimetableTeacherModel> list = [];
        p0['list'].forEach((v) {
          list.add(TimetableTeacherModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET getTimetableTeacher CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<ExamScheduleTeacherModel>>>>
      getexamscheduleteacher({
    required String semesterId,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getexamscheduleteacher}/${semesterId.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<ExamScheduleTeacherModel> list = [];
        p0['list'].forEach((v) {
          list.add(ExamScheduleTeacherModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET getexamscheduleteacher CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<SemesterStudentModel>>>> getlistsemesterstudent(
      String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getlistsemesterstudent,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = BaseModel.fromMap(response.data, (p0) {
        final List<SemesterStudentModel> list = [];
        p0['list'].forEach((v) {
          list.add(SemesterStudentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET getlistsemesterstudent CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<TimetableStudentModel>>>> gettimetablestudent({
    required String semesterId,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.gettimetablestudent}/${semesterId.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<TimetableStudentModel> list = [];
        p0['list'].forEach((v) {
          list.add(TimetableStudentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET gettimetablestudent CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<BaseModel<List<ExamScheduleStudentModel>>>>
      getexamschedulestudent({
    required String semesterId,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getexamschedulestudent}/${semesterId.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<ExamScheduleStudentModel> list = [];
        p0['list'].forEach((v) {
          list.add(ExamScheduleStudentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result)
          : XResult.error(result.message);
    } catch (e, a) {
      LoggerHelper.error('> GET getexamschedulestudent CATCH Error< $e $a');

      return XResult.exception(e);
    }
  }
}
