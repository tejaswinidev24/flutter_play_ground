import 'package:flutter/material.dart';

class Question extends StatelessWidget {

  final String questiontext;

  Question(this.questiontext); //creating custom widget

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:Text(questiontext, 
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
     ), 
     );
  }
}