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

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransactionBody(),
      bottomNavigationBar: BottomNavBar(initialSelectedScreenNum: 1,),
    );
  }
}

class TransactionBody extends StatefulWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  _TransactionBodyState createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {
  SliverAppBar showSliverAppBar() {
    return SliverAppBar(
      backgroundColor: AppColors.mainColor,
      pinned: true,
      snap: false,
      floating: true,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
              children: [
                TitleText(text: "Transaksi Kamu📃", size: 20,)
              ],
          ),
        ]
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
            ),
          ]),
        ),
      ],
    );
  }
}
