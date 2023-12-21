import 'package:assignment_4/m76_1.dart';
import 'package:flutter/material.dart';

class MyDisplaySum extends StatefulWidget {
  const MyDisplaySum({super.key});

  @override
  State<MyDisplaySum> createState() => _MyDisplaySumState();
}

class _MyDisplaySumState extends State<MyDisplaySum> {
  TextEditingController _num1 = TextEditingController();
  TextEditingController _num2 = TextEditingController();

  String? sum = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addition of given number"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the number",
                labelText: "Number 1",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the number",
                labelText: "Number 2",
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                int nu1 = int.parse(_num1.text);
                int nu2 = int.parse(_num2.text);
                sum = (nu1 + nu2).toString();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyDisplaySum1(number: sum),
                    ));
              },
              child: Text("Add")),
        ],
      ),
    );
  }
}
