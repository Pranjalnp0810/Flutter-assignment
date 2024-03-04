import 'dart:convert';

import 'package:digitalsociety_project/noticeModel.dart';
import 'package:digitalsociety_project/notice_chair_display.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyNoticeChair extends StatefulWidget {
  const MyNoticeChair({super.key});

  @override
  State<MyNoticeChair> createState() => _MyNoticeChairState();
}

class _MyNoticeChairState extends State<MyNoticeChair> {
  TextEditingController _titleNController = TextEditingController();
  TextEditingController _descriptionNController = TextEditingController();
  TextEditingController _dateNController = TextEditingController();
  final _forKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dateNController.text = '';
  }

  Future<void> addNotice(String? titleN, descriptN, dateN) async {
    final response = await http.post(
      Uri.parse("https://ranking-editor.000webhostapp.com/notice_add.php"),
      body: {
        'titleN': titleN,
        'descriptN': descriptN,
        'dateN': dateN,
      },
    );
    if (response.statusCode == 200) {
      NoticeModel.fromJson(jsonDecode(response.body));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyNoticeChairDisplay(),
        ),
      );
      Get.snackbar("Notice", "Notice ADDED Successfully");
      Get.back();
    } else {
      throw Exception("Notice not ADDED");
    }
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
          "Add Notice",
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
                        return "Title is Required";
                      }
                      return null;
                    },
                    controller: _titleNController,
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
                    controller: _descriptionNController,
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
                    controller: _dateNController,
                    decoration: InputDecoration(
                      hintText: "Select a Date",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        String formateDate =
                            DateFormat("yyyy-MM-dd").format(pickedDate);
                        setState(() {
                          _dateNController.text = formateDate;
                        });
                      }
                    },
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
                      if (_forKey.currentState!.validate()) {
                        setState(() {
                          addNotice(
                              _titleNController.text,
                              _descriptionNController.text,
                              _dateNController.text);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
