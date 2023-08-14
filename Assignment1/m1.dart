import 'dart:io';

void main()
{
  print("Enter your name:");
  String? name = stdin.readLineSync()!;
  
  print("Enter your birth date:");
  String? date = stdin.readLineSync()!;

  print("Enter your age:");
  int? age = int.parse(stdin.readLineSync()!);

  print("Enter your address");
  String? address = stdin.readLineSync()!;

  print("Name = $name");
  print("Date = $date");
  print("Age = $age");
  print("Address = $address");
}