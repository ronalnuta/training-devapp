import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/department/department_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/department/lecturers_department_model.dart';
import 'package:my_app/src/network/repositories/department/department_repository.dart';

import 'package:my_app/src/utils/helper/logger.dart';

class DepartmentRepositoryImpl extends DepartmentRepository {
  @override
  Future<XResult<List<DepartmentModel>>> getListDepartment(String token) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getListDepartment,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<DepartmentModel> list = [];
        p0['list'].forEach((v) {
          list.add(DepartmentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST DEPARTMENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<List<LecturersDepartmentModel>>> getListLecturersDepartment({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getListEmailPhoneByDepartment}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<LecturersDepartmentModel> list = [];
        p0['list'].forEach((v) {
          list.add(LecturersDepartmentModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST LECTURERS DEPARTMENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<LecturersDepartmentModel>> getLecturersDepartment({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getEmailPhoneByDepartmentWithId}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => LecturersDepartmentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LECTURERS DEPARTMENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
