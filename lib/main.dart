
import 'package:contact_app/ui/home/screen/home_screen.dart';
import 'package:contact_app/ui/splach/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routName: (_) => SplashScreen(),
        HomeScreen.routName: (_) => HomeScreen()
      },
      initialRoute: SplashScreen.routName,
    );
  }
}
