import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';

import 'package:my_app/src/features/login/models/pass_input.dart';
import 'package:my_app/src/features/login/models/username_input.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState()) {
    initial();
  }

  Domain get _domain => GetIt.I<Domain>();

  void initial() {
    _getLoginInfo();
  }

  void _getLoginInfo() {
    final user = UserPrefs().getUsername;
    final pass = UserPrefs().getPass;
    if (user.isNotEmpty) onChangedUser(user);
    if (pass.isNotEmpty) onChangedPass(pass);
  }

  void onChangedUser(String value) =>
      _emitIfOpen(state.copyWith(user: UsernameInput.dirty(value: value)));

  void onChangedPass(String value) =>
      _emitIfOpen(state.copyWith(pass: PasswordInput.dirty(value: value)));

  void onChangedCheckbox() =>
      _emitIfOpen(state.copyWith(isSaved: !state.isSaved));

  Future<void> onLoginButton() async {
    final value = _checkValidated();
    if (!value) return;
    _login();
  }

  bool _checkValidated() {
    if (!state.validator) {
      onChangedUser(state.user.value.isEmpty ? "" : state.user.value);
      onChangedPass(state.pass.value.isEmpty ? "" : state.pass.value);

      return false;
    }

    return true;
  }

  void _saveLoginInfo() {
    if (state.isSaved) {
      UserPrefs().saveLoginInfo(
        user: state.user.value,
        pass: state.pass.value,
      );
    } else {
      UserPrefs().removeLoginInfo();
    }
  }

  Future<void> _login() async {
    XToast.showLoading();
    final value = await _domain.userRepository.login(
      user: state.user.value,
      pass: state.pass.value,
    );

    if (value.isSuccess) {
      _saveLoginInfo();
      UserPrefs().setTokenAccount(value.data!.token);
      await GetIt.I<AccountBloc>().getInfoAccount(value.data!.token);
      XToast.hideLoading();
      XCoordinator.showDashboard();
    } else {
      XToast.hideLoading();
      XToast.error("Đăng nhập thất bại");
    }
  }

  void _emitIfOpen(LoginState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
