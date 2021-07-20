import 'package:flutter/material.dart';
import 'package:new_flutter/button.dart';
import './question.dart';
import './button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questionText = ["What is your Name?", "Who are you?"];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("My First App"),
            ),
            body: new IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                      child: Button(
                          10, "Mishrat", answerQuestion, Colors.indigoAccent)),
                  Flexible(
                    child: Button(10, 'Aakash', answerQuestion, Colors.teal),
                  ),
                  Flexible(
                    child: Button(
                        10, 'Shubham', answerQuestion, Colors.deepPurpleAccent),
                  ),
                  Flexible(
                    child: Button(
                        10, 'Shivani', answerQuestion, Colors.orangeAccent),
                  )
                ],
              ),
            )));
  }
}
