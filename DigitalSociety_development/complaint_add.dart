import 'package:flutter/material.dart';

class MyComplaintAdd extends StatefulWidget {
  const MyComplaintAdd({super.key});

  @override
  State<MyComplaintAdd> createState() => _MyComplaintAddState();
}

class _MyComplaintAddState extends State<MyComplaintAdd> {
  final _topicCController = TextEditingController();
  final _descCController = TextEditingController();
  final _forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(.3),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Add Event",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.deepPurple.withOpacity(.3),
        child: SingleChildScrollView(
          child: Form(
            key: _forKey,
            child: Padding(
              padding: EdgeInsets.only(top: 40.0, left: 30, right: 30),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Topic is Required";
                      }
                      return null;
                    },
                    controller: _topicCController,
                    decoration: InputDecoration(
                        hintText: "Enter the Topic",
                        labelText: "Topic",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description is Required";
                      }
                      return null;
                    },
                    controller: _descCController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "Enter the Description",
                      labelText: "Description",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 10,
                      shadowColor: Color.fromARGB(255, 67, 1, 78),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyComplaintAdd(),
                        ),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // GradientButton(
                  //   colors: [Colors.purple, Colors.deepPurpleAccent],
                  //   height: 50,
                  //   width: 200,
                  //   radius: 25,
                  //   gradientDirection: GradientDirection.leftToRight,
                  //   textStyle: TextStyle(color: Colors.white),
                  //   text: "Submit",
                  //   onPressed: () {
                  //     setState(
                  //       () {
                  //         if (_forKey.currentState!.validate()) {
                  //           setState(
                  //             () {
                  //               addComplaint(_topicCController.text.toString(),
                  //                   _descCController.text.toString());
                  //             },
                  //           );
                  //         }
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
