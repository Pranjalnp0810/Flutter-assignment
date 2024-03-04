import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEventMemberDisplay extends StatefulWidget {
  const MyEventMemberDisplay({super.key});

  @override
  State<MyEventMemberDisplay> createState() => _MyEventMemberDisplayState();
}

class _MyEventMemberDisplayState extends State<MyEventMemberDisplay> {
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
          //   future: _futureEN,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //    List<EventModel> myEvent = snapshot.data!;
              return ListView.builder(
                //     itemCount: myEvent.length,
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
                                  "",
                                  // "Title : ${myEvent[index].titleE}",
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
                                  "",
                                  //  "Description : ${myEvent[index].descE}",
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
                                      "",
                                      //  "Date : ${myEvent[index].dateE}",
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
