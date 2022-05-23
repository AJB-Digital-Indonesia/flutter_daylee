import 'package:flutter/material.dart';
import 'package:flutter_daylee/screens/profile/profile_screen.dart';
import 'package:flutter_daylee/screens/promo/promo_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_daylee/model.dart';

import 'package:flutter_daylee/screens/home/home_screen.dart';
import 'package:flutter_daylee/screens/transaction/transaction_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,

    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));
  runApp(const DayleeApp());
}

class DayleeApp extends StatelessWidget {
  const DayleeApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provider<User>.value(value: user),
        Provider<Stores>(create: (_) => Stores()),
        ChangeNotifierProvider<Cart>(create: (context) => Cart()),
        ChangeNotifierProvider<Transcation>(create: (context) => Transcation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daylee App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/transaction': (context) => const TransactionScreen(),
          '/promo': (context) => const PromoScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}