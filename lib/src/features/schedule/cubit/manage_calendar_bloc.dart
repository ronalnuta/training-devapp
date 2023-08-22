import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/utils/calendar_utils.dart';

part 'manage_calendar_state.dart';

class ManageCalendarBloc extends Cubit<ManageCalendarState> {
  ManageCalendarBloc()
      : super(ManageCalendarState(
          currentWeek: DateTime.now(),
          selectedDay: DateTime.now(),
        ));

  final int daysInWeek = 7;

  void onPreviousWeek() => _emitIfOpen(state.copyWith(
        currentWeek: state.currentWeek.subtract(Duration(days: daysInWeek)),
      ));

  void onNextWeek() => _emitIfOpen(state.copyWith(
        currentWeek: state.currentWeek.add(Duration(days: daysInWeek)),
      ));

  void onPressedDay(int index) =>
      _emitIfOpen(state.copyWith(selectedDay: state.daysInWeek[index]));
  void _emitIfOpen(ManageCalendarState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
