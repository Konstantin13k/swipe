import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:swipe/domain/models/verification_state.dart';
import 'package:swipe/domain/repositories/verification_repository.dart';

const int verificationTimeOutInSeconds = 120;

class VerificationRepositoryImpl extends VerificationRepository {
  final FirebaseAuth _auth;
  final StreamController<VerificationState> _verificationState =
      StreamController();

  VerificationRepositoryImpl({
    FirebaseAuth? auth,
  }) : _auth = auth ?? FirebaseAuth.instance;

  @override
  Stream<VerificationState> observePhoneVerificationState(
      String phoneNumber) async* {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: verificationTimeOutInSeconds),
      verificationCompleted: (AuthCredential authCredential) {
        _signInWithCredential(authCredential);
      },
      verificationFailed: (FirebaseAuthException authException) {
        _verificationState.add(VerificationState.fail(
            authException.message ?? authException.toString()));
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        _verificationState.add(VerificationState.codeSent(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationState.add(VerificationState.timeOut());
      },
    );
    yield* _verificationState.stream;
  }

  @override
  void signInWithCode(String verificationId, String smsCode) {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    _signInWithCredential(credential);
  }

  void _signInWithCredential(AuthCredential credential) {
    _auth.signInWithCredential(credential).then((_) {
      _verificationState.add(VerificationState.success());
    });
  }
}
