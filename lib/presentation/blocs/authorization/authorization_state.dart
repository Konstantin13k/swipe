part of 'authorization_bloc.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {
  const AuthorizationInitial();
}

abstract class LogIn extends AuthorizationState {
  const LogIn();
}

class WaitingForPhoneNumber extends LogIn {
  const WaitingForPhoneNumber();
}

class WaitingForCode extends LogIn {
  const WaitingForCode();
}

class LoginSuccessful extends LogIn {
  const LoginSuccessful();
}
