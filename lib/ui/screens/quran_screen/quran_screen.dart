import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:islami/ui/utils/app_constants.dart';
import 'package:islami/constants/surah_screen_arguments.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';
import '../surah_content_screen/surah_content_screen.dart';

class QuranScreen extends StatelessWidget {

  final List <String> surahNames = AppConstants.surahNames;
  final List <int> numberOfAyat = AppConstants.numberOfAyat;

  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 30,
          child: Image.asset(AppAssets.quranScreenLogo)
        ),
        Expanded(
          flex: 9,
          child: Column(
            children: [
              Divider(
                color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                thickness: 2.0,
                height: 2.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.surahName,
                      style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                    width: 2.0,
                    height: MediaQuery.of(context).size.height / 15.4,
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.numberOfAyat,
                      style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Divider(
                color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 61,
          child: ListView.builder(
            itemCount: surahNames.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, SurahContentScreen.routeName, arguments: SurahScreenArguments(
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
                      style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                    width: 2.0,
                    height: MediaQuery.of(context).size.height / 17,
                  ),
                  Expanded(
                    child: Text(
                      numberOfAyat[index].toString(),
                      style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
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