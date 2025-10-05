
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



import 'quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {

    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState((){
       if(quizBrain.isFinished() == true) {
        scoreKeeper.clear();
        // var duration = const Duration(seconds: 3);
        //  sleep(duration);
          Alert(
            context: context,
            title: "Finished",
            desc: "You've reached the end of the quiz.",
          ).show();
           
           quizBrain.reset();
         
          quizBrain.nextQuestion();
          
        } 
      });
    if(correctAnswer == userAnswer) {
      scoreKeeper.add(
        Icon(Icons.emoji_emotions, color: Colors.green)
      );
    } else {
        scoreKeeper.add(Icon(Icons.sentiment_very_dissatisfied, color: Colors.red));
      }
        quizBrain.nextQuestion();
  }
  
 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain.getQuestionText(),
                  quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
              child: Padding(
                 padding: EdgeInsets.all(20.0),
                child: TextButton(
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),
                  //textColor: Colors.white,
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            //),
          //),
        ),
        
      Expanded(
        child: Padding(
            padding: EdgeInsets.all(20.0),
          child: TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
            child: Text(
              'False',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
              onPressed: () {
                checkAnswer(false);
            },
          ),
        ),
      ),
        
        Row(
          children: scoreKeeper,
          ),
        
      ],
    );
  }
}


