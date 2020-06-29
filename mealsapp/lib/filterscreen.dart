import 'package:flutter/material.dart';
import './maindrawer.dart';
//import './main.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegan = false;
  bool _isGluten = false;

  initState()
  {
    _isVegan = widget.currentFilters['vegan'];
    _isGluten = widget.currentFilters['gluten'];
    super.initState();
  }

  Widget buildSwitch(String title, String description, bool currentValue, Function updateValue)
  {
    return SwitchListTile(
                   title: Text(title),
                   value: currentValue,
                   subtitle: Text(description),
                   onChanged: updateValue,
                   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
          final selectedFilters= {
              'gluten':false,
              'vegan': false,
              };
            widget.saveFilters(selectedFilters);
            }),
        ],
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
                 buildSwitch('Vegan', 'It is Vegan meal', _isVegan, 
                 (newValue){
                        setState(() {
                          _isVegan = newValue;
                        }
                        );
                        }
                        ),
                        buildSwitch('Gluten', 'Include only Gluten meal', _isGluten, 
                 (newValue){
                        setState(() {
                          _isGluten = newValue;
                        }
                        );
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
            ),
           ],
    ),);
  }
}