import 'dart:io';

void main() {
  print("Enter the number:");
  var n = int.parse(stdin.readLineSync()!);

  for (var i = 1; i <= 10; i++) {
    var num = n * i;
    print("$n * $i = $num");
  }
}
