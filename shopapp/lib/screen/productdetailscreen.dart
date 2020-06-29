import 'package:flutter/material.dart';
class ProductDetailScreen extends StatelessWidget {
  /*final String title;
  ProductDetailScreen(this.title);*/
  
  static const routeName = '/productdetails';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productTitle = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(productTitle),
      ),
          
    );
  }
}