import 'package:flutter/material.dart';

import 'package:transport_management/l10n/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get appLocale {
    return AppLocalizations.of(this)!;
  }
}
