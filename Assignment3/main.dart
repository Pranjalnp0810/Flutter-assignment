import 'package:assignment_3/m49.dart';
import 'package:assignment_3/m50.dart';
import 'package:assignment_3/m51.dart';
import 'package:assignment_3/m52.dart';
import 'package:assignment_3/m53.dart';
import 'package:assignment_3/m54.dart';
import 'package:assignment_3/m55.dart';
import 'package:assignment_3/m56.dart';
import 'package:assignment_3/m57.dart';
import 'package:assignment_3/m58.dart';
import 'package:assignment_3/m59/login_page.dart';
import 'package:assignment_3/m59/registration_page.dart';
import 'package:assignment_3/m60/Screen1.dart';
import 'package:assignment_3/m60/Screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(
      //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //useMaterial3: true,
      //),
      debugShowCheckedModeBanner: false,
      home: MyRestaurant2(),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
*/