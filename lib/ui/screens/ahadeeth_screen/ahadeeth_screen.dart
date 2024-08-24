import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';
import '../hadith_content_screen/hadith_content_screen.dart';

class AhadeethScreen extends StatelessWidget {
  const AhadeethScreen({super.key});


  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Column(
      children: [
        Expanded(
          flex: 27,
          child: Image.asset(AppAssets.ahadeethScreenLogo),
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Divider(
                color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.ahadeeth,
                style: provider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle
              ),
              const Spacer(),
              Divider(
                color: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                thickness: 2.0,
                height: 0.0,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 65,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: 50,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, HadithContentScreen.routeName, arguments: index);
              },

              child: Text(
                'الحديث رقم ${index + 1}',
                style: provider.isDark ? AppThemeTextStyle.tableContentDarkTextStyle : AppThemeTextStyle.tableContentTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],      
    );
  }
}


