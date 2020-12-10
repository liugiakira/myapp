import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
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

    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
