import 'package:dio/dio.dart';
import 'package:my_app/src/config/constants/endpoints.dart';
import 'package:my_app/src/network/data_sources/base_data_source.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/work_schedule/other_work_schedule_content_model.dart';
import 'package:my_app/src/network/model/work_schedule/other_work_schedule_model.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_content_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_model.dart';
import 'package:my_app/src/network/repositories/work_schedule/work_schedule_repository.dart';
import 'package:my_app/src/utils/helper/logger.dart';

class WorkScheduleRepositoryImpl extends WorkScheduleRepository {
  @override
  Future<XResult<WorkScheduleContentModel>> getWorkScheduleContent({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getWorksSheduleContent}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => WorkScheduleContentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET WORK SCHEDULE CONTENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<OtherWorkScheduleContentModel>> getOtherWorkScheduleContent({
    required int id,
    required String token,
  }) async {
    try {
      final response = await BaseDataSource().get(
        "${Endpoints.getOtherWorksSheduleContent}/${id.toString()}",
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(
        response.data,
        (p0) => OtherWorkScheduleContentModel.fromMap(p0),
      );

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET OTHER WORK SCHEDULE CONTENT CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<List<WorkScheduleModel>>> getListWorkSchedule(
    String token,
  ) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getListWorkSchedule,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<WorkScheduleModel> list = [];
        p0['list'].forEach((v) {
          list.add(WorkScheduleModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST WORK SCHEDULE CATCH Error< $e');

      return XResult.exception(e);
    }
  }

  @override
  Future<XResult<List<OtherWorkScheduleModel>>> getLisOtherWorkSchedule(
    String token,
  ) async {
    try {
      final response = await BaseDataSource().get(
        Endpoints.getListOtherWorkSchedule,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }),
      );
      final result = BaseModel.fromMap(response.data, (p0) {
        final List<OtherWorkScheduleModel> list = [];
        p0['list'].forEach((v) {
          list.add(OtherWorkScheduleModel.fromMap(v));
        });

        return list;
      });

      return result.success && result.statusCode == 200
          ? XResult.success(result.data)
          : XResult.error(result.message);
    } catch (e) {
      LoggerHelper.error('> GET LIST OTHER WORK SCHEDULE CATCH Error< $e');

      return XResult.exception(e);
    }
  }
}
