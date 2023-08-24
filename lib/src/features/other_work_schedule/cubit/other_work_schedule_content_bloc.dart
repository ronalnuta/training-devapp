import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/work_schedule/other_work_schedule_content_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'other_work_schedule_content_state.dart';

class OtherWorkScheduleContentBloc
    extends Cubit<OtherWorkScheduleContentState> {
  final int otherWorkScheduleId;
  OtherWorkScheduleContentBloc(this.otherWorkScheduleId)
      : super(OtherWorkScheduleContentState.ds()) {
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
        .getOtherWorkScheduleContent(id: otherWorkScheduleId, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(data: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(OtherWorkScheduleContentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
