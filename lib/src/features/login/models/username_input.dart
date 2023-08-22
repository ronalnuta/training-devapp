// Define input validation errors
import 'package:formz/formz.dart';

enum UsernameInputError {
  empty,
  invalid;

  String? get messageOf {
    switch (this) {
      case UsernameInputError.empty:
        return 'Vui lòng nhập tài khoản';
      case UsernameInputError.invalid:
        return 'Tài khoản không hợp lệ';
      default:
        return null;
    }
  }
}

// Extend FormzInput and provide the input type and error type.
class UsernameInput extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const UsernameInput.pure({String value = '', this.customError})
      : super.pure(value);

  // Call super.dirty to represent a modified form input.
  const UsernameInput.dirty({String value = '', this.customError})
      : super.dirty(value);

  final String? customError;

  get pure => null;

  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty) {
      return UsernameInputError.empty;
    }
    if (value.length < 8) {
      return UsernameInputError.invalid;
    }

    return null;
  }
}
