import 'package:flutter/material.dart';

class MyNavigator extends StatefulWidget {
  const MyNavigator({super.key});

  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: Container(),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(child: Text("Navigation Drawer")),
              ListTile(
                leading: const Icon(Icons.browse_gallery),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyGalleryApp(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.audio_file_outlined),
                title: const Text("Audio"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAudioApp(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_file),
                title: const Text("Video"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyVideoApp(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
