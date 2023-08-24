import 'dart:io';

void main()
{
  print("Enter a year:");
  int? year = int.parse(stdin.readLineSync()!);
  
  if(year % 400 == 0)
  {
    print("$year is a LEAP year");
  }
  else if(year % 100 == 0)
  {
    print("$year is NOT a LEAP year");
  }
  else if(year % 4 == 0)
  {
    print("$year is a LEAP year");
  }
  else
  {
    print("$year is NOT a leap year");
  }
}