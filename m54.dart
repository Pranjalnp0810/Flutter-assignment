import 'package:flutter/material.dart';

class MyFontSize extends StatefulWidget {
  const MyFontSize({super.key});

  @override
  State<MyFontSize> createState() => _MyFontSizeState();
}

class _MyFontSizeState extends State<MyFontSize> {
  double count = 15.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Size Increase/Decrease"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.deepPurple[300],
              ),
              Text("$count"),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: Icon(Icons.remove),
                backgroundColor: Colors.deepPurple[300],
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            "Font Size",
            style: TextStyle(fontSize: count),
          ),
        ],
      ),
    );
  }
}
