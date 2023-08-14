import 'dart:io';

void main()
{
  print("Enter a number:");
  int? num1 = int.parse(stdin.readLineSync()!);

  print("Enter another number:");
  int? num2 = int.parse(stdin.readLineSync()!);

  var Add = num1 + num2;
  print("Addition = $Add");

  var Sub = num1 - num2;
  print("Substraction = $Sub");

  var Mul = num1 * num2;
  print("Multiplication = $Mul");

  var Div = num1 / num2;
  print("Division = $Div");
}