import 'package:flutter/material.dart';
import 'app_theme_colors.dart';

abstract class AppThemeTextStyle {
  //light
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppThemeColor.accent,
    fontSize: 25.0,
    fontWeight: FontWeight.w600
  );
  static const TextStyle bottomNavBarLabelsTextStyle = TextStyle(
      color: AppThemeColor.accent,
      fontSize: 12.0,
      fontWeight: FontWeight.normal
  );
  static const TextStyle tableHeadTextStyle = TextStyle(
    color: AppThemeColor.accent,
    fontSize: 25,
    fontWeight: FontWeight.w600
  );
  static const TextStyle tableContentTextStyle = TextStyle(
      color: AppThemeColor.accent,
      fontSize: 25,
      fontWeight: FontWeight.normal
  );


  //dark
  static const TextStyle appBarDarkTextStyle = TextStyle(
    color: AppThemeColor.white,
    fontSize: 25.0,
    fontWeight: FontWeight.w600
  );
  static const TextStyle bottomNavBarLabelsDarkTextStyle = TextStyle(
      color: AppThemeColor.accent,
      fontSize: 12.0,
      fontWeight: FontWeight.normal
  );
  static const TextStyle tableHeadDarkTextStyle = TextStyle(
      color: AppThemeColor.white,
      fontSize: 25,
      fontWeight: FontWeight.w600
  );
  static const TextStyle tableContentDarkTextStyle = TextStyle(
      color: AppThemeColor.white,
      fontSize: 25,
      fontWeight: FontWeight.normal
  );
}