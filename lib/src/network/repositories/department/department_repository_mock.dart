import 'package:my_app/src/network/model/department/department_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/department/lecturers_department_model.dart';
import 'package:my_app/src/network/repositories/department/department_repository.dart';

class DepartmentRepositoryMock extends DepartmentRepository {
  @override
  Future<XResult<List<DepartmentModel>>> getListDepartment(String token) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<List<LecturersDepartmentModel>>> getListLecturersDepartment({
    required int id,
    required String token,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<LecturersDepartmentModel>> getLecturersDepartment({
    required int id,
    required String token,
  }) {
    throw UnimplementedError();
  }
}
