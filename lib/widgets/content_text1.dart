import 'package:flutter/material.dart';

class ContentText1 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextDecoration? decoration;
  // double height;
  ContentText1({Key? key,
    this.color = const Color(0xFF2F2F2F),
    required this.text,
    this.size=15,
    this.decoration,
    // this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Nunito",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
        decoration: decoration,
      ),
    );
  }
}
