import 'package:flutter/material.dart';
import 'package:yayasan_prihatin/screens/home_screen2.dart';
import 'package:yayasan_prihatin/screens/news_screen.dart';
import 'package:yayasan_prihatin/screens/terkini_prihatin_screen.dart';

import 'app_drawer.dart';
import 'screens/home_screen.dart';
import 'screens/registration_screen.dart';

class BottomBarNavigation extends StatefulWidget {
  static const String id = 'bottom_bar_nav';

  @override
  _BottomBarNavigationState createState() => new _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    HomeScreen2(),
    RegistrationScreen(),
    // TerkiniPrihatinScreen(),
    // NewsScreen(),
    // ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: 'Halaman Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.app_registration,
              size: 30,
            ),
            label: 'Peluang Pendidikan',
            backgroundColor: Color(0XFF1D7BB8),
          ),
        ],
      ),
      body:
          //  IndexedStack(
          //   children: tabPages,
          //   index: _pageIndex,
          // ),
          PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    // this._pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    _pageController.jumpToPage(index);
    // setState(() {
    //   _pageIndex = index;
    // });
  }
}
