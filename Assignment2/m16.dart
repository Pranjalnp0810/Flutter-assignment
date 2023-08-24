import 'dart:io';

void main() {
  print("Enter first subject's marks:");
  int? sub1 = int.parse(stdin.readLineSync()!);

  print("Enter second subject's marks:");
  int? sub2 = int.parse(stdin.readLineSync()!);

  print("Enter third subject's marks:");
  int? sub3 = int.parse(stdin.readLineSync()!);

  print("Enter fourth subject's marks:");
  int? sub4 = int.parse(stdin.readLineSync()!);

  print("Enter fifth subject's marks:");
  int? sub5 = int.parse(stdin.readLineSync()!);

  var total = sub1 + sub2 + sub3 + sub4 + sub5;
  print("Total marks = $total");

  var per = total / 5;
  print("Percentage = $per %");

  if (per > 75) {
    print("Distinction");
  } else if (per > 60 && per <= 75) {
    print("First Class");
  } else if (per > 50 && per <= 60) {
    print("Second Class");
  } else if (per > 35 && per <= 50) {
    print("Pass Class");
  } else {
    print("Fail");
  }
}
