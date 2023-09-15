import 'package:flutter/material.dart';
import 'package:islami/ui/hadith_screen/hadith_screen.dart';
import 'package:islami/ui/home_screen/home_screen.dart';
import 'package:islami/ui/surah_screen/surah_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SurahScreen.routeName : (_) => SurahScreen(),
        HadithScreen.routeName : (_) => HadithScreen(),
      },

      initialRoute: HomeScreen.routeName,
    );
  }
}
