import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';

extension Localization on BuildContext {
  AppLocalizations get strings {
    return AppLocalizations.of(this)!;
  }

  ThemeData get theme {
    return Theme.of(this);
  }
}
