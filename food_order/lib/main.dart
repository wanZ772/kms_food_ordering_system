// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:food_order/menu_list.dart';
import 'package:food_order/favorite.dart';
import 'package:food_order/header.dart';
import 'package:food_order/test.dart';

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
        Header(),
        Positioned(top: 250, child: MenuList()),
      ],
    ));
  }
}
