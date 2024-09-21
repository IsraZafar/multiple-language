import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, String> _localizedStrings = {}; // Initialize with an empty map

  Future<bool> load() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/l10n/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
      print(
          "Loaded localizations for ${locale.languageCode}: $_localizedStrings"); // Debugging
      return true;
    } catch (e) {
      print("Error loading localizations: $e"); // Debugging
      return false;
    }
  }

  String get helloWorld {
    return _localizedStrings['helloWorld'] ?? 'Hello World';
  }
}

// This delegate is needed to load and provide AppLocalizations
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'fr']
        .contains(locale.languageCode); // Add your supported locales here
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
