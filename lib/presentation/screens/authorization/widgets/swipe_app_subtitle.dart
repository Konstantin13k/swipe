import 'package:flutter/material.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/utils/extensions.dart';

class SwipeAppSubtitle extends StatelessWidget {
  final String text;

  const SwipeAppSubtitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipeThemeData swipeTheme = context.swipeTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 85),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: swipeTheme.textStyle(
          color: swipeTheme.authTextColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
