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
}
