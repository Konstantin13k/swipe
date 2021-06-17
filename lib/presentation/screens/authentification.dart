import 'package:flutter/material.dart';
import 'package:swipe/utils/extensions.dart';

class Authorization extends StatelessWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.swipeTheme.authScreenBackground,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SwipeAppTitle(),
            SizedBox(height: 40),
            _SwipeAppSubtitle(text: context.strings.app_subtitle),
            SizedBox(height: 50),
            _GradientButton(text: context.strings.log_in, onPressed: () {}),
            SizedBox(
              height: 20,
            ),
            _RegistrationText(),
          ],
        ),
      ),
    );
  }
}

class _SwipeAppTitle extends StatelessWidget {
  const _SwipeAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                gradient: context.swipeTheme.primaryGradient,
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                width: 64,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  gradient: context.swipeTheme.primaryGradient,
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            context.strings.app_name,
            style: TextStyle(
              color: context.swipeTheme.authTextColor,
              fontSize: 42,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _SwipeAppSubtitle extends StatelessWidget {
  final String text;

  const _SwipeAppSubtitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 85),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: context.swipeTheme.authTextColor,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const _GradientButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 61),
      height: 50,
      decoration: BoxDecoration(
        gradient: context.swipeTheme.primaryGradient,
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
            style: TextStyle(
              color: context.swipeTheme.authTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class _RegistrationText extends StatelessWidget {
  const _RegistrationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.strings.firs_time_question,
            style: TextStyle(
              color: context.swipeTheme.authTextColor.withOpacity(0.6),
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          SizedBox(width: 10),
          Text(
            context.strings.register,
            style: TextStyle(
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
