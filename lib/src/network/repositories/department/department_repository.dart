import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/department/department_model.dart';
import 'package:my_app/src/network/model/department/lecturers_department_model.dart';

abstract class DepartmentRepository {
  Future<XResult<List<DepartmentModel>>> getListDepartment(String token);

  Future<XResult<List<LecturersDepartmentModel>>> getListLecturersDepartment({
    required int id,
    required String token,
  });

  Future<XResult<LecturersDepartmentModel>> getLecturersDepartment({
    required int id,
    required String token,
  });
}
