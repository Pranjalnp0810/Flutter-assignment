import 'package:flutter/material.dart';

class MyRegistrationPage extends StatefulWidget {
  const MyRegistrationPage({super.key});

  @override
  State<MyRegistrationPage> createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conformPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Registration Page",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Enter the Name",
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 15),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Enter the Email",
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 15),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Enter the Password",
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 15),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _conformPassController,
              decoration: InputDecoration(
                hintText: "Enter the Confirm Password",
                labelText: "Confirm Password",
                labelStyle: TextStyle(fontSize: 15),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
