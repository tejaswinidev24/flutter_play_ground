import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation{
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    @required this.address
  });

}

class Place{
  final String id;
  final String title;
  final PlaceLocation loaction;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.loaction,
    @required this.image
  });

}