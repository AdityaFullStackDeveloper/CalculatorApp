import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/models/calculator_models.dart';

class CalculatorController {
  final CalculatorModel _model;

  CalculatorController(this._model);

  String get input => _model.input;

  String get result => _model.result;

  void onButtonClick(String value) {
    if (value == 'C') {
      _model.clear();
    } else if (value == 'DEL') {
      _model.backspace();
    } else if (value == '=') {
      try {
        _model.setResult(_evaluateExpression(_model.input));
      } catch (e) {
        _model.setResult('Error');
      }
    } else {
      _model.appendInput(value);
    }
  }

  String _evaluateExpression(String input) {
    input = input.replaceAll('x', '*').replaceAll('÷', '/');
    Parser parser = Parser();
    Expression exp = parser.parse(input);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm).toString();
  }
}
