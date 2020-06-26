import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class  Quiz extends StatelessWidget {

  final List <Map<String, Object>> questions;
  final int index;
  final Function answerQuestion;

  Quiz({this.questions, this.index, this.answerQuestion });

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
            Question(
              questions[index]['questionText'],
            ),
            ...(questions[index]['answers'] as List<String>).
            map((answer){
              return Answer(answerQuestion,answer);
            }).toList(),
            ]
        );
  }
}