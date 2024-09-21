import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For SynchronousFuture

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get helloWorld {
    return _localizedValues[locale.languageCode]!['helloWorld']!;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'helloWorld': 'Hello World',
    },
    'ar': {
      'helloWorld': 'مرحبا بالعالم',
    },
  };
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
