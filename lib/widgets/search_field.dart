import 'package:flutter/material.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'emoji_icon.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  // final String type;
  final double size;
  const SearchField({Key? key,
    required this.hintText,
    this.size=18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        color: AppColors.fieldBackgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 4),
              child: EmojiIcon(emoji: "🔍", size: 18,)
          ),
          Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                    fontFamily: "Lato",
                    fontSize: 15
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontFamily: "Lato",
                    color: AppColors.hintTextColor,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              )
          ),
        ],
      ),
    );
  }
}