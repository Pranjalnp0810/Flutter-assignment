import 'dart:io';

String getDayName(int dayNumber) {
  if (dayNumber == 1) return "Monday";
  if (dayNumber == 2) return "Tuesday";
  if (dayNumber == 3) return "Wednesday";
  if (dayNumber == 4) return "Thursday";
  if (dayNumber == 5) return "Friday";
  if (dayNumber == 6) return "Saturday";
  if (dayNumber == 7) return "Sunday";
  return "Invalid day";
}

void main() {
  stdout.write("Enter a day number (1-7): ");
  int dayNum = int.parse(stdin.readLineSync()!);

  String dayName = getDayName(dayNum);

  print("Day: $dayName");
}
