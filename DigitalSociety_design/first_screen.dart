import 'package:digitalsociety_project/login_page.dart';
import 'package:flutter/material.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Colors.deepPurple.withOpacity(.3),
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.4,
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://i.pinimg.com/474x/d3/b9/6b/d3b96b5244bdfa0001a95168686e469a.jpg",
                  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaR3jAI_aQK9DNqeZ8RlucbnN5k0srXedWAExfW0zd8c26cgxjaUTTq0m6DssqCRMRMMA&usqp=CAU"
                  //   "https://miro.medium.com/v2/resize:fit:1400/1*-H1sQ_4JwPAMyy5nQpSNKQ.jpeg",
                ),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyLoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 60, 1, 63),
                              Color.fromARGB(255, 85, 7, 99),
                              Color.fromARGB(255, 169, 26, 194),
                              Color.fromARGB(255, 230, 127, 248),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.mirror),
                      ),
                      child: Center(
                        child: Text(
                          "Chairman",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyLoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 60, 1, 63),
                              Color.fromARGB(255, 85, 7, 99),
                              Color.fromARGB(255, 169, 26, 194),
                              Color.fromARGB(255, 230, 127, 248),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            tileMode: TileMode.mirror),
                      ),
                      child: Center(
                        child: Text(
                          "Member",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 500,
          ),
        ],
      ),
    );
  }
}
