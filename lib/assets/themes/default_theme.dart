import 'package:flutter/material.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';

ThemeData defaultTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF27AEA4),
  );
}

SwipeThemeData defaultSwipeTheme() {
  return SwipeThemeData(
    primaryGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xFF56C385),
        const Color(0xFF41BFB5),
      ],
    ),
    authScreenBackground: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF0B3138),
        const Color(0xFF0A4A46),
      ],
    ),
  );
}
