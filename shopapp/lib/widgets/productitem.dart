import 'package:flutter/material.dart';
import '../screen/productdetailscreen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl
  );
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName, 
                arguments:id,
                );
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(title),
                  ),
                  );*/
            },
                      child: GridTile(
        child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            ),
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
              icon: Icon(Icons.favorite), 
              color: Theme.of(context).accentColor,
              onPressed: () {}),
            title: Text(title),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart), 
              color: Theme.of(context).accentColor,
              onPressed: () {}),
        ),
      ),
          ),
    );
  }
}