import 'package:assignment_4/m74.dart';
import 'package:flutter/material.dart';

class MyDataSecond extends StatefulWidget {
  const MyDataSecond({super.key});

  @override
  State<MyDataSecond> createState() => _MyDataSecondState();
}

class _MyDataSecondState extends State<MyDataSecond> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 134, 238, 252),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Redirect User Activity"),
        ),
        body: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the Name",
                    labelText: "Name"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  var result = _nameController.text.toString();
                  print(result);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyDataSecondScreen1(name: result),
                      ));
                },
                child: Text("Submit")),
          ]),
        ),
      ),
    );
  }
}
