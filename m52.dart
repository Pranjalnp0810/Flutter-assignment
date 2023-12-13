import 'package:flutter/material.dart';

class M52 extends StatefulWidget {
  const M52({super.key});

  @override
  State<M52> createState() => _M52State();
}

TextEditingController _numController1 = new TextEditingController();
TextEditingController _numController2 = new TextEditingController();

String? result = "0";
String? output = "0";

enum Calc { add, sub, mul, div }

class _M52State extends State<M52> {
  Calc MyCalc = Calc.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _numController1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 1',
                  hintText: 'Enter the number'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _numController2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 2',
                  hintText: 'Enter the number'),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("Addition"),
              trailing: Radio(
                value: Calc.add,
                groupValue: MyCalc,
                onChanged: (value) {
                  setState(() {
                    MyCalc = value!;
                    addition(context);
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Substraction"),
              trailing: Radio(
                value: Calc.sub,
                groupValue: MyCalc,
                onChanged: (value) {
                  setState(() {
                    MyCalc = value!;
                    substraction(context);
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Multiplication"),
              trailing: Radio(
                value: Calc.mul,
                groupValue: MyCalc,
                onChanged: (value) {
                  setState(() {
                    MyCalc = value!;
                    multiplication(context);
                  });
                },
              ),
            ),
            ListTile(
              title: Text("Division"),
              trailing: Radio(
                value: Calc.div,
                groupValue: MyCalc,
                onChanged: (value) {
                  setState(() {
                    MyCalc = value!;
                    division(context);
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    output = result;
                  });
                },
                child: Text("Submit")),
            SizedBox(
              height: 30,
            ),
            Text("Result = $output"),
          ],
        ),
      ),
    );
  }

  void addition(BuildContext context) {
    setState(() {
      int num1 = int.parse(_numController1.text);
      int num2 = int.parse(_numController2.text);
      result = (num1 + num2).toString();
    });
  }

  void substraction(BuildContext context) {
    setState(() {
      int num1 = int.parse(_numController1.text);
      int num2 = int.parse(_numController2.text);
      result = (num1 - num2).toString();
    });
  }

  void multiplication(BuildContext context) {
    setState(() {
      int num1 = int.parse(_numController1.text);
      int num2 = int.parse(_numController2.text);
      result = (num1 * num2).toString();
    });
  }

  void division(BuildContext context) {
    setState(() {
      int num1 = int.parse(_numController1.text);
      int num2 = int.parse(_numController2.text);
      result = (num1 / num2).toString();
    });
  }
}