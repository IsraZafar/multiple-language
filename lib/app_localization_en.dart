import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart'; // For SynchronousFuture

// Base localization class
class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get helloWorld => "Hello World"; // Default English message
}

// Arabic localization class
class AppLocalizationsAr extends AppLocalizations {
  @override
  String get helloWorld => "مرحبا بالعالم"; // Arabic translation
}

// LocalizationsDelegate implementation
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizationsAr());
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
