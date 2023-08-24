void main() {
  // Creating a Map to store student information
  Map<String, int> studentScores = {
    'Alice': 95,
    'Bob': 80,
    'Carol': 92,
    'David': 88,
  };

  // Printing the original map
  print("Original student scores: $studentScores");

  // Adding a new student to the map
  studentScores['Eve'] = 75;
  print("Student scores after adding 'Eve': $studentScores");

  // Getting the score of a specific student
  var bobScore = studentScores['Bob'];
  print("Bob's score: $bobScore");

  // Checking if a student exists in the map
  bool hasAlice = studentScores.containsKey('Alice');
  print("Does the map contain 'Alice'? $hasAlice");

  // Iterating through the map
  print("Student scores:");
  studentScores.forEach((student, score) {
    print("$student: $score");
  });

  // Removing a student from the map
  studentScores.remove('David');
  print("Student scores after removing 'David': $studentScores");

  // Creating a copy of the map
  Map<String, int> copiedMap = Map.from(studentScores);
  print("Copied student scores: $copiedMap");

  // Clearing all entries from the map
  studentScores.clear();
  print("Student scores after clearing all entries: $studentScores");
}
