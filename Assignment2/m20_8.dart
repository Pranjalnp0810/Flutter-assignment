import 'dart:io';

int calculateSumFirstLast(int number) {
  String numStr = number.toString();
  int firstDigit = int.parse(numStr[0]);
  int lastDigit = int.parse(numStr[numStr.length - 1]);
  return firstDigit + lastDigit;
}

void main() {
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  int result = calculateSumFirstLast(num);

  print("Sum of first and last digits: $result");
}
