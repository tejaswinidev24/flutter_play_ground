import 'package:flutter/material.dart';
import './models/meal.dart';
import './mealdetailscreen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  //final int duration;
  final Complexity complexity;
  final List<String> categories;
  final List<String> steps;
  final bool isVegan;
  final Affordability affordability;
  final String id;
  final Function removeItem;
  
  MealItem({
    @required this.imageUrl,
    @required this.complexity,
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.steps,
    @required this.isVegan,
    @required this.affordability,
    @required this.removeItem
  });

  String get complexityText
  {
    switch (complexity)
    {
        case Complexity.Simple:
        return 'Simple';
        break;
        case Complexity.Medium:
        return 'Medium';
        break;
        case Complexity.Difficult:
        return 'Difficult';
        break;
        default:
        return 'Unknown';
    }
    
  }
  void selectMeal(BuildContext context)
  {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName, 
      arguments: id,
    ).then((result) => print(result));  
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectMeal(context),
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
                  child: Image.network(imageUrl, 
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(20),
                    child: Text(title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),softWrap: true,
                      overflow: TextOverflow.fade,
                    ),),
                    )
              ],),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule,),
                    SizedBox(width: 6,),
                    Text('Duration'),
                    //SizedBox(width: 6,),
                    
                  ],),
                  Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexityText)
                    ],)
                  
                ],), 
                

              )
          ],
          ),
        ),
      
    );
  }
}