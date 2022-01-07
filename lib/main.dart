import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'House Rent',
      home: AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset('assets/images/villa.png'),
        nextScreen: LoginScreen(),
        
      ),
    );
  }
}