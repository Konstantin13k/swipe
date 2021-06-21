import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:swipe/domain/models/verification_state.dart';
import 'package:swipe/domain/repositories/verification_repository.dart';
import 'package:swipe/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:swipe/utils/form_inputs/code.dart';
import 'package:swipe/utils/form_inputs/phone_number.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthorizationBloc authorizationBloc;
  final VerificationRepository verificationRepository;

  LogInCubit({
    required this.authorizationBloc,
    required this.verificationRepository,
  }) : super(const LogInState());

  @override
  void onChange(Change<LogInState> change) {
    super.onChange(change);
    final LogInStatus nextStatus = change.nextState.status;
    if (nextStatus == LogInStatus.waitingForPhoneNumber) {
      authorizationBloc.add(const EnterPhoneNumber());
    } else if (nextStatus == LogInStatus.waitingForCode) {
      authorizationBloc.add(const EnterCode());
    } else if (nextStatus == LogInStatus.success) {
      authorizationBloc.add(const LoggedIn());
    }
  }

  void phoneNumberChanged(String value) {
    final PhoneNumber phoneNumber = PhoneNumber(value);
    emit(state.copyWith(phoneNumber: phoneNumber));
  }

  void codeChanged(String value) {
    final Code code = Code(value);
    emit(state.copyWith(code: code));
  }

  Future<void> signInWithPhoneNumber() async {
    if (state.phoneNumber.invalid) return;
    emit(state.copyWith(status: LogInStatus.inProgress));
    verificationRepository
        .observePhoneVerificationState(state.phoneNumber.value)
        .listen((VerificationState verificationState) {
      if (verificationState is Success) {
        emit(state.copyWith(status: LogInStatus.success));
      } else if (verificationState is CodeSent) {
        emit(state.copyWith(
          verificationId: verificationState.verificationId,
          status: LogInStatus.waitingForCode,
        ));
      } else if (verificationState is Fail) {
        emit(state.copyWith(status: LogInStatus.fail));
      } else if (verificationState is TimeOut) {
        emit(state.copyWith(status: LogInStatus.timeout));
      }
    });
  }

  Future<void> signInWithCode() async {
    if (state.code.invalid) return;
    emit(state.copyWith(status: LogInStatus.inProgress));
    verificationRepository.signInWithCode(
        state.verificationId, state.code.value);
  }
}
