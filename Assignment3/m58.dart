import 'package:flutter/material.dart';

class MySeekbar extends StatefulWidget {
  const MySeekbar({super.key});

  @override
  State<MySeekbar> createState() => _MySeekbarState();
}

class _MySeekbarState extends State<MySeekbar> {
  int myseekbarvalue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seekbar Value Change background color"),
      ),
      body: Container(
        color: myseekbarvalue > 50 ? Colors.purple : Colors.yellow,
        child: Column(
          children: [
            Center(
              child: Text(
                "$myseekbarvalue",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
            Center(
              child: Slider(
                  value: myseekbarvalue.toDouble(),
                  min: 1,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      myseekbarvalue = value.toInt();
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
