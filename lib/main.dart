import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/hadith_screen/hadith_screen.dart';
import 'package:islami/ui/home_screen/home_screen.dart';
import 'package:islami/ui/surah_screen/surah_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

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

      locale: Locale(provider.currentLanguage),

      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SurahScreen.routeName : (_) => SurahScreen(),
        HadithScreen.routeName : (_) => HadithScreen(),
      },

      initialRoute: HomeScreen.routeName,

      debugShowCheckedModeBanner: false,

      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,

    );
  }
}
