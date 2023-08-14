import 'dart:io';

void main()
{
  print("Enter a number:");
  int? num = int.parse(stdin.readLineSync()!);

  var sq = num * num;
  var cu = num * num * num;

  print("Square = $sq");
  print("Cube = $cu");
}