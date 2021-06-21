import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/presentation/screens/authorization/pages/login/cubit/log_in_cubit.dart';
import 'package:swipe/presentation/screens/authorization/widgets/gradient_button.dart';
import 'package:swipe/presentation/screens/authorization/widgets/swipe_app_subtitle.dart';
import 'package:swipe/utils/extensions.dart';

const int codeLength = 6;

class CodeForm extends StatelessWidget {
  const CodeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations strings = context.strings;
    return Column(
      children: [
        SizedBox(height: 40),
        SwipeAppSubtitle(text: strings.enter_code),
        SizedBox(height: 30),
        CodeTextField(),
        SizedBox(height: 40),
        GradientButton(
            text: strings.log_in,
            onPressed: () {
              final LogInCubit logInCubit = context.read<LogInCubit>();
              logInCubit.signInWithCode();
            }),
      ],
    );
  }
}

class CodeTextField extends StatelessWidget {
  const CodeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LogInCubit logInCubit = context.read<LogInCubit>();
    final SwipeThemeData swipeTheme = context.swipeTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: PinCodeTextField(
        appContext: context,
        length: codeLength,
        keyboardType: TextInputType.number,
        cursorColor: swipeTheme.authTextColor,
        autoFocus: true,
        animationType: AnimationType.fade,
        cursorHeight: 40,
        textStyle: swipeTheme.textStyle(
          color: swipeTheme.authTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 40,
        ),
        pinTheme: PinTheme(
          fieldHeight: 50,
          activeColor: swipeTheme.authTextColor,
          selectedColor: swipeTheme.authTextColor,
          inactiveColor: swipeTheme.authTextColor,
        ),
        onChanged: (String code) {
          logInCubit.codeChanged(code);
        },
      ),
    );
  }
}
