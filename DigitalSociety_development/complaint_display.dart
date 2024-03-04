import 'dart:convert';

import 'package:digitalsociety_project/complaintModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyComplaintDisplay extends StatefulWidget {
  const MyComplaintDisplay({super.key});

  @override
  State<MyComplaintDisplay> createState() => _MyComplaintDisplayState();
}

class _MyComplaintDisplayState extends State<MyComplaintDisplay> {
  Future<List<ComplaintsModel>> displayComp() async {
    final response = await http.get(Uri.parse(
        "https://grateful-amperages.000webhostapp.com/complateDisplay.php"));
    List jsonResp = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResp.map((e) => ComplaintsModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed Api");
    }
  }

  void deleteComplaint(String? id) async {
    final response = await http.post(
        Uri.parse(
            "https://grateful-amperages.000webhostapp.com/complateDelete.php"),
        body: {'id': id});
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyComplaintDisplay(),
          ));
    } else {
      throw Exception("Failed APi");
    }
  }

  late Future<List<ComplaintsModel>> _futureComp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureComp = displayComp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.withOpacity(.3),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "Complaints",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _futureComp,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ComplaintsModel> myComplaint = snapshot.data!;
              return ListView.builder(
                itemCount: myComplaint.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Get.bottomSheet(
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Topics : ${myComplaint[index].topicC}",
                                    style: GoogleFonts.sail(fontSize: 40),
                                  ),
                                  Divider(
                                    height: 40,
                                    thickness: 2,
                                  ),
                                  Text(
                                    "Description : ${myComplaint[index].descriptC}",
                                    style: GoogleFonts.sarabun(fontSize: 30),
                                  )
                                ],
                              ),
                            ),
                          ),
                          enableDrag: true,
                          isDismissible: true,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.white,
                        );
                      },
                      title: Text(
                        "${myComplaint[index].topicC}",
                        style: GoogleFonts.darumadropOne(fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            deleteComplaint(myComplaint[index].id);
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.deepPurple.withOpacity(.3),
              ),
            );
          },
        ),
      ),
    );
  }
}
