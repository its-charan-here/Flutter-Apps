import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';




class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.answerQuestion,
    @required this.questions,
    @required this.questionIndex,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<
                Map<String,
                    Object>>) // triple dots are the spread operator it helps to flatten the list along with the map function
            .map((answer) {
          // print(answer);
          return Answer(
            () => answerQuestion(answer['score']),
            answer['text'],
          ); // this gets executed only when the button is pressed so we are adding a function here which will then parse the Score
        }).toList()
      ],
    );
  }
}
