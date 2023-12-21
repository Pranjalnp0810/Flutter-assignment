import 'package:assignment_4/m78_main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My78Example1 extends StatefulWidget {
  List name;
  My78Example1({super.key, required this.name});

  @override
  State<My78Example1> createState() => _My78Example1State();
}

class _My78Example1State extends State<My78Example1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add name and show "),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("hello"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => My78Example(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
