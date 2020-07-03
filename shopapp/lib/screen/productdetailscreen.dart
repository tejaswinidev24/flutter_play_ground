import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
class ProductDetailScreen extends StatelessWidget {
  /*final String title;
  ProductDetailScreen(this.title);*/
  
  static const routeName = '/productdetails';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedproduct = Provider.of<Products>(
      context,
      listen: false,
      ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedproduct.title),
      ),
      body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                 Container(
            height: 300,
            width: double.infinity,
            child: Hero(
              tag: loadedproduct.id,
                          child: Image.network(
                loadedproduct.imageUrl,
                fit: BoxFit.cover,
                ),
            )
          ),
          SizedBox(height: 10),
          Text('\$${loadedproduct.price}',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
                      child: Text(loadedproduct.description,
            textAlign: TextAlign.center,
            softWrap: true,
            ),
          )
                ],
        ),
      ),  
    );
  }
}