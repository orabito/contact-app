import 'dart:async';



import 'package:flutter/material.dart';

import '../../../style/reusable_components/assets_manager.dart';
import '../../../style/reusable_components/colors_manager.dart';
import '../../home/screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    });


  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary,
        body: Center(
          child: Image.asset(
            AssetsManager.splash,
            fit: BoxFit.cover,

          ),
        ),
      ),
    );
  }
}