import 'package:flutter/material.dart';

class MenuInfo extends StatefulWidget {
  MenuInfo({Key? key}) : super(key: key);

  @override
  _MenuInfoState createState() => _MenuInfoState();
}

class _MenuInfoState extends State<MenuInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Stack(
        children: [
          Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                  child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
              )))
        ],
      ),
    );
  }
}
