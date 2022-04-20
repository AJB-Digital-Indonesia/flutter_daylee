import 'package:flutter/cupertino.dart';

class DescText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  DescText({Key? key, this.color = const Color(0xFF969696),
    required this.text,
    this.size=13,
    this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: "Lato",
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}