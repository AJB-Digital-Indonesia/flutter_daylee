import 'package:flutter/material.dart';

class ContentText2 extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  // double height;
  ContentText2({Key? key,
    this.color = const Color(0xFF2F2F2F),
    required this.text,
    this.size=15,
    // this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
