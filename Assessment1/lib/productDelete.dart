import 'package:flutter/material.dart';
import 'package:inventorymanagementapp/Database/Model/product.dart';
import 'package:inventorymanagementapp/Database/db.dart';

class MyProductDelete extends StatefulWidget {
  const MyProductDelete({super.key});

  @override
  State<MyProductDelete> createState() => _MyProductDeleteState();
}

class _MyProductDeleteState extends State<MyProductDelete> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductDisplay();
  }

  List<ProductModel> productList = <ProductModel>[];
  var productDp = DatabaseConnectionA();

  getProductDisplay() async {
    var productD = await productDp.displayProduct();
    productD.forEach((rawData) {
      setState(() {
        var productModel = ProductModel();
        productModel.id = rawData['id'];
        productModel.name = rawData['name'];
        productModel.category = rawData['category'];
        productModel.price = rawData['price'];
        productModel.number = rawData['number'];

        productList.add(productModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : ${productList[index].name}",
                                style: TextStyle(fontSize: 50),
                              ),
                              Divider(
                                height: 2,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Text(
                                "Category : ${productList[index].category}",
                                style: TextStyle(fontSize: 37),
                              ),
                              Divider(
                                height: 2,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Price :\$ ${productList[index].price}",
                                    style: TextStyle(fontSize: 27),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 140,
                              ),
                              Text(
                                "Number : ${productList[index].number}",
                                style: TextStyle(fontSize: 27),
                              ),
                            ]),
                      ),
                    );
                  },
                  isDismissible: true,
                  enableDrag: true,
                  
                );
              },
              title: Text(
                "${productList[index].name}",
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text(
                "\$ ${productList[index].price}",
                style: TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () async {
                  var productModel = ProductModel();
                  var productDete = DatabaseConnectionA();
                  setState(() {
                    productModel.id = productList[index].id;
                  });
                  var res = await productDete.deleteProduct(productModel);
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
