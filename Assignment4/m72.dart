import 'package:flutter/material.dart';

class MyPhoneCallApp extends StatefulWidget {
  const MyPhoneCallApp({super.key});

  @override
  State<MyPhoneCallApp> createState() => _MyPhoneCallAppState();
}

class _MyPhoneCallAppState extends State<MyPhoneCallApp> {
  @override
  void initState() {
    super.initState();
    _requestPhone();
  }

  Future<void> _requestPhone() async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      print("Phone permission Allow");
    } else if (status.isDenied) {
      print("Phone permission Denied");
    } else if (status.isPermanentlyDenied) {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Permission Required"),
          content:
              Text("This app required a phone permission, Please allow first"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Deny")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Allow")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call Application"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Text(
          "Phone Call Allpication",
          style: TextStyle(fontSize: 40),
        ),
      )),
    );
  }
}
