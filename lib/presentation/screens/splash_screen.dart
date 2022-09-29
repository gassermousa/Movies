import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_/presentation/components/colors.dart';
import 'package:movies_/presentation/screens/Layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LayoutScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkModeColor,
      body: Center(
        child: Image.asset(
          'assets/image/myLogo.png',
          fit: BoxFit.cover,
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
