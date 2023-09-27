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

  static int counter = 0;
  static int index = 0;
  double rotationAngle = 0.0;
  static int numberOfTasbeehat = 33;
  static TextEditingController counterController = TextEditingController(text: '33');
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {

     provider = Provider.of(context);

    List<String> tasbeehList = [
      AppLocalizations.of(context)!.sobhanAllah,
      AppLocalizations.of(context)!.alHamduLillah,
      AppLocalizations.of(context)!.laIlahaEllaAllah,
      AppLocalizations.of(context)!.allahAkbar,
      AppLocalizations.of(context)!.laHawlaWaLaQuaEllaBillah,
    ];

    double sebhaPadding = MediaQuery.of(context).size.height / 18.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 52,
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
                    // height: MediaQuery.of(context).size.height / 3.43,
                  ),
                )
              )
            ],
          ),
        ),
        Expanded(
          flex: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Spacer(flex: 35,),
                Text(
                  AppLocalizations.of(context)!.numberOfTasbeehat,
                  style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.primary,
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //
                //   padding: EdgeInsets.all(20.0),
                //   margin: EdgeInsets.symmetric(vertical: 20.0),
                //
                //   child: Text(
                //     '${counter} / 33',
                //     style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () => changeCounterClick(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                    ),
                    child: Text(
                      '${counter} / ${numberOfTasbeehat}',
                      style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onSebhaClick(numberOfTasbeehat),
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

  void onSebhaClick(int numberOfTasbeehat) {
    rotationAngle += 0.1;
    counter = (++counter) % numberOfTasbeehat;

    if (counter == 0) {
      index = ++index % 5;
    }

    setState(() {});
  }

  void changeCounterClick() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom ,top: 20, right: 20, left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: counterController,
              keyboardType: TextInputType.number,
              // autofocus: true,
              style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                    )
                ),
                labelText: AppLocalizations.of(context)!.numberOfTasbeehat,
                labelStyle: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () => onSaveClick(),

              style: ElevatedButton.styleFrom(
                backgroundColor: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                padding: EdgeInsets.all(20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),

              child: Text(
                AppLocalizations.of(context)!.saveChanges,
                style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      )
    );
  }

  void onSaveClick() {
    try {
      double.parse(counterController.text).floor() < 0 ? throw() : null;
      numberOfTasbeehat = double.parse(counterController.text).floor();
      counter = 0;
      Navigator.pop(context);
    } catch(exception){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.pleaseEnterAValidNumber,
              style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle.copyWith(fontSize: 16) : AppThemeTextStyle.tableContentTextStyle.copyWith(fontSize: 16),
            ),
            backgroundColor: provider.isDark ? AppThemeColor.grey : AppThemeColor.grey,
          ),
      );
    }
    counterController.text = numberOfTasbeehat.toString();
    setState(() {});
  }
}