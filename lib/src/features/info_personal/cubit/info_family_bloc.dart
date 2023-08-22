import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/common/pages/not_found_page.dart';
import 'package:my_app/src/features/info_personal/widgets/tab/info_family_tab.dart';

part 'info_family_state.dart';

class InfoFamilyBloc extends Cubit<InfoFamilyState> {
  InfoFamilyBloc() : super(const InfoFamilyState());

  void onTap(FamilyInclude? value) =>
      _emitIfOpen(state.copyWith(family: value));
  void _emitIfOpen(InfoFamilyState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }
}
