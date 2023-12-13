import 'package:flutter/material.dart';

class MyBackgroundColor extends StatefulWidget {
  const MyBackgroundColor({super.key});

  @override
  State<MyBackgroundColor> createState() => _MyBackgroundColorState();
}

class _MyBackgroundColorState extends State<MyBackgroundColor> {
  bool status = true;
  Color? colorName = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: colorName,
            height: 600,
            width: 500,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (status) {
                  colorName = Colors.blue;
                  status = false;
                } else {
                  colorName = Colors.yellow;
                  status = true;
                }
              });
            },
            child: Text("Click"),
          ),
        ],
      ),
    );
  }
}
