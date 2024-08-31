import 'dart:async';

import 'package:firebase_series/screens/auth/login_screen.dart';
import 'package:firebase_series/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Lottie.network(
                  'https://lottie.host/6275bb1d-3d64-4669-b72a-d46eebc23019/W4ko0JCHeb.json'))),
    );
  }
}
