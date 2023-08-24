import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/attendance/student_by_course_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'manager_attendance_state.dart';

class ManagerAttendanceBloc extends Cubit<ManagerAttendanceState> {
  final String courseId;
  final String semesterId;
  ManagerAttendanceBloc({
    required this.semesterId,
    required this.courseId,
  }) : super(const ManagerAttendanceState()) {
    getliststudentbycourse();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getliststudentbycourse() async {
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

  void _emitIfOpen(ManagerAttendanceState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
