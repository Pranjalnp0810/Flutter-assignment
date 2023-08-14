import 'dart:io';

void main()
{
  print("Enter the HEIGHT of the triangle:");
  int? h = int.parse(stdin.readLineSync()!);

  print("Enter the BASE of the triangle:");
  int? b = int.parse(stdin.readLineSync()!);

  var A = (h * b) / 2;
  print("Area = $A");
}