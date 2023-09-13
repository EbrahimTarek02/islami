import 'package:flutter/material.dart';
import 'package:islami/ui/quran_screen/quran_screen.dart';

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
        QuranScreen.routeName : (_) => QuranScreen(),
      },

      initialRoute: QuranScreen.routeName,
    );
  }
}
