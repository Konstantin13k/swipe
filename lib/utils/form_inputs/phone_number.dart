import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

const String defaultPhoneNumberPrefix = '+38';

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  static final RegExp _phoneNumberRegExp = RegExp(
      '^(\\+\\d{1,3}( )?)?((\\(\\d{3}\\))|\\d{3})[- .]?\\d{3}[- .]?\\d{4}\$');

  const PhoneNumber.pure() : super.pure('');

  PhoneNumber([String phoneNumber = ''])
      : super.dirty(phoneNumber.startsWith('+')
            ? phoneNumber
            : '$defaultPhoneNumberPrefix$phoneNumber');

  @override
  PhoneNumberValidationError? validator(String value) {
    return _phoneNumberRegExp.hasMatch(value)
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
