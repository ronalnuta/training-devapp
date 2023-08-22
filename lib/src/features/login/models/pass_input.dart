// Define input validation errors
import 'package:formz/formz.dart';

enum PasswordInputError {
  empty,
  invalid;

  String? get messageOf {
    switch (this) {
      case PasswordInputError.empty:
        return 'Vui lòng nhập mật khẩu';
      case PasswordInputError.invalid:
        return 'Mật khẩu không hợp lệ';
      default:
        return null;
    }
  }
}

// Extend FormzInput and provide the input type and error type.
class PasswordInput extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordInput.pure({String value = '', this.customError})
      : super.pure(value);

  // Call super.dirty to represent a modified form input.
  const PasswordInput.dirty({String value = '', this.customError})
      : super.dirty(value);

  final String? customError;

  // Override validator to handle validating a given input value.
  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty) {
      return PasswordInputError.empty;
    }

    if (value.length < 4) {
      return PasswordInputError.invalid;
    }

    return null;
  }
}
