import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daylee/components/cardtitle_text.dart';
import 'package:flutter_daylee/components/title_widget.dart';
import 'package:flutter_daylee/components/emoji_icon.dart';
import 'package:flutter_daylee/home/components/desc_text.dart';
import 'package:flutter_daylee/home/components/status_widget.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/nav_bar.dart';

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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  MainMenuSection(),
                  PromoSection(),
                  ServiceStatusSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    children: [
                      TitleText(text: "Halo, Yuki 👋", size: 20,)
                    ]
                ),
                Container(
                  width: 34,
                  height: 34,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.mainColor2,
                      shape: CircleBorder(),
                    ),
                    child: SvgPicture.asset("assets/icons/notif.svg")
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 7),
              width: MediaQuery.of(context).size.width,
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
                      child: EmojiIcon(emoji: "🔍", size: 18,)
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
    );
  }
}

class MainMenuSection extends StatelessWidget {
  const MainMenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10,),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6,),
                child: TitleText(text: 'Penuhi kebutuhanmu!', size: 16,),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuCard(emoji: "👕", text: "Laundry"),
              MenuCard(emoji: "💧", text: "Air Galon"),
              MenuCard(emoji: "🧹", text: "Bersih-bersih"),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuCard(emoji: "📄", text: "Fotokopi"),
              MenuCard(emoji: "📦", text: "Pindahan"),
              MenuCard(emoji: "⚒", text: "Lainnya"),
            ],
          ),
        ],
      ),
    );
  }
}

class PromoSection extends StatelessWidget {
  const PromoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10,),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6,),
                child: TitleText(text: 'Promo', size: 16,),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/images/promo1.png"),
          ),
        ],
      ),
    );
  }
}

class ServiceStatusSection extends StatelessWidget {
  const ServiceStatusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10,),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6,),
                child: TitleText(text: 'Layanan Saat Ini', size: 16,),
              ),
            ],
          ),
          ServiceStatusCard(
            emoji: "👕",
            provider: "Laundry Orange Cisitu Lama",
            status: true,
            statusText: "Diproses",
            description: "Perkiraan waktu antar 27/03 19:00",
          ),
          ServiceStatusCard(
            emoji: "💧",
            provider: "Galon Bang Lorem",
            status: false,
            statusText: "Dibatalkan Penjual",
            description: "Toko Tutup",
          ),
          ServiceStatusCard(
            emoji: "💧",
            provider: "Galon Bang Lorem",
            status: false,
            statusText: "Dibatalkan Penjual",
            description: "Toko Tutup",
          ),
          ServiceStatusCard(
            emoji: "💧",
            provider: "Galon Bang Lorem",
            status: false,
            statusText: "Dibatalkan Penjual",
            description: "Toko Tutup",
          ),
        ],
      ),
    );
  }
}


class MenuCard extends StatelessWidget {
  final String emoji;
  final String text;
  double emojiSize;
  double textSize;
  MenuCard({Key? key,
    required this.emoji,
    required this.text,
    this.emojiSize=25,
    this.textSize=14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        color: AppColors.fieldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: EmojiIcon(emoji: emoji, size: emojiSize,),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: CardTitleText(text: text,),
          ),
        ],
      ),
    );
  }
}

class ServiceStatusCard extends StatelessWidget {
  final String emoji;
  final String provider;
  bool status;
  String statusText;
  String description;
  ServiceStatusCard({Key? key,
    required this.emoji,
    required this.provider,
    this.status=true,
    this.statusText="Diproses",
    this.description="",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: EdgeInsets.only(bottom: 6),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
        color: AppColors.fieldBackgroundColor,
      ),
      child: Row(
        children: [
          EmojiIcon(emoji: emoji, size: 28,),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CardTitleText(text: provider),
              Row(
                  children: [
                    StatusWidget(text: statusText, status: status,),
                    SizedBox(width: 5,),
                    DescText(text: description),
                  ]
              ),
            ],
          ),
        ],
      ),
    );
  }
}
