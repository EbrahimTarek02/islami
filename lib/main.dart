import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/screens/hadith_content_screen/hadith_content_screen.dart';
import 'package:islami/ui/screens/home_screen/home_screen.dart';
import 'package:islami/ui/screens/splash_screen/splash_screen.dart';
import 'package:islami/ui/screens/surah_content_screen/surah_content_screen.dart';
import 'package:islami/ui/utils/app_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SettingsProvider(),
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    provider.getInitialData();

    return MaterialApp(

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      locale: Locale(provider.currentLanguage),

      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        SurahContentScreen.routeName : (_) => const SurahContentScreen(),
        HadithContentScreen.routeName : (_) => const HadithContentScreen(),
      },

      initialRoute: SplashScreen.routeName,

      debugShowCheckedModeBanner: false,

      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,

      theme: AppThemeData.lightThemeData,

      darkTheme: AppThemeData.darkThemeData,
    );
  }
}
