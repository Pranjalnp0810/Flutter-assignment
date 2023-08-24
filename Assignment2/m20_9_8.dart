import 'dart:io';

void main() {
  for (var i = 1; i <= 5; i++) {
    for (var k = 5; k >= i; k--) {
      stdout.write(" ");
    }
    for (var j = 1; j <= i; j++) {
      stdout.write("$i ");
    }
    stdout.writeln();
  }
}
