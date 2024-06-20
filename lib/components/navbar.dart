import 'dart:core';

import 'package:flutter/material.dart';
import 'package:newshub/pages/categories_list.dart';
import 'package:newshub/pages/home_headlines.dart';
import 'package:newshub/pages/profile.dart';
import 'package:newshub/pages/saved_headlines.dart';

class navBar extends StatefulWidget {
  //final Function()? onTap;
  const navBar({
    super.key,
  });

  @override
  State<navBar> createState() => NavBarState();
}

class NavBarState extends State<navBar> {
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Categories(),
    SavedArticles(),
    const UserProfile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey.withOpacity(0.2),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black.withOpacity(0.8),
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home_filled,
                    size: 30,
                    //color: Colors.blue,
                  )),
              BottomNavigationBarItem(
                  label: 'Categories',
                  icon: Icon(
                    Icons.category,
                    size: 30,
                  )),
              BottomNavigationBarItem(
                  label: 'Saved',
                  icon: Icon(
                    Icons.bookmark,
                    size: 30,
                  )),
              BottomNavigationBarItem(
                  label: 'Recent',
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  )),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      );
    });
  }
}
