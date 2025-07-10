// lib/calculator.dart

int add(String numbers) {
  if (numbers.isEmpty) return 0;

  String delimiterPattern = ',|\\n';
  String numString = numbers;

  // Custom delimiter handling
  if (numbers.startsWith('//')) {
    final delimiterEndIndex = numbers.indexOf('\n');
    final delimiterPart = numbers.substring(2, delimiterEndIndex);

    final customDelimiters = <String>[];
    final delimiterRegex = RegExp(r'\[(.*?)\]');
    final matches = delimiterRegex.allMatches(delimiterPart);

    // Handles [***], [#], [%%]
    if (matches.isNotEmpty) {
      for (final match in matches) {
        customDelimiters.add(RegExp.escape(match.group(1)!));
      }
    } else {
      // Single-char delimiter like //;\n1;2
      customDelimiters.add(RegExp.escape(delimiterPart));
    }

    delimiterPattern = customDelimiters.join('|');
    numString = numbers.substring(delimiterEndIndex + 1);
  }

  final pattern = RegExp(delimiterPattern);
  final values = numString.split(pattern).map(int.parse).toList();

  return values.fold(0, (sum, n) => sum + n);
}
