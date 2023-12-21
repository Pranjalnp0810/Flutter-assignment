import 'package:flutter/material.dart';

class MyProfileLogoutOpt extends StatefulWidget {
  const MyProfileLogoutOpt({super.key});

  @override
  State<MyProfileLogoutOpt> createState() => _MyProfileLogoutOptState();
}

class _MyProfileLogoutOptState extends State<MyProfileLogoutOpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile and Logout here --->"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Profile"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Logout"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("Profile Option selected");
              } else if (value == 1) {
                print("Logout Option selected");
              }
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
