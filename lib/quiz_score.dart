import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzera/score_data.dart';

class QuizScore extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScoreData args = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Text(
          args.score.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
