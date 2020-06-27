import 'package:flutter/material.dart';
import './maindrawer.dart';
import './favoritescreen.dart';
import './categoriesscreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page':FavoriteScreen(), 'title':'Favorites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index)
  {
    setState(() {
      _selectedPageIndex = index;
    });


  }
  @override
  Widget build(BuildContext context) {
    return /*DefaultTabController(
      length: 2, 
      child: */
      Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          /*bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ]
          ),*/
        ),
        drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title:Text('Categories',),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title:Text('Favorites',),
          ),
        ],
      ),
      /*TabBarView(children: <Widget>[
        CategoryScreen(),
        FavoriteScreen(),
      ],)*/
      );
    //);
  }
}