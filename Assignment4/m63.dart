import 'package:flutter/material.dart';

class MyAlert1 extends StatefulWidget {
  const MyAlert1({super.key});

  @override
  State<MyAlert1> createState() => _MyAlert1State();
}

class _MyAlert1State extends State<MyAlert1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            MyAlert(context);
          },
          child: Text("Press here"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        ),
      ),
    );
  }
}

MyAlert(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(
      "Buttons",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Text("Select your choice!"),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Positive",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
          child: Text("Positive")),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Negative",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
          child: Text("Negative")),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Neutral",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
          child: Text("Neutral")),
    ],
    elevation: 40,
    scrollable: true,
  );
  showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
