import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/attendance/student_by_course_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'attendance_state.dart';

class AttendanceBloc extends Cubit<AttendanceState> {
  final String courseId;
  final String semesterId;
  AttendanceBloc({
    required this.semesterId,
    required this.courseId,
  }) : super(const AttendanceState()) {
    getqrcodeattendance();
    getliststudentbycourse();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getqrcodeattendance() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.attendanceRepository.getqrcodeattendance(
        expiredTime: "15",
        courseId: courseId,
        semesterId: semesterId,
        token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(qrCode: value.data?.data.qrCode));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getliststudentbycourse() async {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    if (!isTeacher) return;
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.attendanceRepository.getliststudentbycourse(
        courseId: courseId, semesterId: semesterId, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(list: value.data?.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  void _emitIfOpen(AttendanceState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
