import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  int size;
  String buttonName;
  var color;

  var questionText;

  Button(this.size, this.buttonName, this.questionText, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(buttonName),
        onPressed: questionText,
        style: ElevatedButton.styleFrom(primary: color),
      ),
    );
  }
}
