import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_student_model.dart';
import 'package:my_app/src/network/model/timetable/exam_schedule_teacher_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_student_model.dart';
import 'package:my_app/src/network/model/timetable/timetable_teacher_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'schedule_state.dart';

class ScheduleBloc extends Cubit<ScheduleState> {
  ScheduleBloc() : super(const ScheduleState()) {
    initial();
  }

  Domain get _domain => GetIt.I<Domain>();

  void initial() async {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    if (isTeacher) {
      fetchDataTeacher();
    } else {
      fetchDataStudent();
    }
  }

  void fetchDataTeacher() async {
    await getListSemesterTeacher();
    await Future.wait([
      getTimetableTeacher(),
      getexamscheduleteacher(),
    ]);
  }

  void fetchDataStudent() async {
    await getlistsemesterstudent();
    await Future.wait([
      gettimetablestudent(),
      getexamschedulestudent(),
    ]);
  }

  Future<void> getexamscheduleteacher() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.timetableRepository.getexamscheduleteacher(
        semesterId: state.semesterIdTeacher, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(listExam: value.data!.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getTimetableTeacher() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.timetableRepository
        .getTimetableTeacher(semesterId: state.semesterIdTeacher, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(list: value.data!.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getListSemesterTeacher() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value =
        await _domain.timetableRepository.getListSemesterTeacher(token);
    if (value.isSuccess) {
      _emitIfOpen(
          state.copyWith(semesterIdTeacher: value.data?.data.first.id ?? ""));
    }
  }

  Future<void> getexamschedulestudent() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.timetableRepository.getexamschedulestudent(
        semesterId: state.semesterIdStudent, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(listExamStudent: value.data!.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> gettimetablestudent() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.timetableRepository
        .gettimetablestudent(semesterId: state.semesterIdStudent, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(listStudent: value.data!.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> getlistsemesterstudent() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value =
        await _domain.timetableRepository.getlistsemesterstudent(token);
    if (value.isSuccess) {
      _emitIfOpen(
          state.copyWith(semesterIdStudent: value.data!.data.first.id ?? ""));
    }
  }

  void onSelectedTypeSchedule(ScheduleType value) =>
      _emitIfOpen(state.copyWith(type: value));

  void _emitIfOpen(ScheduleState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
