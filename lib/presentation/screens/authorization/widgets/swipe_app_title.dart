import 'package:flutter/material.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/utils/extensions.dart';

class SwipeAppTitle extends StatelessWidget {
  const SwipeAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwipeThemeData swipeTheme = context.swipeTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: swipeTheme.primaryGradient,
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: 64,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: swipeTheme.primaryGradient,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            context.strings.app_name,
            style: swipeTheme.textStyle(
              color: swipeTheme.authTextColor,
              fontSize: 42,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
