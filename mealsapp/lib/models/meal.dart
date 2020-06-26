import 'package:flutter/foundation.dart';

enum Complexity{
  Simple,
  Medium,
  Difficult
}

enum Affordability{
affordable,
pricey,
luxury

}

class Meal{

  String id;
  String title;
  List<String> categories;
  List<String> steps;
  bool isVegan;

  Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.steps,
    @required this.isVegan
  });
}