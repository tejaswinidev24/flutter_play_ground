import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cartitem.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartscreen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart')
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Total',
              style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Chip(label: Text('\$${cart.totalamount.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryTextTheme.title.color,
              ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              ),
              FlatButton(
                onPressed: () {
                Provider.of<Orders>(context, listen: false).addOrder(
                  cart.items.values.toList(), cart.totalamount);
                  cart.clear();
              }, 
              
              child: Text(
                'Order Now',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              )
            ],),
            ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id, 
              productId: cart.items.keys.toList()[i],
              title: cart.items.values.toList()[i].title, 
              quantity: cart.items.values.toList()[i].quantity, 
              price: cart.items.values.toList()[i].price,
              ),
              )
          )
      ],)
      
    );
  }
}