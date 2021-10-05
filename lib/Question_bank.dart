import 'package:question/Question.dart';

class Quiz {
  int _questionIndex = 0;

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
    _question.length - 1 > _questionIndex ? _questionIndex++ : _questionIndex;
  }
}
