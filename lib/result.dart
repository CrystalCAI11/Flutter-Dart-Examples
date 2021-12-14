import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    // 动态结果用get声明
    String resultText;
    if (resultScore <= 25) {
      resultText = 'You are cool!';
    } else {
      resultText = 'You are great!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: Text('Restart!'),
          ),
        ],
      ),
    );
  }
}
