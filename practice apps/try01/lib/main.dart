import 'package:flutter/material.dart';
import 'package:try01/result.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(
    MyApp()); // this is a shorthand technique used to call the main function

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //adding underscore turns a public class into a private classs
  final _questions = const [
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Blue', 'score': 4},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favourite pet?',
      'answers': [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 6},
        {'text': 'Rabbit', 'score': 16},
        {'text': 'Turtle', 'score': 20}
      ],
    },
    {
      'questionText': 'How many months have 28 days?',
      'answers': [
        {'text': '2', 'score': 6},
        {'text': '1', 'score': 10},
        {'text': 'All of them', 'score': 7},
        {'text': 'Depends if there\'s a leap year or not', 'score': 1}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

void _resetQuiz() {
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;
  });
}

  void _answerQuestion( int score) {

    _totalScore += score;
    setState(() { // setState always retriggers thee build method of the app and the widget tree is rebuilt
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more Questions!');
    } else {
      print("No more questions left!");
    }
    // print('Answer Chosen!');
  }

  @override // to make it clear that u r deliberately overriding the given class
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
