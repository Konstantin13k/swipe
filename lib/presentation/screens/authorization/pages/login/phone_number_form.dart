import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/presentation/screens/authorization/widgets/gradient_button.dart';
import 'package:swipe/utils/extensions.dart';

import 'cubit/log_in_cubit.dart';

class PhoneNumberForm extends StatelessWidget {
  const PhoneNumberForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 72),
        _PhoneNumberTextField(),
        SizedBox(height: 25),
        GradientButton(
          text: context.strings.proceed,
          onPressed: () {
            FocusScope.of(context).unfocus();
            final LogInCubit logInCubit = context.read<LogInCubit>();
            logInCubit.signInWithPhoneNumber();
          },
        ),
      ],
    );
  }
}

class _PhoneNumberTextField extends StatelessWidget {
  _PhoneNumberTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipeThemeData swipeTheme = context.swipeTheme;
    final LogInCubit logInCubit = context.read<LogInCubit>();
    return BlocBuilder<LogInCubit, LogInState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 61),
          height: 44,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: swipeTheme.primaryGradient.colors
                  .map((color) => color.withOpacity(0.2))
                  .toList(),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            autofocus: true,
            cursorColor: swipeTheme.authTextColor,
            keyboardType: TextInputType.phone,
            style: swipeTheme.textStyle(
              color: swipeTheme.authTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            onChanged: (phoneNumber) {
              logInCubit.phoneNumberChanged(phoneNumber);
            },
            onEditingComplete: () {
              if (state.phoneNumber.invalid) {
                Fluttertoast.showToast(
                  msg: context.strings.enter_valid_phone_number,
                  gravity: ToastGravity.CENTER,
                );
              } else {
                FocusScope.of(context).unfocus();
                logInCubit.signInWithPhoneNumber();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              isDense: true,
              hintText: context.strings.phone_hint,
              hintStyle: swipeTheme.textStyle(
                color: swipeTheme.authTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
