import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:my_app/src/network/domain.dart';
import 'package:my_app/src/network/model/common/meta_model.dart';
import 'package:my_app/src/network/model/news/news_model.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/src/utils/calendar_utils.dart';
import 'package:my_app/widgets/dialogs/toast_wrapper.dart';

part 'news_state.dart';

class NewsBloc extends Cubit<NewsState> {
  NewsBloc() : super(NewsState.ds()) {
    getListNews(state.numberPage);
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
        await getListNews(state.numberPage + 1);
        _emitIfOpen(state.copyWith(isLoadingMore: false));
      }
    });
  }

  Future<void> getListNews(int numberPage) async {
    final token = UserPrefs().getTokenAccount;
    if (token.isEmpty) {
      _emitIfOpen(state.copyWith(isLoading: false));

      return;
    }
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final value = await _domain.newsRepository.getListNews(
        token: token,
        numberPage: numberPage,
        startDay: dateFormat.format(state.daysInWeek.first),
        endDay: dateFormat.format(state.daysInWeek.last));
    if (value.isSuccess) {
      _emitIfOpen(state.copyWith(
        meta: value.data!.meta,
        list: [...value.data!.data, ...state.list],
        numberPage: numberPage,
      ));
    } else {
      XToast.error("Không thể load dữ liệu từ server");
    }
    _emitIfOpen(state.copyWith(isLoading: false));
  }

  void _emitIfOpen(NewsState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  final int daysInWeek = 7;

  void onPreviousWeek() {
    _emitIfOpen(state.copyWith(
      currentWeek: state.currentWeek.subtract(Duration(days: daysInWeek)),
    ));
    getListNews(1);
  }

  void onNextWeek() {
    _emitIfOpen(state.copyWith(
      currentWeek: state.currentWeek.add(Duration(days: daysInWeek)),
    ));
    getListNews(1);
  }
}
