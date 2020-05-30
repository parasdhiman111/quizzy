import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/result_page.dart';


class QuizPage extends StatefulWidget {


  String link;
  QuizPage({Key key,@required this.link}):super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(link);

}

class _QuizPageState extends State<QuizPage> {
  String link;
  _QuizPageState(this.link);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(link),
      builder: (context,snapshot)
      {
        List myData=json.decode(snapshot.data.toString());
        if(myData==null)
        {
          return Scaffold(
            body: Text("Loading",
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: "Cabin",
              ),
            ),
          );
        }
        else

        {
          return QuizData(myData: myData);
        }
      },
    );
  }
}


class QuizData extends StatefulWidget {

  var myData;



  List<String> jsonLink =[
    "assets/python.json",
    "assets/java.json",
    "assets/js.json",
    "assets/cpp.json",
    "assets/linux.json",
  ];

  QuizData({Key key,@required this.myData}):super(key: key);

  @override
  _QuizDataState createState() => _QuizDataState(myData);
}

class _QuizDataState extends State<QuizData> {

  var myData;
  _QuizDataState(this.myData);

  Color colorToShow =  Colors.indigoAccent;
  Color wrongAns =  Colors.red;
  Color rightAns =  Colors.green;
  int marks=0;
  int i=1;
  int timer=30;
  String showTimer="30";


  Map<String ,Color> btnColor={
    "a":Colors.indigoAccent,
    "b":Colors.indigoAccent,
    "c":Colors.indigoAccent,
    "d":Colors.indigoAccent,
  };

  bool cancelTimer=false;

  @override
  void initState()
  {
    startTimer();
    super.initState();
  }


  void startTimer() async
  {
    const oneSec= Duration(seconds: 1);
    Timer.periodic(oneSec,(Timer t)
    {
        setState(() {
          if(timer < 1)
            {
              t.cancel();
              nextQuestion();
            }
          else if(cancelTimer==true)
            {
              t.cancel();
            }


          else
            {
              timer=timer-1;

            }
          showTimer=timer.toString();

        });
    });
  }


  void nextQuestion()
  {
    cancelTimer=false;
    timer=30;
     setState(() {
       if(i<10)
         i++;
       else
       {
         Navigator.of(context).pushReplacement(MaterialPageRoute(
           builder:(context)=>ResultPage(marks: marks),
         ));
       }

       btnColor["a"]=Colors.indigoAccent;
       btnColor["b"]=Colors.indigoAccent;
       btnColor["c"]=Colors.indigoAccent;
       btnColor["d"]=Colors.indigoAccent;
     });
     startTimer();
  }


  void checkAnswer(String k)
 {
      if(myData[2][i.toString()]==myData[1][i.toString()][k])
        {
          marks= marks+5;
          colorToShow=rightAns;

        }
      else
        {
          colorToShow=wrongAns;
        }

      setState(() {
        btnColor[k]=colorToShow;
        cancelTimer=true;
      });

     Timer(Duration(seconds: 2), nextQuestion);

 }



  Widget choiceButton(String k){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,

      ),
      child: MaterialButton(
        onPressed: ()=>checkAnswer(k),
        child: Text(myData[1][i.toString()][k],
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Cabin",
          fontSize: 16.0,

        ),
        maxLines: 1,
        ),
        color: btnColor[k],
        height: 45.0,
        minWidth: 200.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        splashColor: Colors.indigo,
        highlightColor: Colors.indigo,
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
    return WillPopScope(
      onWillPop: ()
      {
        return showDialog(context:context,
            builder:(context)=> AlertDialog(
                title: Text("Quizzy"),
              content: Text("You can't go back at this Stage"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: (){
                        Navigator.of(context).canPop();
                  },
                ),
              ],
        )
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(myData[0][i.toString()],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Cabin",
                  ),),
              ),
            ),
            Expanded(
              flex: 6,

              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choiceButton("a"),
                    choiceButton("b"),
                    choiceButton("c"),
                    choiceButton("d"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showTimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cabin",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
