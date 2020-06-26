import 'package:flutter/material.dart';
import './dummydata.dart';
import './categoryitem.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Meal'),
          ),
          body: GridView(
            padding: const EdgeInsets.all(25),
        children: dummydata.map((catdata) =>
          CategoryItem(id: catdata.id,title:catdata.title, color: catdata.color)
      
      ).toList(),

       
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
        ),
    );
  }
}