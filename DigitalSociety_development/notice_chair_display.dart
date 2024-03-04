import 'dart:convert';

import 'package:digitalsociety_project/noticeModel.dart';
import 'package:digitalsociety_project/notice_chair.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MyNoticeChairDisplay extends StatefulWidget {
  const MyNoticeChairDisplay({super.key});

  @override
  State<MyNoticeChairDisplay> createState() => _MyNoticeChairDisplayState();
}

class _MyNoticeChairDisplayState extends State<MyNoticeChairDisplay> {
  Future<List<NoticeModel>> displayNotice() async {
    final response = await http
        .get(Uri.parse("https://ranking-editor.000webhostapp.com/notice.php"));
    List jsonRespon = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonRespon.map((e) => NoticeModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed Api");
    }
  }

  void deleteNotice(String? id) async {
    final response = await http.post(
        Uri.parse("https://ranking-editor.000webhostapp.com/notice_delete.php"),
        body: {'id': id});
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyNoticeChairDisplay(),
        ),
      );
    } else {
      throw Exception("Failed Api");
    }
  }

  late Future<List<NoticeModel>> _futureNotice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureNotice = displayNotice();
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
            "Notice",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _futureNotice,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NoticeModel> myNotice = snapshot.data!;
              return ListView.builder(
                itemCount: myNotice.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Get.bottomSheet(
                          Flexible(
                            child: Column(
                              children: [
                                Text("Title : ${myNotice[index].titleN}",
                                    style: GoogleFonts.sancreek(fontSize: 40)),
                                Divider(
                                  height: 30,
                                  thickness: 2,
                                ),
                                Text(
                                  "Description : ${myNotice[index].descriptN}",
                                  style: GoogleFonts.saira(fontSize: 30),
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Date : ${myNotice[index].dateN}"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.white,
                          isDismissible: true,
                          enableDrag: true,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      },
                      title: Text(
                        "${myNotice[index].titleN}",
                        style: GoogleFonts.sairaSemiCondensed(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              deleteNotice(myNotice[index].id);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          )),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyNoticeChair(),
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
