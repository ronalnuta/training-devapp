import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/message/message_content_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'message_content_state.dart';

class MessageContentBloc extends Cubit<MessageContentState> {
  final int messageId;
  MessageContentBloc(this.messageId) : super(MessageContentState.ds()) {
    getMessageContent();
  }

  Domain get _domain => GetIt.I<Domain>();

  void onChangedIconExpanded() {
    emit(state.copyWith(isShowMoreDataReceiver: !state.isShowMoreDataReceiver));
  }

  Future<void> getMessageContent() async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value = await _domain.messageRepository
        .getMessageContent(id: messageId, token: token);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(data: value.data));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(MessageContentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
