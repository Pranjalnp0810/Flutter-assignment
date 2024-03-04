import 'package:digitalsociety_project/complaint_display.dart';
import 'package:digitalsociety_project/event_chair_display.dart';

import 'package:digitalsociety_project/notice_chair_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMainScreenChair extends StatefulWidget {
  String? name;
  MyMainScreenChair({super.key, required this.name});

  @override
  State<MyMainScreenChair> createState() => _MyMainScreenChairState();
}

class _MyMainScreenChairState extends State<MyMainScreenChair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(.3),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepPurple.withOpacity(.3),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                width: double.maxFinite,
                child: Card(
                  color: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 8, right: 8, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "Welcome Chairman!",
                                style: GoogleFonts.lexendTera(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.name}",
                                style: GoogleFonts.lexendTera(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyNoticeChairDisplay(),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThhWEShMbZrz08uB1l1dVZG2rZPhZA_vEB3Q&usqp=CAU"),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyEventChairDisplay(),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSl4luaPz0kCi_Wc5kD5Cq4ll1k4XrWR-P-A&usqp=CAU"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyComplaintDisplay(),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTolroadGI8LPtZpQYDWmpmw3y8D86Lovyoeg&usqp=CAU"),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5cqYW-UqXKuWWMwWtFndvPBaDla4Ct4w9fNc_zTZozFpK5p4cGpgpC90rhihK3z3k9Ao&usqp=CAU"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
