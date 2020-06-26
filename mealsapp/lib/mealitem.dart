import 'package:flutter/material.dart';
import './models/meal.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  
  MealItem({
    @required this.imageUrl,
    @required this.complexity,
    @required this.duration,
    @required this.title
  });

  void selectMeal()
  {

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl, height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
                )
              ],)
          ],
          ),
        ),
      
    );
  }
}