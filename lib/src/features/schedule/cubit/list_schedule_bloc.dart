import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_schedule_state.dart';

class ListScheduleBloc extends Cubit<ListScheduleState> {
  ListScheduleBloc() : super(const ListScheduleState());

  void getListSchedule() =>
      _emitIfOpen(state.copyWith(isEmpty: Random().nextBool()));
  void _emitIfOpen(ListScheduleState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
