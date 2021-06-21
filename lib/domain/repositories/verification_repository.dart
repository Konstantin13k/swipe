import 'package:swipe/domain/models/verification_state.dart';

abstract class VerificationRepository {
  Stream<VerificationState> observePhoneVerificationState(String phoneNumber);

  void signInWithCode(String verificationId, String smsCode);
}
