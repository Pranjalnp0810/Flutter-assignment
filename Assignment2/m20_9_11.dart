void main() {
  for (int i = 1; i <= 5; i++) {
    String line = "";
    int num = i * i;
    for (int j = 1; j <= i; j++) {
      line += num.toString().padLeft(3);
    }
    print(line);
  }
}
