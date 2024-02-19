import 'package:chattingmessaging/Scrren/loginScrren.dart';
import 'package:chattingmessaging/Scrren/messages.dart';
import 'package:chattingmessaging/Scrren/profile.dart';
import 'package:chattingmessaging/Scrren/profileDashbord.dart';
import 'package:chattingmessaging/Widget/Color/colorEx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomeSccren extends StatefulWidget {
  User? user;
  MyHomeSccren({super.key, required this.user});

  @override
  State<MyHomeSccren> createState() => _MyHomeSccrenState();
}

class _MyHomeSccrenState extends State<MyHomeSccren> {
  String? name = "";
  Future<void> getUser() async {
    var document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(widget.user!.uid)
        .get();

    setState(() {
      name = document["Name"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  List<DocumentSnapshot>? mainList;
  List<DocumentSnapshot>? filterList;

  void searchData(String? keyWord) {
    // DocumentSnapshot allData = await FirebaseFirestore.instance.collection("Abhayraj").doc().get();

    setState(() {
      if (keyWord!.isEmpty) {
        filterList = List.from(mainList!);
      } else {
        filterList = mainList
            ?.where((element) =>
                element['Name'].toLowerCase().contains(keyWord.toLowerCase()))
            .toList();
      }
    });
  }

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("Users");
    return Container(
        color: AllColorsName.backgroundColorA,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: !isVisible
                ? Text("Hi, ${name}")
                : TextField(
                    onChanged: (value) {
                      searchData(value);
                    },
                    decoration: InputDecoration(
                        hintText: "Search here name....",
                        prefixIcon: Icon(Icons.search)),
                  ),
            iconTheme: IconThemeData(color: AllColorsName.buttonColor),
            actions: [
              isVisible
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = false;
                        });
                      },
                      icon: Icon(Icons.cancel))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      icon: Icon(Icons.search)),
              PopupMenuButton(
                icon: Icon(Icons.more_vert_sharp),
                onSelected: (value) {
                  if (value == "Profile") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyProfileDashBoard(
                            user: widget.user!,
                          ),
                        ));
                  } else if (value == "LogOut") {
                    print("Logout");

                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MySignin(),
                        ));
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Profile"),
                      value: "Profile",
                    ),
                    PopupMenuItem(
                      child: Text("LogOut"),
                      value: "LogOut",
                    )
                  ];
                },
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30),
            child: Expanded(
                child: StreamBuilder(
              stream: users.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // var allData = snapshot.data!.docs;
                  mainList = snapshot.data!.docs
                      .where((element) => element.id != widget.user!.uid)
                      .toList();
                  filterList ??= List.from(mainList!);
                  return ListView.builder(
                  
                    itemCount: filterList!.length+1,
                    itemBuilder: (context, index) {
                      if (index == filterList!.length) {
                        return SizedBox(height: 20,);
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 80,width: 200,
                          
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 141, 127, 127),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: ListTile(
                            minLeadingWidth: 40,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyMessagesScrren(
                                        documentSnapshot: filterList![index]),
                                  ));
                            },
                            leading: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          filterList![index]['Profile Url']),fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(200)),
                            ),
                            title: Text(filterList![index]['Name'],style: TextStyle(fontSize: 35,color: Colors.white),),
                          ),
                        ),
                      );
                      
                    },
                  );
                }
                return Center(child: CircularProgressIndicator.adaptive());
              },
            )),
          ),
        ));
  }
}
