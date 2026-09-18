import 'dart:async';

import 'package:flutter/material.dart';

import 'onbording/select/language_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LanguageSelectionScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0B192C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/splash_screen.png",
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              "Fun food",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0XFF6BC95B),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Nutrition Specialist",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0XFF6BC95B),
              ),
            ),
            Text(
              "Dr. Amira Ragab Khalifa",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0XFF6BC95B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
