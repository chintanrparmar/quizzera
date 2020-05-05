import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzera/score_data.dart';

class QuizScore extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScoreData args = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/avengers_logo.png'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Text(
                args.scoreResultText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
