import 'package:flutter/material.dart';

import '../widgets/icon_badge.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => Home()),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 10.0),
            IconButton(
              onPressed: () => MainScreen(),
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () => MainScreen(),
                icon: Icon(Icons.map_sharp),
                color: Colors.white),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/track_expense');
              },
              icon: Icon(Icons.attach_money_rounded),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () => MainScreen(),
                icon: Icon(Icons.person),
                color: Colors.white),
            SizedBox(width: 7.0),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge
          ? IconBadge(
              icon: icon,
              size: 24.0,
              color: Colors.black,
            )
          : Icon(icon, size: 24.0),
      color: _page == page
          ? Theme.of(context).colorScheme.secondary
          : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}
