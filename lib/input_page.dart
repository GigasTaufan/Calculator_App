import 'package:flutter/material.dart';
import 'button.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
    return Scaffold(
      backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: [
          // Display
          Expanded(
            child: Container(),
          ),
          // Button
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CalculatorButton(
                          buttonText: buttons[index],
                          textColor: Colors.white,
                          color: Colors.green);
                    } else if (index == 1) {
                      return CalculatorButton(
                        buttonText: buttons[index],
                        textColor: Colors.white,
                        color: Colors.red,
                      );
                    } else {
                      return CalculatorButton(
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

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }
}
