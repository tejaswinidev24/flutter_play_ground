import 'package:flutter/material.dart';
//import './question.dart';
//import './answer.dart';
import './quiz.dart';
import './result.dart';


void main(){
  runApp(MyApp());

}

class MyApp extends StatefulWidget {

 @override
   State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //MyAppState is private _ is a special syntax 
  }

}
class _MyAppState extends State<MyApp>{ //MyAppState can be used only inside main.dart
  var index = 0;
  var questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': ['red', 'black', 'blue']
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': ['rabbit', 'cat', 'dog']
    }
    
    ];
  void answerQuestion(){

   setState(() {
      index += 1;
   });

    print('Answer selected!');
    if(index < questions.length)
    {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('First App')
        ),
        body: index < questions.length ? 
          Quiz(
            answerQuestion: answerQuestion,
            index: index,
            questions: questions,
          )
        : Result()
    ),
    );
  }
}