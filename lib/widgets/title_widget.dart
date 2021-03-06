import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  TitleText({Key? key, this.color = const Color(0xFF2F2F2F),
    required this.text,
    this.size=20,
    this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: "Nunito",
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size,
      ),
    );
  }
}
