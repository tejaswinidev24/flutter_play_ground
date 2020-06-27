import 'package:flutter/material.dart';
import './models/category.dart';
import './models/meal.dart';

const dummydata = const [

Category(
  id: 'c1',
  title: 'Noodles',
  color: Colors.purpleAccent,
),

Category(
  id: 'c2',
  title: 'Italian',
  color: Colors.red,
),

Category(
  id: 'c3',
  title: 'Chinese',
  color: Colors.amberAccent,
),

Category(
  id: 'c4',
  title: 'SeaFood',
  color: Colors.green,
),

Category(
  id: 'c5',
  title: 'Korean',
  color: Colors.greenAccent,
),

Category(
  id: 'c6',
  title: 'Pasta',
  color: Colors.redAccent,
),

Category(
  id: 'c7',
  title: 'Gobi',
  color: Colors.blue,
),

Category(
  id: 'c8',
  title: 'SpicyFood',
  color: Colors.blueGrey,
),

Category(
  id: 'c9',
  title: 'Rice',
  color: Colors.blueAccent,
),

Category(
  id: 'c10',
  title: 'Dosa',
  color: Colors.deepPurpleAccent,
),

Category(
  id: 'c11',
  title: 'Mexican',
  color: Colors.greenAccent,
),

Category(
  id: 'c12',
  title: 'Nort Indian',
  color: Colors.redAccent,
),


];

const dummymeals = const[

  Meal(
    id: '1',
    title: 'tomato sauce',
    categories: [
      'c1','c2'
    ],
    steps: [
      'add tomato','add water'
    ],
    isVegan: true,
    imageUrl: 'https://images.unsplash.com/photo-1591619573607-fd6c8c05b6eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjQ3MzMyfQ&auto=format&fit=crop&w=700&q=80',
    complexity: Complexity.Simple,
    affordability: Affordability.affordable,
  ),
    

  Meal(
    id: '2',
    title: 'sauce',
    categories: [
      'c4','c7'
    ],
    steps: [
      'add tomato','add water'
    ],
    isVegan: false,
    imageUrl: 'https://images.unsplash.com/photo-1591619573607-fd6c8c05b6eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjQ3MzMyfQ&auto=format&fit=crop&w=700&q=80',
    complexity: Complexity.Difficult,
    affordability: Affordability.luxury,
  ),

  Meal(
    id: '3',
    title: 'white sauce',
    categories: [
      'c9','c4'
    ],
    steps: [
      'add tomato','add water'
    ],
    isVegan: true,
    imageUrl: 'https://images.unsplash.com/photo-1591619573607-fd6c8c05b6eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjQ3MzMyfQ&auto=format&fit=crop&w=700&q=80',
    complexity: Complexity.Medium,
    affordability: Affordability.pricey,
  ),

  Meal(
    id: '4',
    title: 'green sauce',
    categories: [
      'c3','c7'
    ],
    steps: [
      'add tomato','add water'
    ],
    isVegan: false,
    imageUrl: 'https://images.unsplash.com/photo-1591619573607-fd6c8c05b6eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjQ3MzMyfQ&auto=format&fit=crop&w=700&q=80',
    complexity: Complexity.Simple,
    affordability: Affordability.luxury,
  ),

];