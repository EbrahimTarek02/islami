import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_constants.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:islami/constants/surah_screen_arguments.dart';
import 'package:islami/ui/surah_screen/surah_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatelessWidget {

  List <String> surahNames = AppConstants.surahNames;
  List <int> numberOfAyat = AppConstants.numberOfAyat;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 29,
          child: Image.asset(AppAssets.quranScreenLogo)
        ),
        Spacer(flex: 1),
        Expanded(
          flex: 9,
          child: Column(
            children: [
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
                height: 2.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.surahName,
                      style: AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: AppThemeColor.primary,
                    width: 2.0,
                    height: MediaQuery.of(context).size.height / 15.4,
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.numberOfAyat,
                      style: AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 61,
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: surahNames.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, SurahScreen.routeName, arguments: surahScreenArguments(
                    index: index,
                    surahName: surahNames[index],
                    numberOfAyat: numberOfAyat[index]
                ));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      surahNames[index],
                      style: AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: AppThemeColor.primary,
                    width: 2.0,
                    height: MediaQuery.of(context).size.height / 17.35757575757576,
                  ),
                  Expanded(
                    child: Text(
                      numberOfAyat[index].toString(),
                      style: AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}