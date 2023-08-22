import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/family_relationship_tab.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/info_education_tab.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/info_individual_tab.dart';

part 'info_student_state.dart';

class InfoStudentBloc extends Cubit<InfoStudentState> {
  InfoStudentBloc() : super(const InfoStudentState());

  void onPrevious() =>
      _emitIfOpen(state.copyWith(info: InfoType.values[state.info.index - 1]));

  void onNext() => _emitIfOpen(
        state.copyWith(info: InfoType.values[(state.info.index + 1)]),
      );
  void _emitIfOpen(InfoStudentState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
