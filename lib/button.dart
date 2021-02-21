import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton({this.color, this.textColor, this.buttonText});
  final color;
  final textColor;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
              ),
            ),
          ),
          color: color,
        ),
      ),
    );
  }
}
