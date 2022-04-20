import 'package:flutter/material.dart';

class EmojiIcon extends StatelessWidget {
  final String emoji;
  double size;
  EmojiIcon({Key? key,
    required this.emoji,
    this.size=18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      emoji,
      style: TextStyle(
        fontFamily: "Nunito",
        fontSize: size,
        fontWeight: FontWeight.w700,
        // height: height,
      ),
    );
  }
}