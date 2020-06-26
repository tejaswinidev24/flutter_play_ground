import 'package:flutter/material.dart';
import './mealitem.dart';
import './dummydata.dart';


class CategoryMeals extends StatelessWidget {
  /*final String categoryid;
  final String categorytitle;
  

  CategoryMeals(this.categoryid, this.categorytitle);*/
  static const routeName = '/category-meals';


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categorymeals = dummymeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
          body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealIem(
              title: categorymeals[index].title,
              imageUrl: categorymeals[index].imageUrl,
              complexity: categorymeals[index].complexity,
              duration: categorymeals[index].duration,
          },itemCount: categorymeals.length,        
        )
      ),
    );
  }
}