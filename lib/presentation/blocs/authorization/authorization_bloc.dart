import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationInitial());

  @override
  Stream<AuthorizationState> mapEventToState(
    AuthorizationEvent event,
  ) async* {
    if (event is EnterPhoneNumber) {
      yield const WaitingForPhoneNumber();
    } else if (event is EnterCode) {
      yield const WaitingForCode();
    } else if (event is LoggedIn) {
      yield const LoginSuccessful();
    }
  }
}
