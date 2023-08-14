import 'dart:io';

void main()
{
  print("Enter the PRINCIPAL amount:");
  int? P = int.parse(stdin.readLineSync()!);

  print("Enter the RATE of INTEREST:");
  int? R = int.parse(stdin.readLineSync()!);

  print("Enter the TIME period:");
  int? T = int.parse(stdin.readLineSync()!);

  var SI = (P * R * T) / 100;
  print("Simple Interest = $SI");
}