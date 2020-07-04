import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/place.dart';
import '../helpers/dbhelper.dart';


class GreatPlaces with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get items{
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage)
  {
    final newPlace = Place(
    id: DateTime.now().toString(), 
    title: pickedTitle, 
    loaction: null, 
    image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      //'location': newPlace.loaction
    });
  }

  Future<void> fetchandSetProducts() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((item) => 
    Place(
      id: item['id'], 
      title: item['title'], 
      loaction: null, 
      image: File(item['image']
      )
      )
      ).toList(); 
      notifyListeners();
  }
}