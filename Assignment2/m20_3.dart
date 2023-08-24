import 'dart:io';

void main() {
  print("Enter the number of elements:");
  var n = int.parse(stdin.readLineSync()!);
  var n1 = 0;
  var n2 = 1;
  print(n1);
  print(n2);
  for (var i = 3; i <= n; i++) {
    var num = n1 + n2;
    n1 = n2;
    n2 = num;

    print(num);
  }
}
