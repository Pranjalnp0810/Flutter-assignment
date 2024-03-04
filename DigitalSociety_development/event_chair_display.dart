import 'dart:convert';

import 'package:digitalsociety_project/eventModel.dart';
import 'package:digitalsociety_project/event_chair.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyEventChairDisplay extends StatefulWidget {
  const MyEventChairDisplay({super.key});

  @override
  State<MyEventChairDisplay> createState() => _MyEventChairDisplayState();
}

class _MyEventChairDisplayState extends State<MyEventChairDisplay> {
  Future<List<EventModel>> displayEvent() async {
    final response = await http
        .get(Uri.parse("https://ranking-editor.000webhostapp.com/event.php"));

    List jsonRe = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonRe.map((e) => EventModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed Api');
    }
  }

  void deleteEvent(String? id) async {
    final response = await http.post(
        Uri.parse("https://ranking-editor.000webhostapp.com/event_delete.php"),
        body: {'id': id});
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyEventChairDisplay(),
          ));
    } else {
      throw Exception("Failed Api");
    }
  }

  late Future _futureE;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureE = displayEvent();
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
            "Events",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _futureE,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<EventModel> myEvent = snapshot.data!;
              return ListView.builder(
                itemCount: myEvent.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30),
                    child: Container(
                      height: 100,
                      width: 200,
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Get.bottomSheet(
                                Flexible(
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Title : ${myEvent[index].titleE}",
                                              style: GoogleFonts.sendFlowers(
                                                  fontSize: 50),
                                            ),
                                            Divider(
                                              height: 2,
                                              thickness: 2,
                                            ),
                                            SizedBox(
                                              height: 19,
                                            ),
                                            Text(
                                              "Description : ${myEvent[index].descriptE}",
                                              style: GoogleFonts.snippet(
                                                  fontSize: 37),
                                            ),
                                            Divider(
                                              height: 2,
                                              thickness: 1,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Date : ${myEvent[index].dateE}",
                                                  style: GoogleFonts.castoro(
                                                      fontSize: 27),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ),
                                ),
                                enableDrag: true,
                                isDismissible: true);
                          },
                          leading: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          title: Text(
                            "${myEvent[index].titleE}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.saira(fontSize: 40),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                deleteEvent("${myEvent[index].id}");
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              print("Error : ${snapshot.hasError}");
            }
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.deepPurple.withOpacity(.3),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyEventChair(),
              ),
            );
          },
          child: Icon(
            Icons.add,
          ),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
