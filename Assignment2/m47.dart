void main() {
  List<int> numbers = [5, 10, 15, 20, 25];

  print("Original list: $numbers");

  numbers.add(30);
  print("List after adding 30: $numbers");

  print("Length of the list: ${numbers.length}");

  int secondNumber = numbers[1];
  print("Second number in the list: $secondNumber");

  numbers[3] = 22;
  print("List after updating index 3: $numbers");

  numbers.remove(15);
  print("List after removing 15: $numbers");

  numbers.removeAt(0);
  print("List after removing element at index 0: $numbers");

  bool contains20 = numbers.contains(20);
  print("Does the list contain 20? $contains20");

  numbers.sort();
  print("Sorted list: $numbers");

  numbers = numbers.reversed.toList();
  print("Reversed list: $numbers");
}
