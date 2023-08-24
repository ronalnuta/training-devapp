part of 'login_bloc.dart';

class LoginState extends Equatable {
  final UsernameInput user;
  final PasswordInput pass;
  final bool isSaved;

  String? get errorUser => user.isPure ? null : user.error?.messageOf;

  String? get errorPass => pass.isPure ? null : pass.error?.messageOf;

  bool get validator {
    return user.isValid && pass.isValid;
  }

  const LoginState({
    this.user = const UsernameInput.pure(),
    this.pass = const PasswordInput.pure(),
    this.isSaved = true,
  });

  @override
  List<Object?> get props => [
        user,
        pass,
        isSaved,
      ];

  LoginState copyWith({
    UsernameInput? user,
    PasswordInput? pass,
    bool? isSaved,
  }) {
    return LoginState(
      user: user ?? this.user,
      pass: pass ?? this.pass,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
