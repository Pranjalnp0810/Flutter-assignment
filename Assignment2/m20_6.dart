import 'dart:io';

int findMaxDigit(int number) {
  number = number.abs();
  int maxDigit = 0;

  while (number > 0) {
    int digit = number % 10;
    if (digit > maxDigit) {
      maxDigit = digit;
    }
    number ~/= 10;
  }

  return maxDigit;
}

void main() {
  print("Enter a number:");
  int inputNumber = int.parse(stdin.readLineSync()!);

  int maxDigit = findMaxDigit(inputNumber);
  print("The maximum digit in the number is: $maxDigit");
}
