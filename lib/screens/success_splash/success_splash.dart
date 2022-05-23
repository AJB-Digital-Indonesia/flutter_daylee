import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_daylee/screens/home/home_screen.dart';
import 'package:flutter_daylee/utils/colors.dart';
import 'package:flutter_daylee/widgets/content_text2.dart';


import 'package:flutter_daylee/model.dart';

class SuccessSplashScreen extends StatelessWidget {
  const SuccessSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1200,
      animationDuration: Duration(milliseconds: 1500),
      splash: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Terima kasih!",
              style: TextStyle(
                fontFamily: "Nunito",
                color: AppColors.mainColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            ContentText2(text: "Pesanan Sukses!", size: 18, color: AppColors.mainColor,),
            // SizedBox(height: 80,),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   padding: EdgeInsets.symmetric(horizontal: 60),
            //   child: Image.asset("assets/images/success_logo.png", fit: BoxFit.fitWidth),
            // ),
          ],
        ),
      ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      customTween: Tween(
          begin: Offset(0.0, 1.0),
          end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut)
      ),
      backgroundColor: AppColors.mainColor2,
    );
  }
}
