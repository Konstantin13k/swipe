part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

abstract class LogInEvent extends AuthorizationEvent {
  const LogInEvent();
}

class EnterPhoneNumber extends LogInEvent {
  const EnterPhoneNumber();
}

class EnterCode extends LogInEvent {
  const EnterCode();
}

class LoggedIn extends LogInEvent {
  const LoggedIn();
}
