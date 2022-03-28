import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  // double height;
  SmallText({Key? key, this.color = const Color(0xFF2F2F2F),
    required this.text,
    this.size=10,
    this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Lato",
        color: color,
        fontSize: size,
        // height: height,
      ),
    );
  }
}
