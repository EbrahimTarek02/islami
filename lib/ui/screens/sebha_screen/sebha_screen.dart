import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0, index = 0;
  double rotationAngle = 0.0;

  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    List<String> tasbeehList = [
      AppLocalizations.of(context)!.sobhanAllah,
      AppLocalizations.of(context)!.alHamduLillah,
      AppLocalizations.of(context)!.laIlahaEllaAllah,
      AppLocalizations.of(context)!.allahAkbar,
      AppLocalizations.of(context)!.laHawlaWaLaQuaEllaBillah,
    ];
    double sebhaPadding = MediaQuery.of(context).size.height / 18.5;

    void onElevatedButtonPressed() {
      rotationAngle += 0.1;
      counter = (++counter) % 33;

      if (counter == 0){
        index = ++index % tasbeehList.length;
      }

      setState(() {

      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 50,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: sebhaPadding),
                child: Image.asset(
                  provider.isDark ? AppAssets.headOfSebhaDark : AppAssets.headOfSebha,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    provider.isDark ? AppAssets.bodyOfSebhaDark : AppAssets.bodyOfSebha,
                    height: MediaQuery.of(context).size.height / 3.43,
                  ),
                )
              )
            ],
          ),
        ),
        Expanded(
          flex: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Spacer(flex: 35,),
                Text(
                  AppLocalizations.of(context)!.numberOfTasbeehat,
                  style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.primary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.symmetric(vertical: 20.0),

                  child: Text(
                    '$counter',
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    onElevatedButtonPressed();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                  child: Text(
                    tasbeehList[index],
                    style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(flex: 65,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}