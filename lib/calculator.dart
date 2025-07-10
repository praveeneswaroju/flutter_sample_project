// calculator.dart
int add(String numbers) {
  if (numbers.isEmpty) return 0; // empty string return 0
  //return int.parse(numbers); // single number return itself
  if (!numbers.contains(',')) return int.parse(numbers);
  return numbers.split(',').map(int.parse).reduce((a, b) => a + b);
}
