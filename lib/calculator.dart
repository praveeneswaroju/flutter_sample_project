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
  return numString.split(pattern).map(int.parse).reduce((a, b) => a + b);
}
