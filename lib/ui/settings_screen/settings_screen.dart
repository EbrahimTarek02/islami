import 'package:flutter/material.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Center(
      child: Container(
        margin: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: AppThemeColor.grey
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
                  style: AppThemeTextStyle.tableHeadTextStyle,
                ),
                Switch(
                  value: provider.isDark,
                  onChanged: (value) => provider.changeMode(),
                  activeColor: AppThemeColor.primary,
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
              hint: Text(AppLocalizations.of(context)!.chooseLanguage),
              style: AppThemeTextStyle.appBarTextStyle.copyWith(fontSize: 20),
              onChanged: (value) => provider.changeLanguage(value.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
