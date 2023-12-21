import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  List<String> flutterLifecycle = [
    'createState()',
    'initState()',
    'didChangeDependencies()',
    'build()',
    'didUpdateWidget()',
    'setSate()',
    'deActivate()',
    'dispose()'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SanckBar Example "),
      ),
      body: ListView.builder(
        itemCount: flutterLifecycle.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "${flutterLifecycle[index]}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  selectionColor: Colors.amber,
                ),
                backgroundColor: Colors.grey,
              ));
            },
            title: Text(
              "${flutterLifecycle[index]}",
              style: TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
