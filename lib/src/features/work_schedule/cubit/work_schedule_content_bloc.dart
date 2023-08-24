import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/work_schedule/work_schedule_content_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'work_schedule_content_state.dart';

class WorkScheduleContentBloc extends Cubit<WorkScheduleContentState> {
  final int workScheduleId;
  WorkScheduleContentBloc(this.workScheduleId)
      : super(WorkScheduleContentState.ds()) {
    getWorkScheduleContent();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getWorkScheduleContent() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value = await _domain.workScheduleRepository
        .getWorkScheduleContent(id: workScheduleId, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(data: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(WorkScheduleContentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
