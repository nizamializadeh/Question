import 'package:flutter/material.dart';
import 'package:question/Question.dart';

class Quiz {
  int _questionIndex = 0;
  int _trueAnswer = 0;
  int _falseAnswer = 0;
  List<Widget> choose = [];

  List _question = [
    Question(
        questionText: 'Titanic gelmiş geçmiş en büyük gemidir',
        questionAnswer: false),
    Question(
        questionText: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        questionAnswer: true),
    Question(
        questionText: 'Kelebeklerin ömrü bir gündür', questionAnswer: false),
    Question(questionText: 'Dünya düzdür', questionAnswer: false),
    Question(
        questionText: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        questionAnswer: true),
    Question(
        questionText: 'Fatih Sultan Mehmet hiç patates yememiştir',
        questionAnswer: true),
    Question(
        questionText: 'Fransızlar 80 demek için, 4 - 20 der',
        questionAnswer: true),
  ];

  String getQuestionText() {
    return _question[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _question[_questionIndex].questionAnswer;
  }

  void getNextQuestion() {
    if (_question.length - 1 > _questionIndex) {
      _questionIndex++;
    } else {
      for (int i = 0; i < choose.length; i++) {}
      _questionIndex = 0;
      choose = [];
    }
  }

  bool getEndQuestion() {
    if (_question.length - 1 <= _questionIndex) {
      return true;
    } else {
      return false;
    }
  }

  String getTrueAnswers() {
    return _trueAnswer.toString();
  }

  String getFalseAnswers() {
    return _falseAnswer.toString();
  }

  void getResetQuestion() {
    _questionIndex = 0;
    choose = [];
    _trueAnswer = 0;
    _falseAnswer = 0;
  }

  void getCorrectPlus() {
    _trueAnswer++;
  }

  void getFalsePlus() {
    _falseAnswer++;
  }
}
