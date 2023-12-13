import 'package:flutter/material.dart';

class M56 extends StatefulWidget {
  const M56({super.key});

  @override
  State<M56> createState() => _M56State();
}

List<String> name = ['Chai', 'Night', 'Road', 'Sky'];
List image = [
  Image.asset('assets/images/chai.jpg'),
  Image.asset('assets/images/night2.jpg'),
  Image.asset('assets/images/road.jpg'),
  Image.asset('assets/images/sky.jpg'),
];

class _M56State extends State<M56> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image around Textview"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: GridView.builder(
          itemCount: name.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 25, crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Card(
              child: Stack(alignment: Alignment.topCenter, children: [
                Container(
                  height: 200,
                  width: 200,
                  child: image[index],
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(name[index],
                        style: TextStyle(fontSize: 30, color: Colors.black))),
              ]),
            );
          },
        ),
      ),
    );
  }
}
