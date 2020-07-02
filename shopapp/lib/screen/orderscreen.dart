import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appdrawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/orderitem.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    //final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context).fetchandSetOrders(),
        builder: (ctx, dataSnapshot){
          if(dataSnapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
          if(dataSnapshot.connectionState == null)
          {
            return Text('An error occured!');
          }
          else{
            return Consumer<Orders>(builder: (ctx, orderData, child) =>
            ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i], ),
        ),
        );
          }
        }
       }
      ) 
    );
  }
}