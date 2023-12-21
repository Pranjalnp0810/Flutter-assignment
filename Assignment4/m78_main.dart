import 'package:assignment_4/m78_1.dart';
import 'package:flutter/material.dart';

class My78Example extends StatefulWidget {
  const My78Example({super.key});

  @override
  State<My78Example> createState() => _My78ExampleState();
}

TextEditingController _nameController = TextEditingController();

class _My78ExampleState extends State<My78Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User's choice Data"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: "Enter the name",
                  labelText: "Name",
                  border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  var name1 = _nameController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => My78Example1(
                        name: [name1],
                      ),
                    ),
                  ); 
                });
              },
              child: Text("Submit")),
        ]),
      ),
    );
  }
}
