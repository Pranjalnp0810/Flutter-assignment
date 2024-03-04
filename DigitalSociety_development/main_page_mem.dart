import 'package:digitalsociety_project/complaint_add.dart';
import 'package:digitalsociety_project/event_member_display.dart';
import 'package:digitalsociety_project/notice_member_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMainScreenMem extends StatefulWidget {
  const MyMainScreenMem({super.key});

  @override
  State<MyMainScreenMem> createState() => _MyMainScreenMemState();
}

class _MyMainScreenMemState extends State<MyMainScreenMem> {
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
            // Container(
            //   height: 130,
            //   width: 350,
            //   decoration: BoxDecoration(
            //     color: Colors.purple,
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.elliptical(175, 130),
            //         bottomRight: Radius.elliptical(175, 130)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Column(
            //         children: [
            //           Text(
            //             "Welcome name",
            //             style: GoogleFonts.lexendTera(
            //               fontSize: 18,
            //               color: Colors.white,
            //             ),
            //           ),
            //           Text(
            //             "houseno",
            //             style: GoogleFonts.lexendTera(
            //               fontSize: 12,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.maxFinite,
                child: Card(
                  color: Colors.purple,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "Welcome Member!",
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
                                "houseno",
                                style: GoogleFonts.lexendTera(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "houseno",
                                style: GoogleFonts.lexendTera(
                                  fontSize: 12,
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
                            builder: (context) => MyNoticeMemberDisplay(),
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
                            builder: (context) => MyEventMemberDisplay(),
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
                            builder: (context) => MyComplaintAdd(),
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
