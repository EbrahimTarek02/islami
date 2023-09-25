import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  bool isDark = false;
  String currentLanguage = 'en';

  void changeMode() async{
    final prefs = await SharedPreferences.getInstance();
    isDark = !isDark;
    prefs.setBool('isDark', isDark);
    notifyListeners();
  }

  void changeLanguage(String value) async{
    final prefs = await SharedPreferences.getInstance();
    currentLanguage = value;
    prefs.setString('currentLanguage', currentLanguage);
    notifyListeners();
  }

  void getInitialData() async{
    final prefs = await SharedPreferences.getInstance();
    isDark = (prefs.getBool('isDark') ?? false);
    currentLanguage = (prefs.getString('currentLanguage') ?? 'en');
    prefs.setBool('isDark', isDark);
    prefs.setString('currentLanguage', currentLanguage);
    notifyListeners();
  }
}