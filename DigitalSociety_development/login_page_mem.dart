import 'package:digitalsociety_project/main_page_mem.dart';
import 'package:digitalsociety_project/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginPageMem extends StatefulWidget {
  const MyLoginPageMem({super.key});

  @override
  State<MyLoginPageMem> createState() => _MyLoginPageMemState();
}

class _MyLoginPageMemState extends State<MyLoginPageMem> {
  TextEditingController _emailMcontroller = TextEditingController();
  TextEditingController _passwordMcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(.3),
      ),
      body: Container(
        color: Colors.deepPurple.withOpacity(.3),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  "Sign In",
                  style: GoogleFonts.lexendTera(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple.withOpacity(.8),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: _emailMcontroller,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.purple.withOpacity(.8),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: _passwordMcontroller,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyMainScreenMem(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to the Application? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyRegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
