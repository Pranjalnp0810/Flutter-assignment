import 'dart:io';

void main()
{
  print("Enter the Temperature in Degree Centigrade:");
  int? C = int.parse(stdin.readLineSync()!);

  var F = (1.8 * C) + 32;
  print("Fahrenheit= $F");
}