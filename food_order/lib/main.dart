// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:food_order/info_page.dart';

String database =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system.json';

void main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      title: "KMS Food"));
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var get_menu;
  var total_menu = 0;
  var get_food_name = ['food'];
  var get_food_pic = [];
  var get_food_price = [];
  var get_food_vendor = [];

  @override
  void fetch_data() async {
    var get_data = await Dio().get(database);

    setState(() {
      total_menu = get_data.data['foods'].length;

      for (var i = 0; i < total_menu; i++) {
        get_food_name.add(get_data.data['foods'][i]['name']);
        get_food_vendor.add(get_data.data['foods'][i]['vendor']);
        get_food_pic.add(get_data.data['foods'][i]['pic']);
        get_food_price.add(get_data.data['foods'][i]['price']);
      }
    });
    get_food_name.remove('food');
    print(get_food_name);
  }

  void initState() {
    super.initState();
    fetch_data();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Stack(
        alignment: Alignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Positioned(
              top: 10,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SafeArea(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Icon(Icons.account_circle_rounded,
                            color: Colors.white, size: 40),
                        Text("KMS Food App",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Icon(Icons.search, color: Colors.white, size: 40)
                      ])))),
          Positioned(
              top: 150,
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Icon(Icons.restaurant_menu,
                          color: Colors.green, size: 40),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 40,
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ],
                  ))),
          Positioned(
              top: 200,
              left: 0,
              child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    if (total_menu != 0)
                      for (var i = 0; i < total_menu; i++)
                        Row(children: [
                          Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    get_food_name[i],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    get_food_vendor[i],
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  SizedBox(height: 30),
                                  GestureDetector(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuInfo()));
                                      }),
                                      child: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: ClipOval(
                                          child: Image(
                                              image:
                                                  NetworkImage(get_food_pic[i]),
                                              fit: BoxFit.cover),
                                        ),
                                      )),
                                  SizedBox(width: 20),
                                  Text("RM " + get_food_price[i].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: FlatButton(
                                                onPressed: (() {
                                                  print(1);
                                                }),
                                                child: Text("Buy",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)))),
                                        Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: FlatButton(
                                                onPressed: (() {
                                                  print(1);
                                                }),
                                                child: Text("Add to cart",
                                                    style: TextStyle(
                                                        color: Colors.yellow,
                                                        fontWeight:
                                                            FontWeight.bold)))),
                                      ]),
                                  SizedBox(
                                    height: 30,
                                  )
                                ]),
                            width: 300,
                            height: 550,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                          ),
                          SizedBox(width: 30)
                        ])
                  ])))
        ],
      ),
    );
  }
}
