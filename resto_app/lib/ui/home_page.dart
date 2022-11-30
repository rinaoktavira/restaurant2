import 'package:flutter/material.dart';
import 'package:resto_app/data/model/restaurant_search.dart';
import 'package:resto_app/data/model/restaurants_detail.dart';
import 'package:resto_app/ui/detail_page.dart';
import 'package:resto_app/data/model/restaurant_list.dart';
import 'package:resto_app/ui/restaurant_list.dart';
import 'package:resto_app/ui/search_restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    const RestaurantListPage(),
    const RestaurantSearchPage(),
    const Center(
      child: Text('Favorit'),
    ),
    const Center(
      child: Text('Profil'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime.shade400,
        elevation: 0,
        title: const Text(
          "Restaurant App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      unselectedFontSize: 0,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(0.5),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Colors.lime.shade200,
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: 'Favorite', icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(
            label: 'Profil', icon: Icon(Icons.account_balance_outlined))
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}
