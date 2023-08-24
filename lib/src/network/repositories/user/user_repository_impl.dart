import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/account/info_account_model.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/info/info_student_model.dart';
import 'package:my_app/src/network/model/info/info_teacher_model.dart';
import 'package:my_app/src/network/model/login/login_model.dart';
import 'package:my_app/src/network/repositories/user/user_repository.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<XResult<LoginModel>> login({
    required String user,
    required String pass,
  }) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.login,
        data: {
          "usr": user,
          "pass": pass,
        },
      );

      final result =
          BaseModel.fromMap(response.data, (p0) => LoginModel.fromMap(p0));

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> LOGIN CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<InfoAccountModel>> getInfoAccount(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getInfoAccount,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => InfoAccountModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET INFO ACCOUNT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<bool>> logout(String token) async {
    try {
      final response = await BaseDataSource().post(
        Endpoints.logout,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );

      final result = BaseModel.fromMap(response.data);

      return result.success && result.statusCode == 200
          ? XResult.success(true)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> LOGOUT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<InfoTeacherModel>> getInfoTeacher(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getInfoTeacher,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => InfoTeacherModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET INFO TEACHER CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<InfoStudentModel>> getInfoStudent(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getInfoStudent,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => InfoStudentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET INFO STUDENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
