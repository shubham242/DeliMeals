import 'package:flutter/material.dart';

import './favorites.dart';
import './categories.dart';
import '../widgets/drawer.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Map<String, Object>> _pages = [
    {'page': Categories(), 'title': 'Categories'},
    {'page': Favorites(), 'title': 'Favorites'},
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      drawer: MyDrawer(),
      body: (_pages[_selectedPageIndex]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Theme.of(context).accentColor),
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
