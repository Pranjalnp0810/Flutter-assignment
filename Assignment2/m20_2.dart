import 'dart:io';

void main() {
  print("Enter a number:");
  var num = int.parse(stdin.readLineSync()!);
  var f = 1;
  for (var i = num; i >= 1; i--) {
    f *= i;
  }
  print("Factorial = $f");
}
