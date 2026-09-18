// lib/onbording/data/language_provider.dart
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale("en");

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}

class L10n {
  static final supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
  ];
}
