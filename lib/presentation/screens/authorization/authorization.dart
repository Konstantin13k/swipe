import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/log_in_page.dart';
import 'package:swipe/presentation/screens/authorization/widgets/auth_page.dart';
import 'package:swipe/presentation/screens/home/home.dart';
import 'package:swipe/service_locator.dart';
import 'package:swipe/utils/extensions.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthorizationBloc>(
          create: (context) {
            return serviceLocator();
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: context.swipeTheme.authScreenBackground,
          ),
          child: Center(
            child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is AuthorizationInitial) {
                  return AuthorizationPage();
                } else if (state is LoginSuccessful) {
                  return Home();
                } else if (state is LogIn) {
                  return LogInPage();
                } else {
                  throw Exception('Unknown authorization state: $state');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
