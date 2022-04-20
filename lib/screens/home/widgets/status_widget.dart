import 'package:flutter/cupertino.dart';

class StatusWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  bool status;
  StatusWidget({Key? key,
    this.status=true,
    required this.text,
    this.fontSize=10,
    // this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: "Lato",
      color: status?const Color(0xFF00AC3B):const Color(0xFFAC0000),
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
    final Size txtSize = _textSize(text, textStyle);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      width: txtSize.width+10,
      height: txtSize.height+5,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        color: status?const Color(0xFFC5FFD8):const Color(0xFFFFC5C5),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle,
        softWrap: false,
        overflow: TextOverflow.clip,
        maxLines: 1,
      ),
    );
  }

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}