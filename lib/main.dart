import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp()); // build main widget and calls build()
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// 前面加个_表示 private 只能在这个文件里调用
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is ur favorite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 8},
        {'text': 'Yellow', 'score': 6},
      ],
    },
    {
      'questionText': 'What is ur favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 8},
        {'text': 'Bird', 'score': 6},
      ],
    },
    {
      'questionText': 'Who is ur best friend',
      'answers': [
        {'text': 'Tony', 'score': 10},
        {'text': 'Tony', 'score': 10},
        {'text': 'Tony', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1; // setState calls build again
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() returns a widget tree rendered onto screen
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Hello World')),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
