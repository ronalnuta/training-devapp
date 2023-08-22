import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/account/cubit/account_bloc.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/message/unread_message_model.dart';
import 'package:my_app/src/services/user_prefs.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState.ds()) {
    init();
  }

  Domain get _domain => GetIt.I<Domain>();

  void init() {
    final isTeacher = GetIt.I<AccountBloc>().state.isTeacher;
    if (isTeacher) {
      getUnreadMessage();
    }
  }

  Future<void> getUnreadMessage() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      return;
    }
    final value = await _domain.messageRepository.getUnreadMessageNumber(token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(unreadMessage: value.data));
    }
  }

  void _emitIfOpen(HomeState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
