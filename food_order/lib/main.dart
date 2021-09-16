// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:food_order/menu_list.dart';

String database =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system.json';
String order =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/order.json';

void main() {
  runApp(MaterialApp(
    home: MainScreen(),
    title: "KMS Food App",
  ));
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  int j = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 30,
            child: SafeArea(
                child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    offset: Offset(0, 3),
                                    blurRadius: 1,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.arrow_back_ios_new, size: 30)),
                        Text("KMS Food App",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                                image: NetworkImage(
                                    'https://raw.githubusercontent.com/wanZ772/kms_food_ordering_system/master/image_2021-09-16_181440.png'),
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover))
                      ],
                    )))),
        Positioned(
            top: 140,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 300,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: "Search food . . "),
                          )),
                      GestureDetector(
                          child:
                              Icon(Icons.search, size: 30, color: Colors.black))
                    ]))),
        Positioned(
            top: 180,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: EdgeInsets.all(5),
                child: ListView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(40)),
                        child: FlatButton.icon(
                            onPressed: (() => print(1)),
                            icon: Icon(Icons.menu_book_outlined,
                                color: Colors.white),
                            label: Text(
                              "Menu",
                              style: TextStyle(color: Colors.white),
                            ))),
                    Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: FlatButton.icon(
                            onPressed: (() => print(1)),
                            icon: Icon(Icons.favorite_border,
                                color: Colors.grey[400]),
                            label: Text(
                              "Favorite",
                              style: TextStyle(color: Colors.grey),
                            ))),
                    Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: FlatButton.icon(
                            onPressed: (() => print(1)),
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: Colors.grey[400]),
                            label: Text(
                              "Your order",
                              style: TextStyle(color: Colors.grey),
                            ))),
                  ],
                ))),
        // Positioned(top: 250, child: MenuList()),
        FutureBuilder(builder: (_, builder) {
          try {
            return MenuList();
          } catch (e) {
            return Text("Please wait");
          }
        })
      ],
    ));
  }
}
