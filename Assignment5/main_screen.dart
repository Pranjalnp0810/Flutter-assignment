import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:offline_database_assign/add_data.dart';
import 'package:offline_database_assign/register_page.dart';
import 'package:offline_database_assign/service.dart';
import 'package:offline_database_assign/usermodel.dart';

class MyListDataScreen extends StatefulWidget {
  const MyListDataScreen({super.key});

  @override
  State<MyListDataScreen> createState() => _MyListDataScreenState();
}

class _MyListDataScreenState extends State<MyListDataScreen> {
  List<UserModel> myList = <UserModel>[];
  var _userService = Userservice();

  @override
  void initState() {
    super.initState();
    getDatabaseData();
  }

  getDatabaseData() async {
    var userService = await _userService.displayUser();
    myList = <UserModel>[];

    userService.forEach((rawData) {
      setState(() {
        var _userModel = UserModel();
        _userModel.id = rawData['id'];
        _userModel.name = rawData['name'];
        _userModel.descript = rawData['descript'];
        _userModel.date = rawData['date'];
        _userModel.priority = rawData['priority'];

        myList.add(_userModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    myList.sort(
      (a, b) => a.date!.compareTo(b.date.toString()),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Padding(
          padding: const EdgeInsets.only(right: 250),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Search here...",
              hintText: "Enter the name",
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Card(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 95,
                        child: Center(
                          child: Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Center(
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 85,
                        child: Center(
                          child: Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Center(
                          child: Text(
                            "Priority",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 102,
                        child: Center(
                          child: Text(
                            "Actions",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: myList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String? Priority = myList[index].priority;
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 95,
                            child: Center(
                              child: Text(
                                "${myList[index].name}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 102,
                            child: Center(
                              child: Text(
                                "${myList[index].descript}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            width: 85,
                            child: Center(
                              child: Text(
                                "${myList[index].date}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          if (Priority == "High") ...[
                            Container(
                              width: 95,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "${myList[index].priority}",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ] else ...[
                            Container(
                              width: 95,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "${myList[index].priority}",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                          ],
                          Container(
                            width: 95,
                            child: Center(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MyAddDataInMainScreen(
                                            userModel: myList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      var _userModel = UserModel();
                                      var _userService = Userservice();

                                      setState(() {
                                        _userModel.id = myList[index].id;
                                      });

                                      _userService.deleteUser(_userModel);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MyListDataScreen(),
                                          ));
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyRegisterDataPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
