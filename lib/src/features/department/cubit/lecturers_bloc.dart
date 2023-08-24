import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/department/lecturers_department_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'lecturers_state.dart';

class LecturersBloc extends Cubit<LecturersState> {
  final int userId;
  LecturersBloc(this.userId) : super(LecturersState.ds()) {
    getLecturersDepartment();
  }

  Domain get _domain => GetIt.I<Domain>();

  Future<void> getLecturersDepartment() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value = await _domain.departmentRepository.getLecturersDepartment(
      token: token,
      id: userId,
    );
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(data: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(LecturersState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
