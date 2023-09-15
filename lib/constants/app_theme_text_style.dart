import 'package:flutter/material.dart';
import 'app_theme_colors.dart';

abstract class AppThemeTextStyle {
  static const TextStyle appBarTextStyle = TextStyle(color: AppThemeColor.accent);
  static const TextStyle tableHeadTextStyle = TextStyle(color: AppThemeColor.accent, fontSize: 20, fontWeight: FontWeight.w600);
}