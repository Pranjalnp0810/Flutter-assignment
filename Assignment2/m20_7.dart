import 'dart:io';

int calculateDigitSum(int number) {
  int digitSum = 0;
  String numStr = number.toString();

  for (int i = 0; i < numStr.length; i++) {
    digitSum += int.parse(numStr[i]);
  }

  return digitSum;
}

void main() {
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  int result = calculateDigitSum(num);

  print("Summation of digits: $result");
}
