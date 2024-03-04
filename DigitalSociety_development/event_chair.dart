import 'dart:convert';

import 'package:digitalsociety_project/eventModel.dart';
import 'package:digitalsociety_project/event_chair_display.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyEventChair extends StatefulWidget {
  const MyEventChair({super.key});

  @override
  State<MyEventChair> createState() => _MyEventChairState();
}

class _MyEventChairState extends State<MyEventChair> {
  TextEditingController _titleEController = TextEditingController();
  TextEditingController _descriptEController = TextEditingController();
  TextEditingController _dateEController = TextEditingController();
  final _forKey = GlobalKey<FormState>();

  Future<void> addEvent(String? titleE, descriptE, dateE) async {
    final response = await http.post(
        Uri.parse("https://ranking-editor.000webhostapp.com/event_add.php"),
        body: {'titleE': titleE, 'descriptE': descriptE, 'dateE': dateE});

    if (response.statusCode == 200) {
      EventModel.fromJson(jsonDecode(response.body));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyEventChairDisplay(),
        ),
      );
      Get.snackbar("Event", "Event ADDED Successfully");
      Get.to(MyEventChairDisplay());
    } else {
      throw Exception("Failed Event Api");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateEController.text = '';
  }

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
        child: Form(
          key: _forKey,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title is Required";
                      }
                      return null;
                    },
                    controller: _titleEController,
                    decoration: InputDecoration(
                        hintText: "Enter the Title",
                        labelText: "Title",
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
                    controller: _descriptEController,
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
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Date is Required";
                      }
                      return null;
                    },
                    controller: _dateEController,
                    decoration: InputDecoration(
                        hintText: "Select a Date",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        String formateDate =
                            DateFormat("dd-MM-yyyy").format(pickedDate);
                        setState(() {
                          _dateEController.text = formateDate;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 10,
                      shadowColor: Color.fromARGB(255, 67, 1, 78),
                    ),
                    onPressed: () {
                      if (_forKey.currentState!.validate()) {
                        setState(() {
                          addEvent(_titleEController.text,
                              _descriptEController.text, _dateEController.text);
                        });
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
