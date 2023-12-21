import 'package:assignment_4/m67.dart';
import 'package:flutter/material.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondScreen();
  }

  void secondScreen() async {
    await Future.delayed(Duration(seconds: 4), () {});

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyProfileLogoutOpt(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to Splash Screen",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
