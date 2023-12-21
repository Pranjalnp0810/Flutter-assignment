import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cart",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Thu, 6th of June",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                color: Colors.grey[200],
                child: Text("+ Add to Order"),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/vegetable.jpeg"),
                  title: Text(
                    "Vegetables Egg",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "- 3 +",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Flex(
                    direction: Axis.vertical,
                    children: [
                      Text("\$7.0"),
                      Card(
                        color: Colors.amber,
                        child: Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/vocado.jpg"),
                  title: Text(
                    "Avocado",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "- 5 +",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Flex(
                    direction: Axis.vertical,
                    children: [
                      Text("\$4.0"),
                      Card(
                        color: Colors.amber,
                        child: Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/pancakes.jpg"),
                  title: Text(
                    "Pancakes",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "- 1 +",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Flex(
                    direction: Axis.vertical,
                    children: [
                      Text("\$10.0"),
                      Card(
                        color: Colors.amber,
                        child: Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/image/vegetable1.jpg"),
                  title: Text(
                    "Vegetables",
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    "- 7 +",
                    textAlign: TextAlign.center,
                  ),
                  trailing: Flex(
                    direction: Axis.vertical,
                    children: [
                      Text("\$2.0"),
                      Card(
                        color: Colors.amber,
                        child: Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "\$100",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber),
                        child: Text("Checkout"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
