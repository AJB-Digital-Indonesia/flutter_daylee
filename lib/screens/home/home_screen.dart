import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_daylee/widgets/cardtitle_text.dart';
import 'package:flutter_daylee/widgets/search_field.dart';
import 'package:flutter_daylee/widgets/title_widget.dart';
import 'package:flutter_daylee/widgets/emoji_icon.dart';
import 'package:flutter_daylee/widgets/bottom_navbar.dart';
import 'package:flutter_daylee/screens/home/widgets/desc_text.dart';
import 'package:flutter_daylee/screens/home/widgets/status_widget.dart';
import 'package:flutter_daylee/screens/services/services.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/model.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: BottomNavBar(initialSelectedScreenNum: 0,),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.mainColor,
      pinned: true,
      snap: false,
      floating: true,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: [
                TitleText(text: "Halo, Yuki 👋", size: 20,)
              ]
          ),
          SizedBox(
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(46.0),
        child: Container(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 6, top: 6),
          child: (
            const SearchField(hintText: "Cari layanan sesuai kebutuhanmu!",)
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        showSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: const [
                  MainMenuSection(),
                  PromoSection(),
                  ServiceStatusSection(),
                ],
              ),
            ),
          ]),
        ),
      ],
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
            children: const <Widget>[
              ServiceMenuCard(emoji: "👕", text: "Laundry", type: "Laundry",),
              ServiceMenuCard(emoji: "💧", text: "Air Galon", type: "Galon",),
              ServiceMenuCard(emoji: "🧹", text: "Bersih-bersih", type: "Bersih-bersih",),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              ServiceMenuCard(emoji: "📄", text: "Fotokopi", type: "Fotokopi",),
              ServiceMenuCard(emoji: "📦", text: "Pindahan", type: "Pindahan",),
              ServiceMenuCard(emoji: "⚒", text: "Lainnya", type: "Lainnya",),
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
          Column(
            children: Provider.of<Transcation>(context).transactions.map((item){
              String emojiStoreType = "⚒";
              if (item.type=="Galon") {
                emojiStoreType = "💧";
              } else if (item.type=="Laundry") {
                emojiStoreType = "👕";
              } else if (item.type=="Bersih-bersih") {
                emojiStoreType = "🧹";
              }  else if (item.type=="Fotokopi") {
                emojiStoreType = "📄";
              } else if (item.type=="Pindahan") {
                emojiStoreType = "📦";
              }
              return ServiceStatusCard(
                emoji: emojiStoreType,
                provider: item.storeName,
                status: item.isValid,
                statusText: item.status,
                description: item.statusDescription,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}


class ServiceMenuCard extends StatelessWidget {
  final String emoji;
  final String text;
  final String type;
  final double emojiSize;
  final double textSize;
  final Function()? press;
  const ServiceMenuCard({Key? key,
    required this.emoji,
    required this.text,
    required this.type,
    this.emojiSize=25,
    this.textSize=14,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: Ink(
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
                margin: const EdgeInsets.only(top: 8),
                child: CardTitleText(text: text,),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ServiceScreen(
        service: text+" "+emoji,
        type: type,
        filteredStoreByType: Provider.of<Stores>(context).stores.where((element) => element.type==type).toList(),
      ),
      // transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
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
