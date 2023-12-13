import 'package:flutter/material.dart';

class M49 extends StatelessWidget {
  const M49({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 130,
                width: 490,
                color: Colors.red[400],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 160,
                width: 240,
                color: Colors.blue[400],
              ),
              Container(
                height: 160,
                width: 240,
                color: Colors.blue[400],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 160,
                width: 240,
                color: Colors.blue[400],
              ),
              Container(
                height: 160,
                width: 240,
                color: Colors.blue[400],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 150,
                width: 155,
                color: Colors.yellow,
              ),
              Container(
                height: 150,
                width: 155,
                color: Colors.yellow,
              ),
              Container(
                height: 150,
                width: 155,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
