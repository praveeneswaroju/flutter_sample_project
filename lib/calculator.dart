int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String delimiter = ',|\n';
  String numString = numbers;

  if (numbers.startsWith('//')) {
    final delimiterLine = numbers.split('\n')[0];
    delimiter = RegExp.escape(delimiterLine[2]);
    numString = numbers.substring(numbers.indexOf('\n') + 1);
  }

  final pattern = RegExp('[$delimiter]');
  final values = numString.split(pattern).map(int.parse).toList();

  final negatives = values.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('Negatives not allowed: ${negatives.join(', ')}');
  }

  return values.reduce((a, b) => a + b);
}
