import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationBloc extends Cubit<NotificationState> {
  NotificationBloc() : super(const NotificationState());

  void onTap(bool value) => _emitIfOpen(state.copyWith(isShowAll: value));
  void _emitIfOpen(NotificationState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
