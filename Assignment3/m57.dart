import 'package:flutter/material.dart';

class M57 extends StatefulWidget {
  const M57({super.key});

  @override
  State<M57> createState() => _M57State();
}

class _M57State extends State<M57> {
  int GroupValue = 0;
  List<Color> Colours = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.pink
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color change using Radio button"),
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: 500,
            color: Colours[GroupValue],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("Purple"),
            selectedColor: Colors.purple,
            trailing: Radio(
              groupValue: GroupValue,
              value: 0,
              onChanged: (value) {
                setState(() {
                  GroupValue = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Blue"),
            selectedColor: Colors.blue,
            trailing: Radio(
              groupValue: GroupValue,
              value: 1,
              onChanged: (value) {
                setState(() {
                  GroupValue = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Yellow"),
            selectedColor: Colors.yellow,
            trailing: Radio(
              groupValue: GroupValue,
              value: 2,
              onChanged: (value) {
                setState(() {
                  GroupValue = value!;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Pink"),
            selectedColor: Colors.pink,
            trailing: Radio(
              groupValue: GroupValue,
              value: 3,
              onChanged: (value) {
                setState(() {
                  GroupValue = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
