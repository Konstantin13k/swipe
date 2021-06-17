import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swipe/assets/themes/default_theme.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru', ''),
      ],
      theme: defaultTheme(),
      home: SwipeTheme(
        swipeThemeData: defaultSwipeTheme(),
        child: Scaffold(
          body: Container(),
        ),
      ),
    );
  }
}
