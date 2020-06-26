import 'package:flutter/material.dart';
//import './categoryitem.dart';


class CategoryMeals extends StatelessWidget {
  /*final String categoryid;
  final String categorytitle;
  

  CategoryMeals(this.categoryid, this.categorytitle);*/
  static const routeName = '/category-meals';


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
    final categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
          body: Container(
        child: Center(
        child: Text('data'),
        )
        
      ),
    );
  }
}