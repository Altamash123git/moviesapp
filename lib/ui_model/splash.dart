import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviesapp/ui_model/homepage.dart';

class SplashScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    void initState(){

      Timer(Duration(seconds: 1),()async{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
      });
    }
    return Scaffold(
      body: Container(),
    );
  }
}
