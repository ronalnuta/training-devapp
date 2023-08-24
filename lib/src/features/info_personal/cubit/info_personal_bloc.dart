import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/info/info_student_model.dart';
import 'package:my_app/src/network/model/info/info_teacher_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'info_personal_state.dart';

class InfoPersonalBloc extends Cubit<InfoPersonalState> {
  InfoPersonalBloc() : super(InfoPersonalState.ds()) {
    getInfoPersonal();
  }

  Domain get _domain => GetIt.I<Domain>();

  void getInfoPersonal() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;

    isTeacher ? await _getInfoTeacher(token) : await _getInforStudent(token);
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  Future<void> _getInfoTeacher(String token) async {
    final value = await _domain.userRepository.getInfoTeacher(token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(infoTeacher: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  Future<void> _getInforStudent(String token) async {
    final value = await _domain.userRepository.getInfoStudent(token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(infoStudent: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
  }

  void _emitIfOpen(InfoPersonalState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
