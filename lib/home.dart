import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzy/quiz_page.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  List<String> images=[
    "images/py.png",
    "images/java.png",
    "images/js.png",
    "images/cpp.png",
    "images/linux.png",

  ];

  List<String> jsonLink =[
    "assets/python.json",
    "assets/java.json",
    "assets/js.json",
    "assets/cpp.json",
    "assets/linux.json",
  ];

  Widget customCard(String tittle,String imageName, String url){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder:(context)=>QuizPage(link: url),
          ));
        },
        child: Material(
          color: Colors.indigo,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(

              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,

                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(imageName),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(tittle,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Cabin",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,

                  ),),

                ),

                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text("In this Quiz ,there are some questions,\n which are related to ${tittle}",
                  style: TextStyle(
                    fontFamily: "Cabin",
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp
        ]
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizzy"),

      ),
      body: ListView(
        children: <Widget>[
          customCard("Python",images[0],jsonLink[0]),
          customCard("Java",images[1],jsonLink[1]),
          customCard("Javascript",images[2],jsonLink[2]),
          customCard("C++",images[3],jsonLink[3]),
          customCard("Linux",images[4],jsonLink[4]),
        ],
      ),
    );
  }
}