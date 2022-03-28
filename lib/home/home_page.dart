import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daylee/components/big_text.dart';
import 'package:flutter_daylee/components/title_text.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        children: [
                          BigText(text: "Halo, Yuki 👋", size: 20,)
                        ]
                    ),
                    Center(
                      child: Container(
                        width: 34,
                        height: 34,
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
                        child: SvgPicture.asset("assets/icons/notif.svg",
                          color: AppColors.iconColor1,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mainColor2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  width: 320,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.fieldBackgroundColor,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 4),
                        child: Text("🔍",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 15
                            ),
                            decoration: InputDecoration(
                              hintText: "Cari layanan sesuai kebutuhanmu!",
                              hintStyle: TextStyle(
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
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 8, left: 20),
              child: BigText(text: 'Penuhi kebutuhanmu!', size: 16,),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 15),
              width: 93,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
                color: AppColors.fieldBackgroundColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

