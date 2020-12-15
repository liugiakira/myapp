import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'Whats you color?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'Whats you animal?',
      'answers': ['Rabbit', 'Seek', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who you instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length - 1) {
      print('We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions,)
            : Result(),
      ),
    );
  }
}
