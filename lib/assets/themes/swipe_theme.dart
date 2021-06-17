import 'package:flutter/material.dart';

class SwipeThemeData {
  final Gradient primaryGradient;
  final Gradient authScreenBackground;

  const SwipeThemeData({
    required this.primaryGradient,
    required this.authScreenBackground,
  });
}

class SwipeTheme extends InheritedWidget {
  final SwipeThemeData swipeThemeData;

  const SwipeTheme({
    required this.swipeThemeData,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static SwipeTheme of(BuildContext context) {
    final SwipeTheme? result =
        context.dependOnInheritedWidgetOfExactType<SwipeTheme>();
    assert(result != null, 'No SwipeTheme found in context!');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant SwipeTheme oldTheme) {
    return oldTheme.swipeThemeData != this.swipeThemeData;
  }
}
