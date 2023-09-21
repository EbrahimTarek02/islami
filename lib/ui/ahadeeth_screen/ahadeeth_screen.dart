import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:islami/ui/hadith_screen/hadith_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadeethScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 27,
          child: Image.asset(AppAssets.ahadeethScreenLogo),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
              Spacer(),
              Text(
                AppLocalizations.of(context)!.ahadeeth,
                style: AppThemeTextStyle.tableHeadTextStyle.copyWith(fontSize: 25),
              ),
              Spacer(),
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 65,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: 50,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadithScreen.routeName, arguments: index);
              },

              child: Text(
                'الحديث رقم ${index + 1}',
                style: AppThemeTextStyle.tableHeadTextStyle.copyWith(fontSize: 25.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],      
    );
  }
}


