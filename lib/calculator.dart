// calculator.dart
int add(String numbers) {
  if (numbers.isEmpty) return 0; // empty string return 0
  return int.parse(numbers); // single number return itself
}
