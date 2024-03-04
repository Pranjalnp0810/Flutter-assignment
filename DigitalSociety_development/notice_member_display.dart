import 'dart:convert';

import 'package:digitalsociety_project/noticeModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MyNoticeMemberDisplay extends StatefulWidget {
  const MyNoticeMemberDisplay({super.key});

  @override
  State<MyNoticeMemberDisplay> createState() => _MyNoticeMemberDisplayState();
}

class _MyNoticeMemberDisplayState extends State<MyNoticeMemberDisplay> {
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flexible(
                      child: Card(
                        color: Colors.deepPurple.withOpacity(.3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title : ${myNotice[index].titleN}",
                                  style: GoogleFonts.sendFlowers(fontSize: 50),
                                ),
                                Divider(
                                  height: 2,
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 19,
                                ),
                                Text(
                                  "Description : ${myNotice[index].descriptN}",
                                  style: GoogleFonts.snippet(fontSize: 37),
                                ),
                                Divider(
                                  height: 2,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Date : ${myNotice[index].dateN}",
                                      style: GoogleFonts.castoro(fontSize: 27),
                                    ),
                                  ],
                                ),
                              ]),
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
