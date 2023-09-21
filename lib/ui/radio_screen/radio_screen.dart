import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                style: AppThemeTextStyle.tableHeadTextStyle,
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.skip_previous,
                      color: AppThemeColor.primary,
                      size: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppThemeColor.primary,
                      size: 35.0,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.skip_next,
                      color: AppThemeColor.primary,
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
