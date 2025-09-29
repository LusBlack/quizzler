
import 'package:flutter/material.dart';

//import 'question.dart';
import 'quiz_brain.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.
//import 'quiz_brain.dart';

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
  List<Icon> scoreKeeper = [
    Icon(
      Icons.emoji_emotions,
      color: Colors.green
    ),
    Icon(
      Icons.sentiment_very_dissatisfied,
      color: Colors.red
    )
  ];


  int questionNumber = 0;


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
                  quizBrain.questionBank[questionNumber].questionText,
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
          //child: Container(
            //color: Colors.green,
            //child: Expanded(
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
                    bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                    if(correctAnswer == true) {
                       scoreKeeper.add(
                        Icon(Icons.emoji_emotions, color: Colors.green)
                      );
                    } else {
                        scoreKeeper.add(Icon(Icons.sentiment_very_dissatisfied, color: Colors.red));
                    }
                    setState(() {
                      questionNumber++;
                    });
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
                bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
              if(correctAnswer == false) {
                scoreKeeper.add(
                  Icon(Icons.emoji_emotions, color: Colors.green)
                );
              } else {
                  scoreKeeper.add(Icon(Icons.sentiment_very_dissatisfied, color: Colors.red));
              }
              setState((){
                questionNumber++;
              });
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


