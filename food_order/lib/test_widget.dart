import 'package:flutter/material.dart';

var screen_width;

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screen_width = MediaQuery.of(context).size.width;
    return Container();
  }
}

Widget test_widget = Container(
  width: screen_width,
  height: 10,
  decoration: BoxDecoration(color: Colors.black),
);
