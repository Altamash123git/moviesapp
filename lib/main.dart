import 'package:flutter/material.dart';
import 'package:moviesapp/ui_model/dashboard_page.dart';
import 'package:moviesapp/ui_model/homepage.dart';
import 'package:moviesapp/ui_model/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: SplashScreen(),
    );
  }
}

