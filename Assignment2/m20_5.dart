import 'dart:io';

void main() {
  print("Enter a number:");
  var n = int.parse(stdin.readLineSync()!);

  for (var i = n; i >= 1; i--) {
    print(i);
  }
}
