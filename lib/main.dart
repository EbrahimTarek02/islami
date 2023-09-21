import 'package:flutter/material.dart';
import 'package:islami/ui/hadith_screen/hadith_screen.dart';
import 'package:islami/ui/home_screen/home_screen.dart';
import 'package:islami/ui/surah_screen/surah_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],

      locale: Locale('en'),

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
