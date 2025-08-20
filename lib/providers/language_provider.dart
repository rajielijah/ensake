import 'package:flutter/material.dart';
import 'package:ensake_loyalty_app/services/localization_service.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = LocalizationService.defaultLocale;

  Locale get currentLocale => _currentLocale;

  void changeLanguage(String languageCode) {
    _currentLocale = Locale(languageCode);
    notifyListeners();
  }

  void toggleLanguage() {
    if (_currentLocale.languageCode == 'en') {
      _currentLocale = const Locale('de');
    } else {
      _currentLocale = const Locale('en');
    }
    notifyListeners();
  }

  String get currentLanguageCode => _currentLocale.languageCode;
  String get currentLanguageName {
    switch (_currentLocale.languageCode) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      default:
        return 'English';
    }
  }
}
