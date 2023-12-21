import 'package:flutter/material.dart';

class MyAlert3 extends StatefulWidget {
  const MyAlert3({super.key});

  @override
  State<MyAlert3> createState() => _MyAlert3State();
}

class _MyAlert3State extends State<MyAlert3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert to close the application"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              alertExit();
            });
          },
          child: Text("Press"),
        ),
      ),
    );
  }

  alertExit() {
    AlertDialog alertDialog = AlertDialog(
      title: Text(
        "Close",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text("Do you want to close the application"),
      actions: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context, true);
              });
            },
            child: Text("Exit")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context, false);
              });
            },
            child: Text("No")),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }
}
