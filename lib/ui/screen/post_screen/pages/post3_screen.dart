import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';

class Post3Screen extends StatefulWidget {
  const Post3Screen({Key? key}) : super(key: key);

  @override
  _Post3ScreenState createState() => _Post3ScreenState();
}

class _Post3ScreenState extends State<Post3Screen> {
  bool internet_checkbox = false;
  bool service_checkbox = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
          child: Column(
            children: [Text('Hello')],
          ),
        ),
      ),
    );
  }
}
