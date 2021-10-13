import 'package:flutter/material.dart';
import 'package:food_order/header.dart';
import 'package:food_order/main.dart';
import 'package:dio/dio.dart';

String favorite_food =
    'https://wanz-6124a-default-rtdb.firebaseio.com/kms_food_ordering_system/users/0/fav';

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

  var favorite_list = [];
  void get_fav() async {
    var get_favorite = await Dio().get(favorite_food + ".json");
    var get_favorite_list = get_favorite.data;

    for (var i = 0; i < get_favorite_list.length; i++) {
      if (get_favorite_list[i.toString()] != null) {
        favorite_list.add(get_favorite_list[i.toString()]);
      }
    }
    print(favorite_list);
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
      if (favorite_list == 0)
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            child: Icon(Icons.favorite, color: Colors.grey, size: 200))
      else
        Positioned(
            bottom: 10,
            child: Container(
              // padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  for (var i = 0; i < favorite_list.length; i++)
                    Column(children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(color: Colors.black),
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
