import 'package:flutter/material.dart';
import 'button.dart';
import 'package:math_expressions/math_expressions.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var question = '';
  var answer = '';

  List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '00',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    // Operator button
    bool isOperator(String x) {
      if (x == '%' ||
          x == '/' ||
          x == 'x' ||
          x == '-' ||
          x == '+' ||
          x == '=') {
        return true;
      } else {
        return false;
      }
    }

    // equal button (show answer)
    void equalPressed() {
      String finalQuestion = question;
      // change x into *
      finalQuestion = finalQuestion.replaceAll('x', '*');
      // parse the question
      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);
      // bind the variables
      ContextModel cm = ContextModel();
      // evaluate expression
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      answer = eval.toString();
    }

    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: [
          // Display Question and Answer
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  // Question
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      question,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  // Answer
                  Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Button For Calculator
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button AC
                    if (index == 0) {
                      return CalculatorButton(
                          onPressed: () {
                            setState(() {
                              question = '';
                              answer = '';
                            });
                          },
                          buttonText: buttons[index],
                          textColor: Colors.white,
                          color: Colors.green);
                    }
                    // Delete Button DEL
                    else if (index == 1) {
                      return CalculatorButton(
                        onPressed: () {
                          setState(() {
                            if (question.length > 0) {
                              question =
                                  question.substring(0, question.length - 1);
                            } else {
                              question = '';
                            }
                          });
                        },
                        buttonText: buttons[index],
                        textColor: Colors.white,
                        color: Colors.red,
                      );
                    }

                    // Equal Button =
                    else if (index == buttons.length - 1) {
                      return CalculatorButton(
                        onPressed: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        color: isOperator(buttons[index])
                            ? Colors.deepOrange[400]
                            : Colors.deepOrange[50],
                      );
                    }
                    // Operator and Number
                    else {
                      return CalculatorButton(
                        onPressed: () {
                          setState(() {
                            question += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                        color: isOperator(buttons[index])
                            ? Colors.deepOrange[400]
                            : Colors.deepOrange[50],
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
