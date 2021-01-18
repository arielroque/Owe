import 'package:flutter/material.dart';
import 'package:owe/owe/presentation/pages/home/home_page.dart';
import 'package:owe/owe/presentation/pages/home/profile_page.dart';

class HomeNavigation extends StatefulWidget {
  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {

  int _index = 1;

  final List<Widget> _screens = [
    HomePage(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _index = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _index,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"
        ),
      ],
    ),
    );
  }
}
