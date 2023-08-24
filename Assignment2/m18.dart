import 'dart:io';

void main()
{
  String? menu = """
                    1) Addition
                    2) Substraction
                    3) Multiplicaton
                    4) Division
                 """;
  print(menu);

  print("Enter your choice:");
  var choice = int.parse(stdin.readLineSync()!);

  switch (choice)
  {
    case 1:
      print("---> Addition <---");
      print("Enter first number:");
      var num1 = int.parse(stdin.readLineSync()!);
      print("Enter second number:");
      var num2 = int.parse(stdin.readLineSync()!);
      var add = num1 + num2;
      print("Addition = $add");
      break;

    case 2:
      print("---> Substraction <---");
      print("Enter first number:");
      var num1 = int.parse(stdin.readLineSync()!);
      print("Enter second number:");
      var num2 = int.parse(stdin.readLineSync()!);
      var sub = num1 - num2;
      print("Substraction = $sub");
      break;

    case 3:
      print("---> Multiplication <---");
      print("Enter first number:");
      var num1 = int.parse(stdin.readLineSync()!);
      print("Enter second number:");
      var num2 = int.parse(stdin.readLineSync()!);
      var mul = num1 * num2;
      print("Multiplication = $mul");
      break;

    case 4:
      print("---> Division <---");
      print("Enter first number:");
      var num1 = int.parse(stdin.readLineSync()!);
      print("Enter second number:");
      var num2 = int.parse(stdin.readLineSync()!);
      var div = num1 / num2;
      print("Division = $div");
      break;

    default:
      print("Invalid...");
  }
}