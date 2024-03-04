import 'dart:convert';

import 'package:digitalsociety_project/member_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'memberModel.dart';

class MyMemberDisplay extends StatefulWidget {
  const MyMemberDisplay({super.key});

  @override
  State<MyMemberDisplay> createState() => _MyMemberDisplayState();
}

class _MyMemberDisplayState extends State<MyMemberDisplay> {
  Future<List<MemberModel1>> memberDis() async {
    final response = await http.get(Uri.parse(
        "https://ranking-editor.000webhostapp.com/member_display.php"));
    List jsonRespo = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonRespo.map((e) => MemberModel1.formJson(e)).toList();
    } else {
      throw Exception("Failled Member Data Api");
    }
  }

  late Future<List<MemberModel1>> _futureData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureData = memberDis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members"),
      ),
      body: FutureBuilder(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MemberModel1> myMemberList = snapshot.data!;
            return Stack(
              children: [
                ListView.builder(
                  itemCount: myMemberList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("${myMemberList[index].name}"),
                        subtitle: Text("${myMemberList[index].email}"),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyMemberList(
                                          name: myMemberList[index].name,
                                          contact: myMemberList[index].contact,
                                          houseno: myMemberList[index].houseno,
                                          email: myMemberList[index].email),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_ios)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
