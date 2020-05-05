import 'package:quizzera/question_data.dart';

class QuestionRepo {
  int _questionId = 0;

  List<QuestionData> _questionData = [
    QuestionData('The first infinity stone to appear was the Space Stone', true),
    QuestionData('Tony Stark is the richest Marvel character', false),
    QuestionData('The most expensive marvel movie is The Age of Ultron', true),
    QuestionData('Ned Knows Spider-Man’s Identity', true),
    QuestionData('Black Widow’s Real Name Is Diana Prince', false),
    QuestionData('Captain America was frozen for 55 years', false),
    QuestionData('Nick Fury lost his eye, because it was scratched by a cat', true),
    QuestionData('Groot has never said anything else apart from the phrase:“I am Groot”', false),
    QuestionData('Doctor Strange Protected The Reality Stone', false),
    QuestionData('Captain Marvel Got Her Powers From The Space Stone', true),
  ];

  void nextQuestion() {
    if (_questionId < _questionData.length - 1) {
      _questionId++;
    }
  }

  bool isFinished() {
    print('id $_questionId');
    print('size ${_questionData.length-1}');
    if (_questionId >= _questionData.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() => _questionId = 0;

  String getQuestionText() => _questionData[_questionId].questionText;

  bool getAns() => _questionData[_questionId].questionAns;


}
