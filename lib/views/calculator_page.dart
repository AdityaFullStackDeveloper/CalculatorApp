import 'package:flutter/material.dart';
import 'package:calculator_app/models/calculator_models.dart';
import 'package:calculator_app/controllers/calculator_controller.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late CalculatorModel _model;
  late CalculatorController _controller;

  @override
  void initState() {
    super.initState();
    _model = CalculatorModel();
    _controller = CalculatorController(_model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Display user input
                  Text(
                    _model.input,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Display result (conditionally, if non-empty)
                  if (_model.result.isNotEmpty)
                    Text(
                      _model.result,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _controller.onButtonClick(buttons[index]);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: buttons[index] == 'DEL'
                        ? const Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 24,
                    )
                        : Text(
                      buttons[index],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> buttons = [
  'C', 'DEL', '(', ')',
  '7', '8', '9', '÷',
  '4', '5', '6', 'x',
  '1', '2', '3', '-',
  '0', '.', '=', '+',
];
