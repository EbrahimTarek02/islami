import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/constants/surah_screen_arguments.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurahContentScreen extends StatefulWidget {

  static const String routeName = 'surah screen route name';

  const SurahContentScreen({super.key});

  @override
  State<SurahContentScreen> createState() => _SurahContentScreenState();
}

class _SurahContentScreenState extends State<SurahContentScreen> {
  String surahContent = '';
  int counter = 1;

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    var args = ModalRoute.of(context)!.settings.arguments as SurahScreenArguments;

    void readFile() async{
      if (surahContent.isNotEmpty){
        return;
      }

      surahContent = await rootBundle.loadString('${AppAssets.surah}${args.index + 1}.txt');

      for (int i = 0; i < args.numberOfAyat; i++) {
        if (i == args.numberOfAyat - 1 && !surahContent.contains('\n')){
          surahContent += '(${i + 1}) ';
        }
        else{
          surahContent = surahContent.replaceFirst('\n', ' (${i + 1}) ');
        }
      }

      setState(() {

      });
    }

    readFile();

    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.isDark ? AppAssets.backgroundDark : AppAssets.backgroundLight),
              fit: BoxFit.cover
          )
      ),

      child: Scaffold(
        backgroundColor: AppThemeColor.transparent,

        appBar: AppBar(
          iconTheme: IconThemeData(color: provider.isDark ? AppThemeColor.white : AppThemeColor.accent),
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: provider.isDark ? AppThemeTextStyle.appBarDarkTextStyle : AppThemeTextStyle.appBarTextStyle,
          ),
        ),

        body: surahContent.isNotEmpty ?
        Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.grey,
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.order,
                            style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                          ),
                          Text(
                            '${args.index + 1}',
                            style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        args.surahName,
                        style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                      ),
                      Text(
                        '${args.numberOfAyat} ${AppLocalizations.of(context)!.ayat}',
                        style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                      ),
                    ],
                  ),
                  Divider(
                    color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                    thickness: 2.0,
                  ),
                  (args.surahName != 'الفاتحه' && args.surahName != 'التوبة') ?
                    Text(
                      'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
                      style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle.copyWith(fontSize: 20.0)
                          : AppThemeTextStyle.tableContentTextStyle.copyWith(fontSize: 20.0),
                  ) : const SizedBox(),
                  Text(
                    surahContent,
                    textDirection: TextDirection.rtl,
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle.copyWith(fontSize: 20.0, fontFamily: 'Montserrat',)
                        : AppThemeTextStyle.tableContentTextStyle.copyWith(fontSize: 20.0, fontFamily: 'Montserrat',),
                  ),
                  Text(
                    'صَدَقَ اللهُ العَظيمُ',
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle.copyWith(fontSize: 20.0)
                        : AppThemeTextStyle.tableContentTextStyle.copyWith(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ) : Center(child: CircularProgressIndicator(color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary))
      ),
    );
  }
}
