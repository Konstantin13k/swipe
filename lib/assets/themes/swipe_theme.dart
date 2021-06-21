import 'package:flutter/material.dart';

class SwipeThemeData {
  final Gradient primaryGradient;
  final Gradient authScreenBackground;
  final Color authTextColor;
  final String primaryFontFamily;

  const SwipeThemeData({
    required this.primaryGradient,
    required this.authScreenBackground,
    required this.authTextColor,
    required this.primaryFontFamily,
  });

  TextStyle textStyle({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
  }) {
    return TextStyle(
      fontFamily: primaryFontFamily,
      inherit: inherit,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      leadingDistribution: leadingDistribution,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      debugLabel: debugLabel,
    );
  }
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
