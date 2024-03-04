import 'dart:convert';

import 'package:digitalsociety_project/main_page_chair.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyLoginPageChair extends StatefulWidget {
  const MyLoginPageChair({super.key});

  @override
  State<MyLoginPageChair> createState() => _MyLoginPageChairState();
}

class _MyLoginPageChairState extends State<MyLoginPageChair> {
  TextEditingController _emailCcontroller = TextEditingController();
  TextEditingController _passwordCcontroller = TextEditingController();
  Future<void> loginChairman(String? email, password) async {
    try {
      final response = await http.post(
        Uri.parse(
            "https://ranking-editor.000webhostapp.com/chairman_login.php"),
        body: {
          'emailC': email,
          'passwordC': password,
        },
      );
      List jsonRes = jsonDecode(response.body);

      if (jsonRes.isEmpty) {
        print("failed API");
      } else {
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          String nameC = data[0]['nameC'];
          print(data);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyMainScreenChair(name: nameC),
            ),
          );
        } else {
          print("Error");
        }
      }
    } catch (e) {
      print("login failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(.3),
      ),
      body: Container(
        color: Colors.deepPurple.withOpacity(.3),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Login",
                style: GoogleFonts.lexendTera(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple.withOpacity(.8),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _emailCcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.purple.withOpacity(.8),
                    ),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      controller: _passwordCcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      shadowColor: Color.fromARGB(255, 67, 1, 78),
                    ),
                    onPressed: () {
                      setState(() {
                        loginChairman(
                            _emailCcontroller.text, _passwordCcontroller.text);
                      });
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
