import 'package:flutter/material.dart';
import './maindrawer.dart';
//import './main.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isVegan = false;
  bool isGluten = false;

  Widget buildSwitch(String title, String description, bool currentValue, Function updateValue)
  {
    return SwitchListTile(
                   title: Text(title),
                   value: isVegan,
                   subtitle: Text(description),
                   onChanged: updateValue,
                   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
           body: Column(children: <Widget>[
             Container(
               padding: EdgeInsets.all(20),
               child: Text('Filter meals',
               style: Theme.of(context).textTheme.title,
               ),
             ),
             Expanded(child: ListView(
               children: <Widget>[
                 buildSwitch('Vegan', 'It is Vegan meal', isVegan, 
                 (newValue){
                        setState(() {
                          isVegan = newValue;
                        });
                 }
                        ),
                 /*SwitchListTile(
                   title: Text('Vegan'),
                   value: isVegan,
                   subtitle: Text('It is Vegan meal'),
                   onChanged: (newValue){
                        setState(() {
                          isVegan = newValue;
                        });

                   }
                   ),*/

               ],
             ),
            )

           ],
    ),);
  }
}