// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order/header.dart';
import 'package:food_order/main.dart';
import 'package:dio/dio.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'dart:developer';

var favorite_quantity = [];
var get_favorite;
String favorite_food =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/users/0/fav';
String order =
    "https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/order.json";

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void initState() {
    super.initState();
    get_fav();
  }

  var list_ready = false;
  var favorite_list = [];
  var get_favorite_list;

  void get_fav() async {
    get_favorite = await Dio().get(favorite_food + ".json");
    get_favorite_list = get_favorite.data;
    if (get_favorite_list.length > 0) {
      setState(() {
        list_ready;
        for (var i = 0; i < get_favorite_list.length; i++) {
          if (get_favorite_list[i.toString()] != null) {
            if (favorite_list.contains(get_favorite_list[i.toString()]) ==
                false) {
              favorite_list.add(get_favorite_list[i.toString()]);
              favorite_quantity.add(1);
              print(get_favorite_list[i.toString()]);
            }
          }
        }
        list_ready = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      Positioned(
          top: 30,
          child: SafeArea(
              child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
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
                                  borderSide: BorderSide(color: Colors.white)),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: FlatButton.icon(
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreen()));
                          }),
                          icon: Icon(Icons.menu_book_outlined,
                              color: Colors.grey[400]),
                          label: Text(
                            "Menu",
                            style: TextStyle(color: Colors.grey[400]),
                          ))),
                  Container(
                      width: 200,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40)),
                      child: FlatButton.icon(
                          onPressed: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoriteScreen()));
                          }),
                          icon:
                              Icon(Icons.favorite_border, color: Colors.white),
                          label: Text(
                            "Favorite",
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
                          icon: Icon(Icons.shopping_cart_outlined,
                              color: Colors.grey[400]),
                          label: Text(
                            "Your order",
                            style: TextStyle(color: Colors.grey),
                          ))),
                ],
              ))),
      if (favorite_list.length == 0)
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Icon(Icons.favorite, color: Colors.grey, size: 200)),
      if (list_ready == false)
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Text("Please wait")),
      if (list_ready == true)
        Positioned(
            bottom: 10,
            child: Container(
              // padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  for (var i = 0; i < favorite_list.length; i++)
                    if (favorite_list[i] != null)
                      Column(children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 300,
                                width: 300,
                                child: ClipOval(
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          favorite_list[i]['pic'])),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                favorite_list[i]['name'],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(favorite_list[i]['vendor'],
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                height: 20,
                              ),
                              Text("RM " +
                                  favorite_list[i]['price'].toString() +
                                  ".00"),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        onPressed: () {
                                          if (favorite_quantity[i] > 1) {
                                            setState(() {
                                              favorite_quantity[i]--;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                        width: 150,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: FlatButton.icon(
                                          icon:
                                              Icon(Icons.shopping_bag_outlined),
                                          onPressed: () async {
                                            var get_order_data =
                                                await Dio().get(order);
                                            int get_order_list =
                                                get_order_data.data.length;

                                            Dio().patch(order, data: {
                                              (get_order_list - 1).toString(): {
                                                "name": favorite_list[i]
                                                    ['name'],
                                                "vendor": favorite_list[i]
                                                    ['vendor'],
                                                "price": favorite_list[i]
                                                    ['price'],
                                                "quantity":
                                                    favorite_quantity[i],
                                                "from": "Wan Z",
                                                "pic": favorite_list[i]['pic']
                                              }
                                            });
                                          },
                                          label: Text(
                                              "Buy: ${favorite_quantity[i]}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 60,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            favorite_quantity[i]++;
                                          });
                                        },
                                      ),
                                    ),
                                  ]),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                  width: 250,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: FlatButton.icon(
                                    icon: Icon(Icons.remove_circle_outline,
                                        color: Colors.white),
                                    onPressed: () async {
                                      await Dio()
                                          .delete("$favorite_food/$i.json");
                                      setState(() {
                                        favorite_list[i] = null;
                                        print("after delete: " +
                                            favorite_list.toString());
                                      });
                                      return get_fav();
                                    },
                                    label: Text("Remove",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )),
                            ],
                          ),
                          height: 600,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.black,
                                    blurRadius: 4)
                              ]),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ])
                ],
              ),
            ))
    ]));
  }
}
