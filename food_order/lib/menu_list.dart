import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  MenuList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(width: 10),
            for (var i = 0; i < 2; i++)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                      Container(
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
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )
          ],
        ));
  }
}
