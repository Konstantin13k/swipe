part of 'log_in_cubit.dart';

enum LogInStatus { waitingForPhoneNumber, success, fail, timeout, inProgress, waitingForCode }

class LogInState extends Equatable {
  final PhoneNumber phoneNumber;
  final String verificationId;
  final Code code;
  final LogInStatus status;

  const LogInState({
    this.phoneNumber = const PhoneNumber.pure(),
    this.verificationId = '',
    this.code = const Code.pure(),
    this.status = LogInStatus.waitingForPhoneNumber,
  });

  LogInState copyWith({
    PhoneNumber? phoneNumber,
    String? verificationId,
    Code? code,
    LogInStatus? status,
  }) {
    return LogInState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      code: code ?? this.code,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        this.phoneNumber,
        this.verificationId,
        this.code,
        this.status,
      ];
}
