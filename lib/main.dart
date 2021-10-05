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
  List<Widget> choose = [];

  Quiz quiz_1 = Quiz();

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
          children: choose,
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
                      setState(() {
                        quiz_1.getQuestionAnswer()
                            ? choose.add(KfalseIcon)
                            : choose.add(KtrueIcon);
                        quiz_1.getNextQuestion();
                      });
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
                      setState(() {
                        quiz_1.getQuestionAnswer()
                            ? choose.add(KtrueIcon)
                            : choose.add(KfalseIcon);
                        quiz_1.getNextQuestion();
                      });
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
