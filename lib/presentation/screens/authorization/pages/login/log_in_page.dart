import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/code_form.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/cubit/log_in_cubit.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/phone_number_form.dart';
import 'package:swipe/service_locator.dart';

import '../../widgets/swipe_app_title.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInCubit>(
      create: (_) => serviceLocator(),
      child: Container(
        margin: const EdgeInsets.only(top: 122),
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is WaitingForPhoneNumber) {
              return Column(
                children: [
                  SwipeAppTitle(),
                  PhoneNumberForm(),
                ],
              );
            } else if (state is WaitingForCode) {
              return Column(
                children: [
                  SwipeAppTitle(),
                  CodeForm(),
                ],
              );
            } else {
              throw Exception('');
            }
          },
        ),
      ),
    );
  }
}
