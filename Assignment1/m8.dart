import 'dart:io';

void main()
{
  print("Enter the marks of subject 1:");
  int? sub1 = int.parse(stdin.readLineSync()!);

  print("Enter the marks of subject 2:");
  int? sub2 = int.parse(stdin.readLineSync()!);

  print("Enter the marks of subject 3:");
  int? sub3 = int.parse(stdin.readLineSync()!);

  print("Enter the marks of subject 4:");
  int? sub4 = int.parse(stdin.readLineSync()!);

  print("Enter the marks of subject 5:");
  int? sub5 = int.parse(stdin.readLineSync()!);

  var sum = sub1 + sub2 + sub3 + sub4 + sub5;
  print("Total marks = $sum");

  var per = sum / 5;
  print("Percentage = $per");
}