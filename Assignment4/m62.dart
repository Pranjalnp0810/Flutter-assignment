import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              alertDialog(context);
            },
            child: Text("Alert Dialog")),
      ),
    );
  }
}

void alertDialog(BuildContext context) {
  AlertDialog alertDialog = new AlertDialog(
    backgroundColor: Colors.yellow[300],
    title: Text(
      "Alert",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Text("Are you sure you want to close?"),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            SystemNavigator.pop();
          },
          child: Text("Yes")),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("No"))
    ],
  );
  showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
