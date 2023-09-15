import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:islami/ui/hadith_screen/hadith_screen.dart';

class AhadeethScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 30,
          child: Image.asset(AppAssets.ahadeethScreenLogo),
        ),
        Expanded(
          flex: 70,
          child: Column(
            children: [
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
              ),
              Text(
                'Ahadeeth',
                style: AppThemeTextStyle.tableHeadTextStyle,
              ),
              Divider(
                color: AppThemeColor.primary,
                thickness: 2.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.148805802175816,
                child: ListView.builder(
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
          ),
        ),
      ],      
    );
  }
}


