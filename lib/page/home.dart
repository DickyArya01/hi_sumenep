import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/appbar/favouriteAppbar.dart';
import 'package:hi_sumenep_app/component/appbar/homeAppbar.dart';
import 'package:hi_sumenep_app/component/appbar/profileAppbar.dart';
import 'package:hi_sumenep_app/component/navbar.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/login_page.dart';
import 'package:hi_sumenep_app/page/mainPage/favouritepage.dart';
import 'package:hi_sumenep_app/page/mainPage/homepage.dart';
import 'package:hi_sumenep_app/page/mainPage/profilepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int selectedIndex = 0;

  double navbarHeight = 0;

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 2) {
        if (isLogin) {
          selectedIndex = index;
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
          selectedIndex = 0;
        }
      }
    });
  }

  selectedCategory(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  itemNavbar(double value) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: value,
      child: FABBottomAppBar(
        height: value,
        color: Colors.grey,
        selectedColor: kBlueColor,
        backgroundColor: Colors.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: listItems,
      ),
    );
  }

  final List<FABBottomAppBarItem> listItems = [
    FABBottomAppBarItem(iconData: Icons.home),
    FABBottomAppBarItem(iconData: Icons.favorite),
    FABBottomAppBarItem(iconData: Icons.account_circle),
  ];

  final List<AppBar> _appbar = [
    homeAppbar(),
    favouriteAppbar(),
    profileAppbar()
  ];

  final List<Widget> _children = [HomePage(), FavouritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar[selectedIndex],
        body: _children[selectedIndex],
        bottomNavigationBar: itemNavbar(kBottomNavigationBarHeight)
        // bottomNavigationBar: const Navbar()
        );
  }
}
