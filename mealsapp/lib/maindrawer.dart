import 'package:flutter/material.dart';
import './filterscreen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text, IconData icon, Function tapHandler)
  {
      return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                )
            ),
            onTap: tapHandler,
          );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text('Cooking up!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              ),
          ),
          ),
          SizedBox(height:20),
          buildListTile(
            'Meals', 
            Icons.restaurant_menu,
            (){
              Navigator.of(context).pushReplacementNamed('/');
            }
            ),
          buildListTile(
            'Filters', 
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
            }
            ),
          /*ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                )
            ),
            onTap: () {},
          ),*/
      ],),
    );
  }
}