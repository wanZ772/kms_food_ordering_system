import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              left: 5,
              top: 30,
              child: SafeArea(
                  child: Icon(Icons.account_circle_outlined,
                      size: 40, color: Colors.grey))),
          Positioned(
              right: 5,
              top: 30,
              child: SafeArea(
                  child: Icon(Icons.search, size: 40, color: Colors.grey))),
          Positioned(
              top: 150,
              child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.home, color: Colors.green, size: 30),
                        Icon(Icons.favorite_border,
                            color: Colors.red, size: 30),
                        Icon(Icons.filter_list, color: Colors.blue, size: 30),
                        Icon(Icons.shopping_cart,
                            color: Colors.orange, size: 30),
                      ]))),
          Positioned(
              top: 200,
              child: Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    for (var i = 0; i < 5; i++)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.favorite_border_outlined,
                                                color: Colors.grey, size: 30)
                                          ],
                                        ),
                                        SizedBox(
                                            height: 160,
                                            child: ClipOval(
                                                child: Image(
                                                    image: NetworkImage(
                                                        'https://cdnimg.webstaurantstore.com/images/products/large/107115/2070912.jpg'),
                                                    fit: BoxFit.cover))),
                                        Text("Iced Mocha"),
                                        Text(
                                          "RM 4.00",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 30),
                                        )
                                      ]),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0, 0),
                                            blurRadius: 4)
                                      ])),
                              Container(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.favorite_border_outlined,
                                                color: Colors.grey, size: 30)
                                          ],
                                        ),
                                        SizedBox(
                                            height: 160,
                                            child: ClipOval(
                                                child: Image(
                                                    image: NetworkImage(
                                                        'https://1.bp.blogspot.com/-liK5KQn5l_U/XP4g0x3TgeI/AAAAAAAADy0/S0MNPDp_1Ek8jmisjzdv99Ptdy8g7x0WgCLcBGAs/s1600/Photo_1560158245591.jpg'),
                                                    fit: BoxFit.cover))),
                                        Text("Nasi Tomato"),
                                        Text(
                                          "RM 7.00",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 30),
                                        )
                                      ]),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(0, 0),
                                            blurRadius: 4)
                                      ])),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    SizedBox(
                      height: 400,
                    )
                  ]))),
        ],
      ),
    );
  }
}
