import 'package:flutter/material.dart';
import 'package:quizzera/question_repo.dart';
import 'package:quizzera/quiz_score.dart';
import 'package:quizzera/score_data.dart';

void main() => runApp(Quizzera());

class Quizzera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/avengers.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: QuizPage(),
              ),
            ),
          ),
        ),
        routes: {QuizScore.routeName: (context) => QuizScore()});
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

QuestionRepo questionRepo = QuestionRepo();

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int scoreCount = 0;

  void checkAns(bool userAns) {
    setState(() {
      if (questionRepo.isFinished() == true) {
        print(scoreCount.toString());

        Navigator.pushNamed(
          context,
          QuizScore.routeName,
          arguments: ScoreData(scoreCount),
        );

        questionRepo.resetQuestion();
        scoreKeeper = [];
      } else {
        if (userAns == questionRepo.getAns()) {
          scoreCount++;
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          print(scoreCount.toString());
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          print(scoreCount.toString());
        }
        questionRepo.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Text(
            "Quizzera",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Pacifico",
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionRepo.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: OutlineButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: OutlineButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
