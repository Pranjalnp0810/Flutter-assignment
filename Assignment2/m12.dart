import 'dart:io';

void main()
{
  print("Enter a number:");
  int? num = int.parse(stdin.readLineSync()!);
  var c=0;

  for(var i=1; i<=num; i++)
  {
    if(num % i == 0)
    {
      c++;
    }
  }
  if(c == 2)
  {
    print("It is Prime Number");
  }
  else
  {
    print("It is not prime number");
  }
}