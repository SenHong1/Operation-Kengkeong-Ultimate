// ignore_for_file: use_key_in_widget_constructors, file_names
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ok_upp/routerPage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/OKUbaymax.png'),
      nextScreen: RouterPage(),
      splashIconSize: 450,
      duration: 3500,
      backgroundColor: const Color.fromARGB(255, 255, 230, 230),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      // animationDuration: const Duration(seconds: 1),
    );
  }
}