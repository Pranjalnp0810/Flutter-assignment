import 'dart:io';

void main()
{
  print("Enter the number:");
  int? num = int.parse(stdin.readLineSync()!);

  if(num > 0)
  {
    print("Number is positive");
  }
  else 
  {
    print("Number is negative");
  }
}