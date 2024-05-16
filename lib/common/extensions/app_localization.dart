import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get appLocale {
    return AppLocalizations.of(this)!;
  }
}
