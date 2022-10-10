import 'package:flutter/material.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';
import 'package:resto_app/ui/detail_page.dart';
import 'package:resto_app/data/model/restaurant_list.dart';
import 'package:resto_app/ui/home_page.dart';
import 'package:resto_app/ui/restaurant_list.dart';
import 'package:resto_app/widget/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        RestaurantListPage.routeName: (context) => RestaurantListPage(),
      },
    );
  }
}
