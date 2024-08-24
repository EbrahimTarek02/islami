import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_theme_colors.dart';

abstract class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: AppThemeColor.primary,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppThemeColor.transparent,
      centerTitle: true,
      elevation: 0.0,
      scrolledUnderElevation: 0.0
    ),

  );

  static ThemeData darkThemeData = ThemeData(
    primaryColor: AppThemeColor.primaryDark,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppThemeColor.transparent,
      centerTitle: true,
      elevation: 0.0,
      scrolledUnderElevation: 0.0
    ),

  );
}