import 'package:flutter/material.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/utils/extensions.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipeThemeData swipeTheme = context.swipeTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 61),
      height: 50,
      decoration: BoxDecoration(
        gradient: swipeTheme.primaryGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          primary: context.theme.primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: swipeTheme.textStyle(
              color: swipeTheme.authTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
