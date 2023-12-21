import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyMenuScreen extends StatefulWidget {
  const MyMenuScreen({super.key});

  @override
  State<MyMenuScreen> createState() => _MyMenuScreenState();
}

List<Image> imagesFodd = [
  Image.asset('assets/image/vegetable.jpeg'),
  Image.asset('assets/image/avocado.jpg'),
  Image.asset('assets/image/pancakes.jpg'),
  Image.asset('assets/images/vegetable1.jpg')
];
List<String> foodName = [
  'Vegetables and Poached Egg',
  'Avocado Salad',
  'Pancakes with Orange sauce',
  'Vegetables'
];
List<int> ratingNumber = [250, 290, 500, 350];
List priceFood = ['\$13.50', '\$15.70', '\$18.0', '\$10.50'];

class _MyMenuScreenState extends State<MyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Menu",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                foodTextEx(
                    testName: "Continental", colorName: Colors.grey[300]),
                foodTextEx(testName: "Indian", colorName: Colors.amberAccent),
                foodTextEx(testName: "Chinese", colorName: Colors.grey[300]),
                foodTextEx(testName: "Mexican ", colorName: Colors.grey[300]),
                foodTextEx(testName: "Thai", colorName: Colors.grey[300]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                textFoodName(textName: "All", fontW: FontWeight.bold),
                textFoodName(textName: "Salad", colorName1: Colors.grey),
                textFoodName(textName: "Pizza", colorName1: Colors.grey),
                textFoodName(textName: "Avocado", colorName1: Colors.grey),
                textFoodName(textName: "Burger", colorName1: Colors.grey),
                textFoodName(textName: "Dessert", colorName1: Colors.grey),
                textFoodName(textName: "Soup", colorName1: Colors.grey),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160.0),
            child: girdViewExampleImage(),
          ),
        ],
      ),
    );
  }

  Widget foodTextEx({testName, Color? colorName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 18),
      child: Flex(direction: Axis.horizontal, children: [
        Card(
          color: colorName,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              testName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }

  Widget textFoodName({textName, fontW, Color? colorName1}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Flex(direction: Axis.horizontal, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            textName,
            style:
                TextStyle(fontSize: 18, fontWeight: fontW, color: colorName1),
          ),
        ),
      ]),
    );
  }

  Widget girdViewExampleImage() {
    return Container(
      child: GridView.builder(
        itemCount: imagesFodd.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('${imagesFodd[index]}'))),
                      child: imagesFodd[index]),
                ),
                Text(
                  "${foodName[index]}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: 4.0,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                    Text("(${ratingNumber[index]})")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${priceFood[index]}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Card(
                      color: Colors.amber,
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    )
                  ],  
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
