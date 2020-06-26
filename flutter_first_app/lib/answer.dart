import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        padding: const EdgeInsets.all(10),
        color: Colors.blue,
        splashColor: Colors.amberAccent,
        textColor: Colors.white,
            child: Text(answerText),
            onPressed: selectHandler,
            ),
    );
  }
}