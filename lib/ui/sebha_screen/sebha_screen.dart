import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0, index = 0;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
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
          flex: 45,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: sebhaPadding),
                child: Image.asset(AppAssets.headOfSebha),
              ),
              Align(
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.asset(AppAssets.bodyOfSebha),
                  ),
                ),
                alignment: AlignmentDirectional.bottomCenter,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 55,
          child: Column(
            children: [
              Spacer(flex: 35,),
              Text(
                AppLocalizations.of(context)!.numberOfTasbeehat,
                style: AppThemeTextStyle.tableHeadTextStyle,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppThemeColor.primary,
                  borderRadius: BorderRadius.circular(20.0),
                ),

                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(vertical: 20.0),

                child: Text(
                  '$counter',
                  style: AppThemeTextStyle.tableHeadTextStyle.copyWith(fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  onElevatedButtonPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppThemeColor.primary,
                  padding: EdgeInsets.all(20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
                child: Text(
                  tasbeehList[index],
                  style: AppThemeTextStyle.appBarTextStyle.copyWith(fontSize: 25, color: AppThemeColor.white),
                ),
              ),
              Spacer(flex: 65,),
            ],
          ),
        ),
      ],
    );
  }
}