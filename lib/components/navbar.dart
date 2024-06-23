import 'dart:core';

import 'package:flutter/material.dart';
import 'package:newshub/constants/initializers.dart';
import 'package:newshub/pages/categories_list.dart';
import 'package:newshub/pages/home_headlines.dart';
import 'package:newshub/pages/profile.dart';
import 'package:newshub/pages/saved_headlines.dart';

import 'icons.dart';

class NavBar extends StatefulWidget {
  //final Function()? onTap;
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  bool isSelected = true;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Categories(),
    const SavedArticles(),
    const UserProfile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem bottomNavigationBarItem(String title, int index) {
      return BottomNavigationBarItem(
        backgroundColor: AppColors.primaryColor,
        label: '',
        activeIcon: CustomNavBarItem(
          iconName: Initializers.iconNames.keys.toList()[index],
          isActive: true,
          title: title,
        ),
        icon: CustomNavBarItem(
          iconName: Initializers.iconNames.values.toList()[index],
          isActive: false,
          title: '',
        ),
      );
    }

    return Builder(builder: (context) {
      return Scaffold(
        extendBody: true,
        body: _widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
          height: 80,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.shifting,
              backgroundColor: AppColors.background,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              items: [
                bottomNavigationBarItem("Home", 0),
                bottomNavigationBarItem("Topics", 1),
                bottomNavigationBarItem("Saved", 2),
                bottomNavigationBarItem("Profile", 3),
              ],
              currentIndex: selectedIndex,
              onTap: onItemTapped,
            ),
          ),
        ),
      );
    });
  }
}
