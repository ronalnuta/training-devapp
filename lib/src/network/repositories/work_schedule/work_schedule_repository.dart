import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/work_schedule/other_work_schedule_content_model.dart';
import 'package:my_app/src/network/model/work_schedule/other_work_schedule_model.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_content_model.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_model.dart';

abstract class WorkScheduleRepository {
  Future<XResult<WorkScheduleContentModel>> getWorkScheduleContent({
    required int id,
    required String token,
  });

  Future<XResult<OtherWorkScheduleContentModel>> getOtherWorkScheduleContent({
    required int id,
    required String token,
  });

  Future<XResult<List<WorkScheduleModel>>> getListWorkSchedule(String token);

  Future<XResult<List<OtherWorkScheduleModel>>> getLisOtherWorkSchedule(
    String token,
  );
}
