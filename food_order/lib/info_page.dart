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
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 40,
              left: 40,
              child: Container(
                  width: 40,
                  height: 40,
                  child: GestureDetector(
                    onTap: (() => Navigator.pop(context)),
                    child: Icon(Icons.arrow_back_ios_new,
                        color: Colors.black, size: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)))),
          Positioned(
              top: 50,
              child: Text("Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Positioned(
              top: 100,
              child: Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
              )),
          Positioned(
              bottom: -10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: FlatButton(
                            onPressed: (() {
                              print(1);
                            }),
                            child: Text("Buy",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)))),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
              ))
        ],
      ),
    );
  }
}
