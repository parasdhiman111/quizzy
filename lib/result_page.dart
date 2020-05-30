import 'package:flutter/material.dart';
import 'package:quizzy/home.dart';

class ResultPage extends StatefulWidget {
int marks;
ResultPage({Key key,@required this.marks}) :super(key:key);

  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {
  int marks;

  List<String> resultImages=[
    "images/bad.png",
    "images/good.png",
    "images/success.png",
  ];

  String image;
  String message;

  @override
  void initState()
  {
    if(marks<20)
      {
        image=resultImages[0];
        message="You Should Try Hard..\n"
            "You Scored ${marks} marks.";
      }
    else if(marks<35)
      {
        image=resultImages[1];
        message="You Can Do Better..\n"
            "You Scored ${marks} marks.";
      }
    else
      {
        image=resultImages[2];
        message="You Did Very Well..\n"
            "You Scored ${marks} marks.";
      }
    super.initState();
  }

  _ResultPageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Material(
              elevation: 3.0,
              child: Container(

                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 15.0,

                      ),
                      child: Center(

                        child: Text(message,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Cabin",
                            fontWeight: FontWeight.w700,

                          ),),
                      ),
                    ),
                  ],
                )
              ),
            ),

          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(


                  child: Text("Continue",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Cabin",

                  ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder:(context)=>HomeScreen(),
                    ));
                  },
                  borderSide: BorderSide(width: 3.0,color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                  highlightColor: Colors.indigoAccent,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
