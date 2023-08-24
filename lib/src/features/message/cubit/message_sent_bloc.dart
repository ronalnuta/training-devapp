import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/common/meta_model.dart';
import 'package:my_app/src/network/model/message/message_sent_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'message_sent_state.dart';

class MessageSentBloc extends Cubit<MessageSentState> {
  MessageSentBloc() : super(MessageSentState.ds()) {
    getListMessageSent(state.pageNumber);
    addListenerController();
  }

  Domain get _domain => GetIt.I<Domain>();
  final ScrollController scrollController = ScrollController();

  void addListenerController() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state.meta != null) {
          if (state.meta!.pageNumber == state.meta!.totalPage ||
              state.list.length == state.meta!.total) {
            return;
          }
        }

        _emitIfOpen(state.copyWith(isLoadingMore: true));
        await getListMessageSent(state.pageNumber + 1);
        _emitIfOpen(state.copyWith(isLoadingMore: false));
      }
    });
  }

  Future<void> getListMessageSent(int pageNumber) async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    final value = await _domain.messageRepository
        .getListMessageSent(token: token, pageNumber: pageNumber);
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(
        meta: value.data!.meta,
        list: [...value.data!.data, ...state.list],
        pageNumber: pageNumber,
      ));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void onTap(bool value) => _emitIfOpen(state.copyWith(isShowAll: value));

  void _emitIfOpen(MessageSentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
