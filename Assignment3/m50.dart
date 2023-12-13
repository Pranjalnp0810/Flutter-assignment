import 'package:flutter/material.dart';

class M50 extends StatefulWidget {
  const M50({super.key});

  @override
  State<M50> createState() => _M50State();
}

class _M50State extends State<M50> {
  TextEditingController _numberController = TextEditingController();
  String? output = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Number"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: TextField(
              controller: _numberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the number',
                  labelText: 'Number'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                String? num = _numberController.text;
                String? revnum = num.split('').reversed.join();
                output = revnum;
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: 40,
          ),
          Text("Reverse number = $output"),
        ],
      ),
    );
  }
}
