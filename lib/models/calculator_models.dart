class CalculatorModel {
  String input = '';
  String result = '0';

  void clear() {
    input = '';
    result = '0';
  }

  void appendInput(String value) {
    input += value;
  }

  void setResult(String newResult) {
    result = newResult;
  }
}
