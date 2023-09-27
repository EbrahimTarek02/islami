import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';
import '../ahadeeth_screen/ahadeeth_screen.dart';
import '../quran_screen/quran_screen.dart';
import '../radio_screen/radio_screen.dart';
import '../sebha_screen/sebha_screen.dart';
import '../settings_screen/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName = 'home screen route name';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;
  List<Widget> screens = [
    QuranScreen(),
    AhadeethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

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
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: provider.isDark ? AppThemeTextStyle.appBarDarkTextStyle : AppThemeTextStyle.appBarTextStyle,
          ),
        ),

        bottomNavigationBar: bottomNavigationBarBuilder(provider),

        body: screens[currentIndex],
      ),
    );
  }

  Widget bottomNavigationBarBuilder(SettingsProvider provider) {
    return Theme(
      data: ThemeData().copyWith(canvasColor: provider.isDark ? AppThemeColor.primaryDark : AppThemeColor.primary),

      child: BottomNavigationBar(
        iconSize: 35.0,

        selectedItemColor: provider.isDark ? AppThemeColor.accentDark : AppThemeColor.accent,

        selectedLabelStyle: provider.isDark ? AppThemeTextStyle.bottomNavBarLabelsDarkTextStyle : AppThemeTextStyle.bottomNavBarLabelsTextStyle,

        currentIndex: currentIndex,

        onTap: (index){
          currentIndex = index;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icQuran)),
            label: AppLocalizations.of(context)!.quran,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icAhadeeth)),
            label: AppLocalizations.of(context)!.ahadeeth,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icSebha)),
            label: AppLocalizations.of(context)!.sebha,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icRadio)),
            label: AppLocalizations.of(context)!.radio,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}