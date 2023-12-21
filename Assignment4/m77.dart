import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyURLlauncher extends StatefulWidget {
  const MyURLlauncher({super.key});

  @override
  State<MyURLlauncher> createState() => _MyURLlauncherState();
}

class _MyURLlauncherState extends State<MyURLlauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call and SMS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  launch("tel: +91 9265310083");
                },
                icon: Icon(Icons.call),
                label: Text("Call")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri(scheme: "SMS", path: "+91 9265310083");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Show dialog: Can't launch url")));
                  }
                },
                icon: Icon(Icons.sms),
                label: Text("SMS")),
          ],
        ),
      ),
    );
  }
}
