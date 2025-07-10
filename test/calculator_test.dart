// test/calculator_test.dart
import 'package:test/test.dart';
import 'package:flutter_sample_project/calculator.dart';

void main() {
  test('Empty string returns 0', () {
    expect(add(''), 0);
  });
  test('Single number returns itself', () {
    expect(add('2'), 2);
  });
  test('Two numbers comma-separated returns their sum', () {
    expect(add('1,2'), 3);
  });
  test('Newlines are also valid delimiters', () {
    expect(add('2\n3,5'), 10);
  });
  test('Supports different delimiters like //;1;2', () {
    expect(add('//;\n1;2'), 3);
  });
  test('Throws exception for negative numbers', () {
    expect(
      () => add('1,-2,3,-4'),
      throwsA(
        predicate(
          (e) =>
              e is Exception &&
              e.toString().contains('Negatives not allowed: -2, -4'),
        ),
      ),
    );
  });
  test('Numbers greater than 1000 are ignored', () {
    expect(add('2,1002'), 2);
  });
  test('Custom delimiter of any length', () {
    expect(add('//[***]\n1***2***3'), 6);
  });
}
