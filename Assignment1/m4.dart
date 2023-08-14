import 'dart:io';

void main()
{
  var pi = 3.14;
  print("Enter the radius of circle:");
  int? r = int.parse(stdin.readLineSync()!);

  var a = pi * r * r;
  print("Area = $a");
}