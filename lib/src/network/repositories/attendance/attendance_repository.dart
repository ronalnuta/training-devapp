import 'package:my_app/src/network/model/attendance/qr_code_model.dart';
import 'package:my_app/src/network/model/attendance/student_by_course_model.dart';
import 'package:my_app/src/network/model/common/base_model.dart';
import 'package:my_app/src/network/model/common/result.dart';

abstract class AttendanceRepository {
  Future<XResult<BaseModel<QRCodeModel>>> getqrcodeattendance({
    required String semesterId,
    required String courseId,
    required String expiredTime,
    required String token,
  });

  Future<XResult<BaseModel<List<StudentByCourseModel>>>>
      getliststudentbycourse({
    required String semesterId,
    required String courseId,
    required String token,
  });
}
