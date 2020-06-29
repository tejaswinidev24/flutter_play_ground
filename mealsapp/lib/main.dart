import 'package:flutter/material.dart';
import './tabscreen.dart';
import './dummydata.dart';
import './categorymealsscreen.dart';
import './mealdetailscreen.dart';
import './filterscreen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
Map <String, bool> _filters = {
  'gluten':false,
  'vegan': false,
};

List<Meal>_availableMeal = dummymeals;
void _setFilters(Map<String, bool> filterData)
{
  setState(() {
    _filters = filterData;

    _availableMeal=dummymeals.where((meal){
        if(_filters['vegan'] && !meal.isVegan){
          return false;
        }
        if(_filters['gluten'] && !meal.isVegan){
          return false;
        }
        return true;
     }).toList();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMeals.routeName: (context) =>CategoryMeals(_availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context)=> FilterScreen(_filters ,_setFilters),
      },
    );
  }
}
