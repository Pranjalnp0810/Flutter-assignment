import 'dart:io';

void main() {
  print("Enter a number:");
  var n = int.parse(stdin.readLineSync()!);

  for (var i = 1; i <= n; i++) {
    for (var j = 1; j <= i; j++) {
      stdout.write("* ");
    }
    stdout.writeln();
  }
}
