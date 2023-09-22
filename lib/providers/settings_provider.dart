import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDark = false;
  String currentLanguage = 'en';

  void changeMode() {
    isDark = !isDark;
    notifyListeners();
  }

  void changeLanguage(String value) {
    currentLanguage = value;
    notifyListeners();
  }
}