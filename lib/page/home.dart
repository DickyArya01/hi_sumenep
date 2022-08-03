import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/component/navbar.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/mainPage/homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
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

  final List<Widget> _children = [
    const homePage(),
    pageFavourite(),
    pageProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar[selectedIndex],
      body: _children[selectedIndex],
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.blue,
        backgroundColor: Colors.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: listItems,
      ),
      // bottomNavigationBar: const Navbar()
    );
  }
}

AppBar homeAppbar() {
  return AppBar(
    title: Image.asset(logo),
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ), //rubah warna status bar
    elevation: 0, // menghilangkan shadow
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: x16),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(x24),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: hintText,
                ),
              )),
              GestureDetector(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.only(left: x24),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(x8),
                    ),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(
                        Icons.candlestick_chart_rounded,
                        color: Colors.white,
                        size: 38,
                      ),
                    )),
              )
            ],
          ),
        )),
  );
}

AppBar favouriteAppbar() {
  return AppBar(
    title: const Text('Favourite'),
  );
}

AppBar profileAppbar() {
  return AppBar(
    title: const Text('Profile'),
  );
}

Center pageFavourite() {
  return const Center(
    child: Text('Favourite'),
  );
}

Center pageProfile() {
  return const Center(
    child: Text('Profile'),
  );
}
