import 'package:flutter/material.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({super.key});

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  var item = 0;
  onChange(index) {
    setState(() {
      item = index;
    });
  }

  List<Widget> MyLsit = [
    Image.asset('assets/image/cricket.jpg'),
    Image.asset('assets/image/night.jpg'),
    Image.asset('assets/image/road.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigator"),
      ),
      body: MyLsit.elementAt(item),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.browse_gallery,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.audio_file,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            label: "Audio",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_file,
              color: Colors.black,
            ),
            backgroundColor: Colors.grey,
            label: "Video",
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: item,
        onTap: onChange,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
