import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _total_score = 0;

  final _questions = const [
    {
      'questionText': 'Whats you color?',
      'answers': [
        {'text' : 'Black', 'score' : 10},
        {'text' : 'Red', 'score' : 5},
        {'text' : 'Green', 'score' : 2},
        {'text' : 'White', 'score' : 1}
      ],
    },
    {
      'questionText': 'Whats you animal?',
      'answers': [
        {'text' : 'Rabbit', 'score' : 10},
        {'text' : 'Snake', 'score' : 5},
        {'text' : 'Elephant', 'score' : 2},
        {'text' : 'Lion', 'score' : 1}
      ],
    },
    {
      'questionText': 'Who you instructor?',
      'answers': [
        {'text' : 'Max', 'score' : 10},
        {'text' : 'Max', 'score' : 5},
        {'text' : 'Max', 'score' : 2},
        {'text' : 'Max', 'score' : 1}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _total_score = 0;
    });
  }

  void _answerQuestion(int score) {
    _total_score += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
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
            : Result(_total_score, _resetQuiz),
      ),
    );
  }
}
