import 'package:flutter/material.dart';

class M55 extends StatefulWidget {
  const M55({super.key});

  @override
  State<M55> createState() => _M55State();
}

class _M55State extends State<M55> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Textview"),
      ),
      body: Column(
        children: [
          Center(
            child: Checkbox(
                value: this.isChecked,
                onChanged: (value) {
                  setState(() {
                    this.isChecked = value!;
                  });
                }),
          ),
          if (isChecked) Text("Textview Checked"),
        ],
      ),
    );
  }
}
