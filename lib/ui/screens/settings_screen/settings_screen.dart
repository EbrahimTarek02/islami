import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Center(
      child: Container(
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.grey,
              blurRadius: 6.0
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.darkMode,
                  style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                ),
                Switch(
                  value: provider.isDark,
                  onChanged: (value) => provider.changeMode(),
                  activeColor: AppThemeColor.accentDark,
                ),
              ],
            ),
            SizedBox(height: 12,),
            DropdownButton(
              isExpanded: true,
              items: [
                DropdownMenuItem(child: Text('العربية'), value: 'ar',),
                DropdownMenuItem(child: Text('English'), value: 'en',),
              ],
              hint: Text(
                AppLocalizations.of(context)!.chooseLanguage,
                style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
              ),
              dropdownColor: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.white,
              style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
              iconEnabledColor: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
              onChanged: (value) => provider.changeLanguage(value.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
