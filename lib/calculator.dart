// calculator.dart
int add(String numbers) {
  // base case
  if (numbers.isEmpty) return 0;

  // Here it'll replace the \n value with ','(delimiter)
  final replacedNumbers = numbers.replaceAll('\n', ',');
  return replacedNumbers.split(',').map(int.parse).reduce((a, b) => a + b);
}
