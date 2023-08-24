import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Cubit<ForgotPasswordState> {
  ForgotPasswordBloc() : super(const ForgotPasswordState());
}
