import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appdrawer.dart';
import '../widgets/userproductitem.dart';
import '../providers/products.dart';
import '../screen/editproductscreen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/userproducts';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchandSetProduct(true);
  }
  @override
  Widget build(BuildContext context) {
    //final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            })
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
              builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
              Center(child: CircularProgressIndicator(),) 
              : RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
                child: Consumer<Products>(
                    builder:(ctx, productData, _) => Padding(padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productData.items.length,
            itemBuilder: (_, i) => Column(
              children: <Widget>[
                  UserProductItem(
                    productData.items[i].id,
                    productData.items[i].title, 
                    productData.items[i].imageUrl),
                    Divider(),
              ],
            )
            ),
          ),
                ),
        ),
      ),
    );
  }
}