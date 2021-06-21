import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/presentation/blocs/authorization/authorization_bloc.dart';
import 'package:swipe/utils/extensions.dart';

import '../../widgets/gradient_button.dart';
import '../../widgets/swipe_app_subtitle.dart';
import '../../widgets/swipe_app_title.dart';

class MainAuthorizationPage extends StatelessWidget {
  const MainAuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 122),
        SwipeAppTitle(),
        SizedBox(height: 40),
        SwipeAppSubtitle(text: context.strings.app_subtitle),
        SizedBox(height: 50),
        GradientButton(
            text: context.strings.log_in,
            onPressed: () {
              context.read<AuthorizationBloc>().add(EnterPhoneNumber());
            }),
        SizedBox(height: 20),
        _RegistrationText(),
      ],
    );
  }
}

class _RegistrationText extends StatelessWidget {
  const _RegistrationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipeThemeData swipeTheme = context.swipeTheme;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.firs_time_question,
            style: swipeTheme.textStyle(
              color: context.swipeTheme.authTextColor.withOpacity(0.6),
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          SizedBox(width: 10),
          Text(
            context.strings.register,
            style: swipeTheme.textStyle(
              color: context.swipeTheme.authTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
