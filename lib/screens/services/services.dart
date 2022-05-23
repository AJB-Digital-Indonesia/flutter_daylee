import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/widgets/content_text1.dart';
import 'package:flutter_daylee/widgets/content_text2.dart';
import 'package:flutter_daylee/widgets/title_widget.dart';
import 'package:flutter_daylee/widgets/search_field.dart';

import 'package:flutter_daylee/model.dart';
import 'package:flutter_daylee/screens/stores/stores.dart';

class ServiceScreen extends StatelessWidget {
  final String service;
  final String type;
  final List<Store> filteredStoreByType;
  const ServiceScreen({Key? key,
    required this.service,
    required this.type,
    required this.filteredStoreByType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        leading: IconButton(
          icon: const Icon(IconData(0xe094, fontFamily: 'MaterialIcons'),
            color: AppColors.mainColor2,
            size: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            context.read<Cart>().removeAll();
          }
        ),
        titleSpacing: 0.0,
        title: TitleText(text: service,),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 18, left: 18, top: 2, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TitleText(text: "Lokasi", size: 14,),
                        const Icon(IconData(0xf13d, fontFamily: 'MaterialIcons'),
                          color: AppColors.mainColor2,
                          size: 18,
                        ),
                      ],
                    ),
                    ContentText2(text: "Kos Cisitu Baru No. 99")
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 18, left: 18, top: 10, bottom: 10),
                child: SearchField(hintText: service.substring(0, service.length-2)+"...",),
              ),
            ],
          )
        ),
      ),
      body: Column(
        children: [
          NearbyStoreSection(nearbyStores: filteredStoreByType,),
          TopStoreSection(topStores: filteredStoreByType,),
        ]
      ),
    );
  }
}

class NearbyStoreSection extends StatelessWidget {
  final List<Store> nearbyStores;
  const NearbyStoreSection({
    Key? key,
    required this.nearbyStores,
    this.press,
  }) : super(key: key);
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.mainColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 3,),
                      child: TitleText(text: 'Disekitarmu', size: 16,),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 6,),
                      child: ContentText1(text: 'Paling dekat dengan lokasimu saat ini!', size: 13,),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.buttonBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: ContentText2(text: 'Lihat Semua', size: 12, color: AppColors.mainColor2,),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              children: nearbyStores.map((element) {
                return StoreCard(
                  store: element,
                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }
}

class TopStoreSection extends StatelessWidget {
  final List<Store> topStores;
  const TopStoreSection({
    Key? key,
    required this.topStores,
    this.press,
  }) : super(key: key);
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: AppColors.mainColor,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 3,),
                        child: TitleText(text: 'Top Rating', size: 16,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6,),
                        child: ContentText1(text: 'Paling direkomendasikan!', size: 13,),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.buttonBackgroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: ContentText2(text: 'Lihat Semua', size: 12, color: AppColors.mainColor2,),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                children: topStores.map((element) {
                  return StoreCard(
                    store: element,
                  );
                }).toList(),
              ),
            ),
          ],
        )
    );
  }
}

class StoreCard extends StatelessWidget {
  // final String image, store, type;
  // final double distance, rating;
  // final Function()? press;
  final Store store;

  const StoreCard({
    Key? key,
    required this.store,
    // required this.image,
    // required this.store,
    // required this.type,
    // required this.distance,
    // required this.rating,
    // required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String image;
    if (store.type=="Galon") {
      image = "assets/images/galon_store1.png";
    } else {
      image = "assets/images/laundry_store1.png";
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(_createRoute()),
        child: Column(
          children: <Widget>[
            Image.asset(image),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ContentText1(text: "📍 ${store.distance} KM", size: 11, color: AppColors.textContentColor,),
                      ContentText1(text: " | ", color: AppColors.textContentColor,),
                      ContentText1(text: "⭐  ${store.rating}", size: 11, color: AppColors.textContentColor,)
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      store.name,
                      style: const TextStyle(
                        fontFamily: "Lato",
                        color: AppColors.titleColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ContentText1(text: store.type, size: 12, color: AppColors.textContentColor,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => StoresScreen(store: store,),
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