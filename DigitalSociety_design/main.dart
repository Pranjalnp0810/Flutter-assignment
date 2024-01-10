import 'package:digitalsociety_project/first_screen.dart';
import 'package:digitalsociety_project/login_page.dart';
import 'package:digitalsociety_project/main_page.dart';
import 'package:digitalsociety_project/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyFirstScreen(),
    );
  }
}
