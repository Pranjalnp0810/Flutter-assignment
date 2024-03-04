import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMemberList extends StatelessWidget {
  String? name, email, contact, houseno;
  MyMemberList(
      {super.key,
      required this.name,
      required this.email,
      required this.contact,
      required this.houseno});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member's data"),
      ),
      body: Container(
        height: 230,
        width: double.maxFinite,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
              Text(
                "Name : $name",
                style: GoogleFonts.dangrek(fontSize: 35),
              ),
              Text("Contact : $contact"),
              Text("House No : $houseno"),
              Text("Email : $email"),
            ],
          ),
        ),
      ),
    );
  }
}
