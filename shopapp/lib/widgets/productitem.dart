import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../screen/productdetailscreen.dart';

class ProductItem extends StatelessWidget {
  /*final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl
  );*/

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName, 
                arguments:product.id,
                );
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ProductDetailScreen(title),
                  ),
                  );*/
            },
                      child: GridTile(
        child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            ),
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border), 
                color: Theme.of(context).accentColor,
                onPressed: () {
                  product.toggleisFavorite();
                }),
            ),
            title: Text(product.title),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart), 
              color: Theme.of(context).accentColor,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              }),
        ),
      ),
          ),
    );
  }
}