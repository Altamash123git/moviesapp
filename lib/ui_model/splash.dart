import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviesapp/ui_model/dashboard_page.dart';
import 'package:moviesapp/ui_model/homepage.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),()async{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>DashboardPage()));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: (Colors.black),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 60),
        alignment: Alignment.center,

        width: MediaQuery.of(context).size.width*0.7,
        height:MediaQuery.of(context).size.height*0.7 ,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/2101122136/photo/woman-hand-holding-tv-remote.jpg?s=2048x2048&w=is&k=20&c=TxqxGsd7GQY_k53iCa71m_3UG2LHoxtcbDJ0jmLRUp4=")
          ,fit: BoxFit.contain)
        ),
      ),
    );
  }
}
