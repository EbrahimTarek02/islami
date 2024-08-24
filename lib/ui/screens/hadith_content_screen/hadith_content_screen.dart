import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadithContentScreen extends StatefulWidget {

  static const String routeName = 'hadith screen route name';

  const HadithContentScreen({super.key});

  @override
  State<HadithContentScreen> createState() => _HadithContentScreenState();
}

class _HadithContentScreenState extends State<HadithContentScreen> {
  String hadith = '', hadithTopic = '';

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

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

        body: hadith.isNotEmpty ?
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
                  Text(
                    hadithTopic,
                    maxLines: 1,
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                  ),
                  Divider(
                    color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                    thickness: 2.0,
                  ),
                  Text(
                    hadith,
                    textDirection: TextDirection.rtl,
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle.copyWith(fontSize: 20.0)
                        : AppThemeTextStyle.tableContentTextStyle.copyWith(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ) : Center(child: CircularProgressIndicator(color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary)),
      ),
    );
  }
}
