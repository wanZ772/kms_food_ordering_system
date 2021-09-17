import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:ui';

String database =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system.json';
String order =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/order.json';

class MenuList extends StatefulWidget {
  MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  int get_length = 0;
  var eve = [];
  var odd = [];
  var get_data;

  void fetch_data() async {
    get_data = await Dio().get(database);

    setState(() {
      get_length = get_data.data['foods'].length;
      for (var i = 0; i < get_length; i++) {
        if ((i % 2) == 0) {
          eve.add(i);
          print("eve");
          print(i % 2);
        }
        if ((i % 2) == 1) {
          odd.add(i);
          print(i % 2);
        }
      }
    });
    print(eve);
    print(odd);
  }

  void initState() {
    super.initState();
    fetch_data();
  }

  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // SizedBox(width: 10),
            Column(
              children: [
                if (get_length != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        for (var i = 0; i < odd.length; i++)
                          Column(children: [
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.favorite, color: Colors.red),
                                      SizedBox(width: 10)
                                    ],
                                  ),
                                  SizedBox(
                                      height: 160,
                                      width: 160,
                                      child: ClipOval(
                                          child: Image(
                                        image: NetworkImage(get_data
                                            .data['foods'][odd[i]]['pic']),
                                        fit: BoxFit.cover,
                                      ))),
                                  Text(get_data.data['foods'][odd[i]]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text(get_data.data['foods'][odd[i]]['vendor'],
                                      style: TextStyle(color: Colors.grey)),
                                  Text("RM " +
                                      get_data.data['foods'][odd[i]]['price']
                                          .toString() +
                                      ".00"),
                                  Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text("Buy now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        onPressed: (() => print(1)),
                                      )),
                                  Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text("Info",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: (() => print(1)),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2.1,
                              height: 400,
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
                            SizedBox(height: 30)
                          ])
                      ]),
                      Column(children: [
                        for (var i = 0; i < eve.length; i++)
                          Column(children: [
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.favorite, color: Colors.red),
                                      SizedBox(width: 10)
                                    ],
                                  ),
                                  SizedBox(
                                      height: 160,
                                      width: 160,
                                      child: ClipOval(
                                          child: Image(
                                        image: NetworkImage(get_data
                                            .data['foods'][eve[i]]['pic']),
                                        fit: BoxFit.cover,
                                      ))),
                                  Text(get_data.data['foods'][eve[i]]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Text(get_data.data['foods'][eve[i]]['vendor'],
                                      style: TextStyle(color: Colors.grey)),
                                  Text("RM " +
                                      get_data.data['foods'][eve[i]]['price']
                                          .toString() +
                                      ".00"),
                                  Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text("Buy now",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        onPressed: (() => print(1)),
                                      )),
                                  Container(
                                      height: 30,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: FlatButton(
                                        child: Text("Info",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: (() => print(1)),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 2.1,
                              height: 400,
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
                            SizedBox(height: 30)
                          ])
                      ]),
                    ],
                  )
                else
                  Text("Please wait")
              ],
            )
          ],
        ));
  }
}
