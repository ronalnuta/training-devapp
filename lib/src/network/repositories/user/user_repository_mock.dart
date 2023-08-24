import 'package:my_app/src/network/model/account/info_account_model.dart';
import 'package:my_app/src/network/model/info/info_student_model.dart';
import 'package:my_app/src/network/model/info/info_teacher_model.dart';
import 'package:my_app/src/network/model/login/login_model.dart';
import 'package:my_app/src/network/repositories/user/user_repository.dart';

import 'package:my_app/src/network/model/common/result.dart';

class UserRepositoryMock extends UserRepository {
  @override
  Future<XResult<LoginModel>> login({
    required String user,
    required String pass,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<InfoAccountModel>> getInfoAccount(String token) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<void>> logout(String token) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<InfoTeacherModel>> getInfoTeacher(String token) {
    throw UnimplementedError();
  }

  @override
  Future<XResult<InfoStudentModel>> getInfoStudent(String token) {
    throw UnimplementedError();
  }
}
