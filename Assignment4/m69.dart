import 'package:flutter/material.dart';

class MyGmailScreen extends StatefulWidget {
  const MyGmailScreen({super.key});

  @override
  State<MyGmailScreen> createState() => _MyGmailScreenState();
}

class _MyGmailScreenState extends State<MyGmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: "Search in emails",
            prefixIcon: Icon(Icons.person),
            prefixIconColor: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Gmail",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 140.0, top: 20, left: 20),
                child: Text(
                  "Gmail",
                  style: TextStyle(fontSize: 40, color: Colors.blue),
                ),
              ),
              Divider(thickness: 3),
              GmailScreen(textGmail: "All inboxes", iconGmail: Icons.filter),
              Divider(thickness: 3),
              GmailScreen(textGmail: "Primary", iconGmail: Icons.image),
              GmailScreen(
                  textGmail: "Promotions", iconGmail: Icons.discount_outlined),
              GmailScreen(textGmail: "Social", iconGmail: Icons.person_outline),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "All lables",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GmailScreen(
                  textGmail: "Starred", iconGmail: Icons.star_border_rounded),
              GmailScreen(
                  textGmail: "Snoozed", iconGmail: Icons.lock_clock_outlined),
              GmailScreen(
                  textGmail: "Important",
                  iconGmail: Icons.access_time_outlined),
              GmailScreen(textGmail: "Send", iconGmail: Icons.send),
              GmailScreen(
                  textGmail: "Scheduled",
                  iconGmail: Icons.schedule_send_outlined),
              GmailScreen(
                  textGmail: "Outbox",
                  iconGmail: Icons.check_box_outline_blank_sharp),
              GmailScreen(textGmail: "Drafts", iconGmail: Icons.note_outlined),
              GmailScreen(textGmail: "All mail", iconGmail: Icons.mail_outline),
              GmailScreen(
                  textGmail: "Spam", iconGmail: Icons.new_releases_outlined),
              GmailScreen(textGmail: "Bin", iconGmail: Icons.delete),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Google app',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GmailScreen(
                  textGmail: "Calender",
                  iconGmail: Icons.new_releases_outlined),
              GmailScreen(
                  textGmail: "Contacts",
                  iconGmail: Icons.person_pin_circle_outlined),
              Divider(
                thickness: 3,
              ),
              GmailScreen(textGmail: "Settings", iconGmail: Icons.settings),
              GmailScreen(
                  textGmail: "Help and feedback", iconGmail: Icons.feedback),
            ],
          ),
        ),
      ),
    );
  }

  Widget GmailScreen({textGmail, IconData? iconGmail}) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
      },
      leading: Icon(
        iconGmail,
      ),
      title: Text(textGmail),
    );
  }
}
