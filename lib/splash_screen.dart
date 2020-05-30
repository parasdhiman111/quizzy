import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzy/home.dart';

class SplashScreen extends StatefulWidget
{
  @override
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=>HomeScreen(),

      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body:
      Center(
      child:
      Text(

        "Quizzy",
        style:TextStyle(
          fontSize: 60.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "Cabin"
        ) ,
      ),
      ),
    );
  }
}