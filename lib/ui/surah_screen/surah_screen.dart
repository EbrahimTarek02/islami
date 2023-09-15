import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/constants/surah_screen_arguments.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_theme_colors.dart';
import '../../constants/app_theme_text_style.dart';

class SurahScreen extends StatefulWidget {

  static const String routeName = 'surah screen route name';

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  String surahContent = '';
  int counter = 1;

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as surahScreenArguments;

    void readFile() async{
      if (surahContent.isNotEmpty){
        return;
      }

      surahContent = await rootBundle.loadString('${AppAssets.surah}${args.index + 1}.txt');

      for (int i = 0; i < args.numberOfAyat; i++) {
        if (i == args.numberOfAyat - 1 && surahContent.indexOf('\n') == -1){
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
              image: AssetImage(AppAssets.background),
              fit: BoxFit.cover
          )
      ),

      child: Scaffold(
        backgroundColor: AppThemeColor.transparent,

        appBar: AppBar(
          backgroundColor: AppThemeColor.transparent,
          iconTheme: IconThemeData(color: AppThemeColor.accent),
          title: Text(
            'Islami',
            style: AppThemeTextStyle.appBarTextStyle,
          ),
          centerTitle: true,
          elevation: 0.0,
        ),

        body: surahContent.isNotEmpty ?
        Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: AppThemeColor.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: AppThemeColor.grey,
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
                            'Order',
                            style: AppThemeTextStyle.tableHeadTextStyle,
                          ),
                          Text(
                            '${args.index + 1}',
                            style: AppThemeTextStyle.tableHeadTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        args.surahName,
                        style: AppThemeTextStyle.tableHeadTextStyle.copyWith(fontSize: 30.0),
                      ),
                      Text(
                        '${args.numberOfAyat} āyāt',
                        style: AppThemeTextStyle.tableHeadTextStyle,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppThemeColor.primary,
                    thickness: 2.0,
                  ),
                  (args.surahName != 'الفاتحه' && args.surahName != 'التوبة') ?
                    Text(
                      'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيم',
                      style: AppThemeTextStyle.tableHeadTextStyle,
                  ) : SizedBox(),
                  Text(
                    surahContent,
                    textDirection: TextDirection.rtl,
                    style: AppThemeTextStyle.tableHeadTextStyle,
                  ),
                  Text(
                    'صَدَقَ اللهُ العَظيمُ',
                    style: AppThemeTextStyle.tableHeadTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ) : Center(child: CircularProgressIndicator())
      ),
    );
  }
}
