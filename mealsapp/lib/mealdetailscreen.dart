import 'package:flutter/material.dart';
import 'package:mealsapp/dummydata.dart';
//import './main.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealdetails';

  Widget buildSectionTitle (BuildContext context, String text)
  {
    return Container(
                padding: EdgeInsets.all(20),
                child: Text(text,
                style:  Theme.of(context).textTheme.title,
                ),
              );
  }


  Widget buildContainer(Widget child)
  {
    return Container(
                  width: 300,
                  height: 200,
                  child: child,
    
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments; 
    final selectedMeal = dummymeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
          appBar: AppBar(title: Text('${selectedMeal.title}')),
          body: SingleChildScrollView(
                      child: Column(children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl,
                fit: BoxFit.cover,
                ),
                ),
                /*Container(
                  padding: EdgeInsets.all(20),
                  child: Text('Ingredients',
                  style:  Theme.of(context).textTheme.title,
                  )
                  ,),*/
                  buildSectionTitle(context, 'Categories'),
                 /* Container(
                    width: 300,
                    height: 200,*/
                    buildContainer( ListView.builder(
                      itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          selectedMeal.categories[index]
                          ),
                      ),
                      itemCount: selectedMeal.categories.length,
                      )
                    ),
                    buildSectionTitle(context, 'Steps'),
                    buildContainer(
                      ListView.builder(itemBuilder: (ctx, index) =>Card(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          selectedMeal.steps[index]
                          ),
                      ),
                      itemCount: selectedMeal.steps.length,
                      ),
                    )
            ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.delete),
            onPressed: (){
            Navigator.of(context).pop(mealId);
          }),
    );
  }
}