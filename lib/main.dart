import 'package:flutter/material.dart';
import 'package:quizzy/splash_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzy",
      theme: ThemeData(
        primarySwatch: Colors.indigo,

      ),
      home: SplashScreen(),

    );
  }
}