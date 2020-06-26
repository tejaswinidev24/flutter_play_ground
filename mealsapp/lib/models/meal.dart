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

  final String id;
  final String title;
  final List<String> categories;
  final List<String> steps;
  final bool isVegan;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.steps,
    @required this.imageUrl,
    @required this.isVegan,
    @required this.complexity,
    @required this.affordability
  });
}