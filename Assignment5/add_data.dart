import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:offline_database_assign/main_screen.dart';
import 'package:offline_database_assign/service.dart';
import 'package:offline_database_assign/usermodel.dart';

class MyAddDataInMainScreen extends StatefulWidget {
  UserModel userModel;
  MyAddDataInMainScreen({required this.userModel});

  @override
  State<MyAddDataInMainScreen> createState() => _MyAddDataInMainScreenState();
}

class _MyAddDataInMainScreenState extends State<MyAddDataInMainScreen> {
  String? dropdownValue = "High";

  final _nameController = TextEditingController();
  final _descriptController = TextEditingController();
  final _dateController = TextEditingController();
  final _priorityController = TextEditingController();

  List<String> priority = ['High', 'Low'];

  @override
  void initState() {
    super.initState();
    _dateController.text = '';
    _nameController.text = widget.userModel.name!;
    _descriptController.text = widget.userModel.descript!;
    _dateController.text = widget.userModel.date!;
    dropdownValue = widget.userModel.priority!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Edit Data",
              style: GoogleFonts.lexendTera(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple.withOpacity(.4)),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Enter the Name",
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple.withOpacity(.4)),
              child: TextFormField(
                controller: _descriptController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Enter the Description",
                  icon: Icon(
                    Icons.description,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple.withOpacity(.4)),
              child: TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? addDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1999),
                      lastDate: DateTime(2100));

                  if (addDate != null) {
                    String formatDate =
                        DateFormat("dd-MM-yyyy").format(addDate);
                    setState(() {
                      _dateController.text = formatDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Select the date",
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepPurple.withOpacity(.4)),
              child: TextFormField(
                controller: _priorityController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                  hintText: "Select the priority",
                  suffixIcon: DropdownButtonFormField(
                    value: dropdownValue,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.priority_high,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items:
                        priority.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.grey[300]),
              onPressed: () {
                setState(() async {
                  var _userModel = UserModel();
                  var _userService = Userservice();

                  _userModel.id = widget.userModel.id;
                  _userModel.name = _nameController.text;
                  _userModel.descript = _nameController.text;
                  _userModel.date = _nameController.text;
                  _userModel.priority = dropdownValue;

                  var result = await _userService.updateUser(_userModel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyListDataScreen(),
                    ),
                  );
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
          ],
        ),
      ),
    );
  }
}
