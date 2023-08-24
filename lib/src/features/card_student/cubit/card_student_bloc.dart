import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'card_student_state.dart';

class CardStudentBloc extends Cubit<CardStudentState> {
  CardStudentBloc() : super(const CardStudentState());
}
