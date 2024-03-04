import 'package:digitalsociety_project/complaint_add.dart';
import 'package:digitalsociety_project/complaint_display.dart';
import 'package:digitalsociety_project/event_chair.dart';
import 'package:digitalsociety_project/first_screen.dart';
import 'package:digitalsociety_project/login_page_chair.dart';
import 'package:digitalsociety_project/main_page_chair.dart';
import 'package:digitalsociety_project/notice_chair.dart';
import 'package:digitalsociety_project/notice_chair_display.dart';
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
