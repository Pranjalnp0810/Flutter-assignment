import 'package:flutter/material.dart';

class MyRestaurant1 extends StatefulWidget {
  const MyRestaurant1({super.key});

  @override
  State<MyRestaurant1> createState() => _MyRestaurant1State();
}

List foodIm = [
  'assets/image/Soba_Soup.jpg',
  'assets/image/sei_ua_sabum.jpg',
  'assets/image/ratatouillie.jpg'
];
List foodNam = ['Soba Soup', 'Sei Ua Samun Phrai', 'Ratatoullia Pasta'];

class _MyRestaurant1State extends State<MyRestaurant1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 75),
                      child: Text(
                        "Restaurant",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          child: Text(
                            "20-30min",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "2.4Km",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "Restaurant",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, top: 8),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Text(
                    "R",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                right: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              children: [
                Text(
                  "Orange Sandwitches is delicious",
                ),
                Spacer(flex: 2),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.star_border),
                    color: Colors.amber),
                Container(
                  child: Text(
                    "4.7",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                tabText(
                    tText: 'Recommend',
                    fColor: Colors.white,
                    tColor: Colors.orange),
                tabText(tText: "Popular", fWeight: FontWeight.w600),
                tabText(tText: "Noodles", fWeight: FontWeight.w600),
                tabText(tText: "Pizza", fWeight: FontWeight.w600),
                tabText(tText: "Fries", fWeight: FontWeight.w600),
                tabText(tText: "Burger", fWeight: FontWeight.w600)
              ],
            ),
          ),
          listTileDemo(tex: "Soba Soup", imageCl: 'assets/image/Soba_Soup.jpg'),
          listTileDemo(
              tex: "Sei Ua Samun Phrai",
              imageCl: 'assets/image/sei_ua_sabum.jpg'),
          listTileDemo(
              tex: "Rataoullie Pasta",
              imageCl: 'assets/image/ratatouillie.jpg'),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.shopping_bag_outlined,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  tabText({tText, tColor, fColor, fWeight}) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Card(
        color: tColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 8,
        child: Container(
          height: 40,
          padding: EdgeInsets.all(12),
          child: Text(
            '$tText',
            style: TextStyle(color: fColor, fontSize: 14, fontWeight: fWeight),
          ),
        ),
      ),
    );
  }

  listTileDemo({tex, imageCl}) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageCl),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
          ),
          title: Text(
            "$tex",
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text("12"),
        ),
      ),
    );
  }
}
