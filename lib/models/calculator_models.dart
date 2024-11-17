class CalculatorModel {
  String _input = '';
  String _result = '';

  String get input => _input;

  String get result => _result;

  void appendInput(String value) {
    _input += value;
  }

  void setResult(String value) {
    _result = value;
  }

  void clear() {
    _input = '';
    _result = '';
  }

  void backspace() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
  }
}
