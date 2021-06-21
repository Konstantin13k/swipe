import 'package:formz/formz.dart';

enum CodeValidationError { invalid }

class Code extends FormzInput<String, CodeValidationError> {
  static final RegExp _codeRegExp = RegExp('[0-9]{6}');

  const Code.pure() : super.pure('');

  const Code([String code = '']) : super.dirty(code);

  @override
  CodeValidationError? validator(String value) {
    return _codeRegExp.hasMatch(value) ? null : CodeValidationError.invalid;
  }
}
