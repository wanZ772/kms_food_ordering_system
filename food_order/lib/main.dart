// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainScreen(), title: "KMS Food"));
}

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Stack(
        alignment: Alignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Positioned(
              top: 100,
              child: Text("KMS Food Order",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
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
              child: Container(
                  width: 300,
                  height: 550,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    for (var i = 0; i < 5; i++)
                      Row(children: [
                        Container(
                          child: Column(children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Iced Mocha",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              child: ClipOval(
                                child: Image(
                                  image: NetworkImage(
                                      'https://i2.wp.com/wholefully.com/wp-content/uploads/2021/06/homemade-iced-mocha-coffee-600x900.jpg'),
                                ),
                              ),
                            )
                          ]),
                          width: 300,
                          height: 550,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                        ),
                        SizedBox(width: 20)
                      ])
                  ])))
        ],
      ),
    );
  }
}
