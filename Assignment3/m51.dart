import 'package:flutter/material.dart';

class M51 extends StatefulWidget {
  const M51({super.key});

  @override
  State<M51> createState() => _M51State();
}

class _M51State extends State<M51> {
  TextEditingController _numberController1 = TextEditingController();
  TextEditingController _numberController2 = TextEditingController();
  List output = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Numbers Between 2 Numbers"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _numberController1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the number',
                  labelText: 'Number 1'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _numberController2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the number',
                  labelText: 'Number 2'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int num1 = int.parse(_numberController1.text.toString());
                int num2 = int.parse(_numberController2.text.toString());
                for (var i = num1 + 1; i < num2; i++) {
                  output.add(i);
                }
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(
            height: 40,
          ),
          Text("Output = $output"),
        ],
      ),
    );
  }
}
