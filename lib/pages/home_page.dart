import 'package:caculatorapp/ultis/button_action.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textInput = '';
  var textOutput = '';

  final myTextColor = TextStyle(fontSize: 38, color: Colors.deepPurple[900]);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textInput,
                    style: myTextColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    textOutput,
                    style: myTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ButtonAction(
                    onTap: () {
                      setState(() {
                        textInput = '';
                      });
                    },
                    textButton: buttons[index],
                    color: Colors.green,
                    textColor: Colors.white,
                  );
                } else if (index == 1) {
                  return ButtonAction(
                    onTap: () {
                      setState(() {
                        if (textInput.isNotEmpty) {
                          textInput =
                              textInput.substring(0, textInput.length - 1);
                        }
                      });
                    },
                    textButton: buttons[index],
                    color: Colors.red,
                    textColor: Colors.white,
                  );
                } else if (index == buttons.length - 1) {
                  return ButtonAction(
                    onTap: () {
                      setState(() {});
                    },
                    textButton: buttons[index],
                    color: Colors.brown,
                    textColor: Colors.white,
                  );
                } else {
                  return ButtonAction(
                    onTap: () {
                      setState(() {
                        textInput += buttons[index];
                      });
                    },
                    textButton: buttons[index],
                    color: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.deepPurple[50],
                    textColor: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
