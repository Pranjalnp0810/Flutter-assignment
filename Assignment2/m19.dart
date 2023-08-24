import 'dart:io';

void main()
{
  String? menu = """
                    1) Area of Triangle
                    2) Area of Rectangle
                    3) Area of Circle
                 """;
  print(menu);

  print("Enter your choice:");
  var choice = int.parse(stdin.readLineSync()!);

  if(choice == 1)
  {
    print("--- Area of Triangle ---");
    print("Enter the HEIGHT of triangle:");
    var h = int.parse(stdin.readLineSync()!);
    print("Enter the BASE of triangle:");
    var b = int.parse(stdin.readLineSync()!);

    var a = (h * b) / 2;
    print("Area of Triangle = $a");
  }
  else if(choice == 2)
  {
    print("--- Area of Rectangle ---");
    print("Enter the LENGTH of rectangle:");
    var l = int.parse(stdin.readLineSync()!);
    print("Enter the WIDTH of rectangle:");
    var w = int.parse(stdin.readLineSync()!);

    var a = l * w;
    print("Area of Rectangle = $a");
  }
  else if(choice == 3)
  {
    var pi = 3.14;
    print("--- Area of Circle ---");
    print("Enter the RADIUS of circle:");
    var r = int.parse(stdin.readLineSync()!);

    var a = pi * r * r;
    print("Area of circle = $a");
  }
  else
  {
    print("Invalid Choice...");
  }
}