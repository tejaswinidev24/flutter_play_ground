import 'package:flutter/material.dart';
import './mealitem.dart';
//import './main.dart';
import './models/meal.dart';


class CategoryMeals extends StatefulWidget {
  /*final String categoryid;
  final String categorytitle;
  

  CategoryMeals(this.categoryid, this.categorytitle);*/
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;

  CategoryMeals(this.availableMeal);


  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  
  var _loadedInitdata = false;
  

  void initState()
  {
    /*final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = dummymeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();*/
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitdata)
    {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = widget.availableMeal.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitdata = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId)
  {
    setState(() {
      displayedMeals.where((meal) =>
        meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    /*final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categorymeals = dummymeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();*/
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
          body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              categories: displayedMeals[index].categories,
              steps: displayedMeals[index].steps,
              isVegan: displayedMeals[index].isVegan,
              id: displayedMeals[index].id,
              removeItem: _removeMeal,
              );
          },itemCount: displayedMeals.length,        
        )
      ),
    );
  }
}