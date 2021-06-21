abstract class VerificationState {
  const VerificationState();

  factory VerificationState.codeSent(String verificationId) {
    return CodeSent(verificationId: verificationId);
  }

  factory VerificationState.success() => Success();

  factory VerificationState.fail(String message) {
    return Fail(message: message);
  }

  factory VerificationState.timeOut() => TimeOut();
}

class CodeSent extends VerificationState {
  final String verificationId;

  CodeSent({required this.verificationId});
}

class Success extends VerificationState {}

class Fail extends VerificationState {
  final String message;

  Fail({required this.message});
}

class TimeOut extends VerificationState {}
