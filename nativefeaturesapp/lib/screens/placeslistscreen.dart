import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/greatplaces.dart';
import './addplacescreen.dart';
import '../providers/greatplaces.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
            future: Provider.of<GreatPlaces>(context, listen: false).fetchandSetProducts(),
            builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ?  
            Center(
              child: CircularProgressIndicator(),
            )
            : Consumer<GreatPlaces>(
          child: Center(
            child: Text('No places yet, Start adding some!'),
            ),
          builder: (ctx, greatPlaces ,ch) => 
          greatPlaces.items.length <= 0 ? ch : ListView.builder(
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(greatPlaces.items[i].image),
              ),
              title: Text(greatPlaces.items[i].title),
              onTap: () {
                
              },
            )
          ),
          ),
      )
      );
  }
}