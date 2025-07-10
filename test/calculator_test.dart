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
}
