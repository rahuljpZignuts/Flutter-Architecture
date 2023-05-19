import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void toggleLocale() {
    _locale =
        _locale?.languageCode == "en" ? const Locale("ar") : const Locale("ar");
    notifyListeners();
  }
}
