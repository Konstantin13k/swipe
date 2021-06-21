import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:swipe/assets/themes/default_theme.dart';
import 'package:swipe/assets/themes/swipe_theme.dart';
import 'package:swipe/presentation/screens/authorization/authorization.dart';

import 'service_locator.dart' as di;

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        child: Authorization(),
      ),
    );
  }
}
