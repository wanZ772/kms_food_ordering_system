import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

String order =
    "https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/order";
var order_data;
List order_list = [];
String username = "Wan Z";

class MyOrder extends StatefulWidget {
  MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  void initState() {
    super.initState();
    check_order();
  }

  void check_order() async {
    order_data = await Dio().get("$order.json");

    for (var i = 0; i < order_data.data.length; i++) {
      if (order_data.data[i]['from'] == username) {
        order_list.add(order_data.data[i]);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 50,
            child: Container(
              height: 40,
              width: 40,
              child: ListView(
                children: [
                  for (var i = 0; i < order_list.length; i++) Text("ok")
                ],
              ),
            ))
      ],
    ));
  }
}
