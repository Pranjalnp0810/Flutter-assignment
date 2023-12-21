import 'package:flutter/material.dart';

class MyAlert2 extends StatefulWidget {
  const MyAlert2({super.key});

  @override
  State<MyAlert2> createState() => _MyAlert2State();
}

class _MyAlert2State extends State<MyAlert2> {
  List<String> cityName = [
    'Ahmedabad',
    'Gandhinagar',
    'Surat',
    'Rajkot',
    'Bhavnagar',
    'Himmatnagar'
  ];
  String? result = 'Press here';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "City names",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: _showAlertDialogCity,
              child: Text(
                "$result",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showAlertDialogCity() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Select the city",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
            height: 300,
            width: double.maxFinite,
            child: SimpleDialog(
              children: cityName
                  .map((e) => SimpleDialogOption(
                        onPressed: () {
                          Navigator.pop(context, e);
                        },
                        child: Text(e),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          result = value;
        });
      }
    });
  }
}
