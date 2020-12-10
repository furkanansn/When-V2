import 'package:flutter/material.dart';
import 'package:flutter_app_homeone/main.dart';
import 'package:flutter_app_homeone/View/settings.dart';
import 'package:flutter_app_homeone/View/message.dart';
import 'package:flutter_app_homeone/View/profile.dart';
import 'package:flutter_app_homeone/View/discover.dart';
import 'package:flutter_app_homeone/View/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_homeone/providers/HouseProvider.dart';
import 'package:provider/provider.dart';

import 'drawer_screen.dart';

class bottomNavBar extends StatefulWidget {

  bool isDrawerOpen = false;
  @override
  _bottomNavBarState createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  List<Widget> _tabWidgets = [
    ChangeNotifierProvider<HouseProvider>(child: HomeScreen(),create: (context)=>HouseProvider(),),
    discover(),
    message(),
    profile(),
    SettingsPage(),
  ];
  int _currentIndex = 0;

  void _onTabChanged(int index) => this.setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _tabWidgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        iconSize: 25,
        currentIndex: _currentIndex,
        onTap: (index) => this._onTabChanged(index),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink.shade900,
            title: Text("Home"),
            icon: Icon(Icons.home),


          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink.shade900,
            title: Text("Discover"),
            icon: Icon(Icons.find_in_page),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            title: Text("Mesajlar"),
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink.shade900,
            title: Text("Profil"),
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink.shade900,
            title: Text("Ayarlar"),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
