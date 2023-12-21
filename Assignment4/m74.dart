import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDataSecondScreen1 extends StatelessWidget {
  var name;
  MyDataSecondScreen1({super.key, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Show the data in second screen"),
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
