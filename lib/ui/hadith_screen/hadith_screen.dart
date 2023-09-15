import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_theme_colors.dart';
import '../../constants/app_theme_text_style.dart';

class HadithScreen extends StatefulWidget {

  static const String routeName = 'hadith screen route name';

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  String hadith = '', hadithTopic = '';

  @override
  Widget build(BuildContext context) {

    var index = ModalRoute.of(context)!.settings.arguments as int;

    void readFile() async {
      if (hadith.isNotEmpty) {
        return;
      }

      hadith = await rootBundle.loadString('${AppAssets.hadith}h${index + 1}.txt');

      int i = hadith.indexOf('\n');
      hadithTopic = hadith.substring(0, i + 1);
      hadith = hadith.replaceRange(0, i + 1, '');

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

        body: hadith.isNotEmpty ?
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
                  Text(
                    hadithTopic,
                    maxLines: 1,
                    style: AppThemeTextStyle.tableHeadTextStyle.copyWith(fontSize: 30.0),
                  ),
                  Divider(
                    color: AppThemeColor.primary,
                    thickness: 2.0,
                  ),
                  Text(
                    hadith,
                    textDirection: TextDirection.rtl,
                    style: AppThemeTextStyle.tableHeadTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ) : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
