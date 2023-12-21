import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDisplaySum1 extends StatelessWidget {
  var number;
  MyDisplaySum1({super.key, @required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Addition of two numbers is here")),
      body: Center(
        child: Text(
          number,
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
