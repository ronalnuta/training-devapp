import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/src/utils/calendar_utils.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'work_schedule_state.dart';

class WorkScheduleBloc extends Cubit<WorkScheduleState> {
  WorkScheduleBloc() : super(WorkScheduleState.ds()) {
    getListWorkSchedule();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getListWorkSchedule() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value =
        await _domain.workScheduleRepository.getListWorkSchedule(token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(list: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(WorkScheduleState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  final int daysInWeek = 7;

  void onPreviousWeek() => _emitIfOpen(state.copyWith(
        currentWeek: state.currentWeek.subtract(Duration(days: daysInWeek)),
      ));

  void onNextWeek() => _emitIfOpen(state.copyWith(
        currentWeek: state.currentWeek.add(Duration(days: daysInWeek)),
      ));
}
