import 'package:assignment_4/m61_cart.dart';
import 'package:assignment_4/m61_menu.dart';
import 'package:flutter/material.dart';

class MyToolBarScreen extends StatefulWidget {
  const MyToolBarScreen({super.key});

  @override
  State<MyToolBarScreen> createState() => _MyToolBarScreenState();
}

class _MyToolBarScreenState extends State<MyToolBarScreen> {
  List<Widget> myListScreen = [
    MyMenuScreen(),
    MyMenuScreen(),
    MyCartScreen(),
  ];
  int index_value = 0;
  onChange(int value) {
    setState(() {
      index_value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myListScreen.elementAt(index_value),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: "Feeds",
            backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Order",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Cheese Burger",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "250g",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              Text(
                                "\$7.0",
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Avocado Salad",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "350g",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              Text(
                                "\$10.0",
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.grey),
                              ),
                              Text(
                                "\$17.0",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 40,
                            width: 250,
                            
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber),
                                child: Text(
                                  "Add to Card",
                                  style: TextStyle(color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.person),
            ),
            label: "Accounts",
            backgroundColor: Colors.purpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Card",
            backgroundColor: Colors.orangeAccent,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: index_value,
        onTap: onChange,
      ),
    );
  }
}
