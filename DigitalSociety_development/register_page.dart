import 'dart:convert';

import 'package:digitalsociety_project/login_page_mem.dart';
import 'package:digitalsociety_project/memberModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _housenoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpasswordController = TextEditingController();

  Future<MemberModel1> addData(
      String? name, contact, houseno, email, password) async {
    final response = await http.post(Uri.parse(""), body: {
      'name': name,
      'contact': contact,
      'houseno': houseno,
      'email': email,
      'password': password
    });

    if (response.statusCode == 200) {
      return MemberModel1.formJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed your api");
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(.3),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.deepPurple.withOpacity(.3),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Sign Up",
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
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.person,
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
                          controller: _emailController,
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
                          controller: _contactController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Contact is required";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Contact",
                            hintStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.phone,
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
                          controller: _housenoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "House no is required";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "House no",
                            hintStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.house,
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
                          controller: _passwordController,
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.purple.withOpacity(.8),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _cpasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "";
                            } else if (_passwordController.text !=
                                _cpasswordController.text) {
                              return "Please enter correct Password";
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.password,
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
                            if (_formKey.currentState!.validate()) {
                              var registerData = addData(
                                  _nameController.text,
                                  _emailController.text,
                                  _contactController.text,
                                  _housenoController.text,
                                  _passwordController.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyLoginPageMem(),
                                  ));
                            }
                          });
                        },
                        child: Text(
                          "Submit",
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
                            "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyLoginPageMem(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign In",
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
      ),
    );
  }
}
