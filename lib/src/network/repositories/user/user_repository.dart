import 'package:my_app/src/network/model/account/info_account_model.dart';
import 'package:my_app/src/network/model/common/result.dart';
import 'package:my_app/src/network/model/info/info_student_model.dart';
import 'package:my_app/src/network/model/info/info_teacher_model.dart';
import 'package:my_app/src/network/model/login/login_model.dart';

abstract class UserRepository {
  Future<XResult<LoginModel>> login({
    required String user,
    required String pass,
  });

  Future<XResult<InfoAccountModel>> getInfoAccount(String token);

  Future<XResult<void>> logout(String token);

  Future<XResult<InfoTeacherModel>> getInfoTeacher(String token);

  Future<XResult<InfoStudentModel>> getInfoStudent(String token);
}
