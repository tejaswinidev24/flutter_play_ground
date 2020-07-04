import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.longitude);
    print(locData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null ? Center(
            child: Text('No Location chosen', 
            textAlign: TextAlign.center,)
          ) : Image.network(_previewImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: _getCurrentUserLocation, 
              icon: Icon(Icons.location_on), 
              textColor: Theme.of(context).primaryColor,
              label: Text('Current Location')
            ),
            FlatButton.icon(
              onPressed: () {}, 
              icon: Icon(Icons.map), 
              label: Text('Select on map'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}