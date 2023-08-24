void main() {
  var num = 1;
  for (var i = 1; i <= 5; i++) {
    String line = "";
    for (var j = 1; j <= i; j++) {
      line += num.toString();
      num++;
    }
    print(line);
  }
}
