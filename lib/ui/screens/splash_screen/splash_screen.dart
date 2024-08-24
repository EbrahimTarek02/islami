import 'package:flutter/material.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/screens/home_screen/home_screen.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = 'splash screen route name';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, HomeScreen.routeName)
    );
  }

  @override
  Widget build(BuildContext context) {

    SettingsProvider provider = Provider.of(context);

    return Image.asset(
        provider.isDark ? AppAssets.splashDark : AppAssets.splashLight,
      fit: BoxFit.cover,
    );
  }
}
