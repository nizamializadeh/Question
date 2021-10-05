import 'package:flutter/material.dart';
import 'package:question/const.dart';

import 'Question_bank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Quiz quiz_1 = Quiz();
  void buttonFunc(bool choosButton) {
    if (quiz_1.getEndQuestion() == true) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Complite Question'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Correct Answers"),
                  Text(quiz_1.getTrueAnswers()),
                  Text("False Answers"),
                  Text(quiz_1.getFalseAnswers())
                  // Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    quiz_1.getResetQuestion();
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (quiz_1.getQuestionAnswer() == choosButton) {
          quiz_1.choose.add(KfalseIcon);
          quiz_1.getFalsePlus();
        } else {
          quiz_1.choose.add(KtrueIcon);
          quiz_1.getCorrectPlus();
        }
        quiz_1.getNextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              quiz_1.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 4,
          runSpacing: 5,
          children: quiz_1.choose,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    onPressed: () {
                      buttonFunc(true);
                    },
                    color: Colors.red[400],
                    child: Icon(Icons.thumb_down),
                    textColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      buttonFunc(false);
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.green[400],
                    child: Icon(
                      Icons.thumb_up,
                    ),
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
