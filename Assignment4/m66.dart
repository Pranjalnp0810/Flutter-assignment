import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDateFormat extends StatefulWidget {
  const MyDateFormat({super.key});

  @override
  State<MyDateFormat> createState() => _MyDateFormatState();
}

class _MyDateFormatState extends State<MyDateFormat> {
  TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _dateController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select date"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: TextField(
            controller: _dateController,
            decoration: InputDecoration(
                hintText: "Enter the Date",
                prefixIcon: Icon(Icons.calendar_today)),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                print(pickedDate);
                String? formatDate1 =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                print("Your new Format Date = ");
                print(formatDate1);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      formatDate1,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );

                setState(() {
                  _dateController.text = formatDate1;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Please select a date",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
