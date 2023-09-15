import 'package:flutter/material.dart';
import 'package:islami/constants/app_assets.dart';
import 'package:islami/constants/app_theme_colors.dart';
import 'package:islami/constants/app_theme_text_style.dart';
import 'package:islami/ui/ahadeeth_screen/ahadeeth_screen.dart';
import 'package:islami/ui/quran_screen/quran_screen.dart';
import 'package:islami/ui/radio_screen/radio_screen.dart';
import 'package:islami/ui/sebha_screen/sebha_screen.dart';

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
    RadioScreen()
  ];

  @override
  Widget build(BuildContext context) {

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
          title: Text(
            'Islami',
            style: AppThemeTextStyle.appBarTextStyle,
          ),
          centerTitle: true,
          elevation: 0.0,
        ),

        bottomNavigationBar: bottomNavigationBarBuilder(),

        body: screens[currentIndex],
      ),
    );
  }

  Widget bottomNavigationBarBuilder() {
    return Theme(
      data: ThemeData().copyWith(canvasColor: AppThemeColor.primary),
      child: BottomNavigationBar(
        iconSize: 35.0,
        selectedItemColor: AppThemeColor.accent,

        currentIndex: currentIndex,

        onTap: (index){
          currentIndex = index;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icQuran)),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icAhadeeth)),
            label: 'Ahadeeth',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icSebha)),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.icRadio)),
            label: 'Radio',
          ),
        ],
      ),
    );
  }
}