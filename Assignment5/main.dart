import 'package:flutter/material.dart';
import 'package:offline_database_assign/add_data.dart';
import 'package:offline_database_assign/main_screen.dart';
import 'package:offline_database_assign/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyRegisterDataPage(),
    );
  }
}
