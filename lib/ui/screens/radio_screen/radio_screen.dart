import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';

class RadioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Column(
      children: [
        Expanded(
          flex: 60,
          child: Image.asset(AppAssets.radio),
        ),
        Expanded(
          flex: 40,
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.alQuranAlKarimStation,
                style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      provider.currentLanguage == 'ar' ? Icons.skip_next : Icons.skip_previous,
                      color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                      size: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.play_arrow,
                      color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                      size: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      provider.currentLanguage == 'ar' ? Icons.skip_previous : Icons.skip_next,
                      color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                      size: 35.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
