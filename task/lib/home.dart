import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

var textstyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

// for text stying pupose

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.mic, color: Colors.grey),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.green,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: FutureBuilder(
          builder: (context, snapshot) {
            var mydata = jsonDecode(snapshot.data.toString());
            //get the data from local json

            return SafeArea(
              child: Column(
                children: [
                  ImageFile(mydata: mydata),
                  Container(
                      padding: EdgeInsets.all(8),
                      child: Text(mydata["pro_name"], style: textstyle)),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text(
                        'QUANTITY: ' + mydata["pro_quantity"].toString(),
                        style: textstyle),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text('FROM: ' + mydata["pro_cat"].toString(),
                        style: textstyle),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text(
                        'PRICE: ' + mydata["pro_exp_price"].toString() + " USD",
                        style: textstyle),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.topLeft,
                    child: Text('FRAMED: ' + mydata["frame"].toString(),
                        style: textstyle),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Container(
                                  color: Colors.red,
                                  child: Center(
                                      child: Text(
                                    'ADD TO CART',
                                  )))),
                          Expanded(
                            child: Container(
                                color: Colors.green,
                                child: Center(child: Text('BUY NOW'))),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          future:
              DefaultAssetBundle.of(context).loadString("assets/source.json")),
    );
  }
}

class ImageFile extends StatelessWidget {
  const ImageFile({
    Key? key,
    required this.mydata,
  }) : super(key: key);

  final mydata;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        height: 300,
        width: 400,
        child: Carousel(
          dotSize: 8,
          dotColor: Colors.white,
          dotIncreasedColor: Colors.pink,
          dotBgColor: Colors.white10,
          images: [
            Image.network(mydata["pro_images"][0]["std_img_url"]),
            Image.network(mydata["pro_images"][1]["std_img_url"]),
            Image.network(mydata["pro_images"][2]["std_img_url"]),
            Image.network(mydata["pro_images"][3]["std_img_url"]),
          ],
        ),
      ),
    );
  }
}
