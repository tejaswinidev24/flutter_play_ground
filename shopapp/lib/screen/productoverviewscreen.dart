import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/appdrawer.dart';
import '../widgets/badge.dart';
//import 'package:provider/provider.dart';
//import 'package:shopapp/providers/product.dart';
//import '../models/product.dart';
//import '../providers/products.dart';
import '../widgets/productgrid.dart';
import 'cartscreen.dart';
//import '../widgets/productitem.dart';

enum Filteroptions{

  Favorites,
  All

  }

class ProductScreen extends StatefulWidget {

  
  /*final List <Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  
  ];*/
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //static const routeName = '/productoverviewscreen';
  var _showFavonly = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchandSetProduct();
    /*Future.delayed(Duration.zero).then((_) {
      Provider.of<Products>(context).fetchandSetProduct();
    });*/
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit)
    {
      setState(() {
        _isLoading = true;
      });
      
      Provider.of<Products>(context).fetchandSetProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShopping'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (Filteroptions selectedValue){
              setState(() {
                if(selectedValue == Filteroptions.Favorites)
              {
                _showFavonly = true;
                //productsContainer.showFavoritesonly();

              }else{
                _showFavonly=false;
                  //productsContainer.showAll();
              }
                
              });
              
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) =>[
                PopupMenuItem(
                  child: Text('Only Favorites'), value: Filteroptions.Favorites,
                  ),
                  PopupMenuItem(child: Text('Show All'), value:Filteroptions.All),
            ],
            ),
            Consumer<Cart>(builder:(_, cart, ch) => Badge(
              child: ch,
                  value: cart.itemCount.toString(),
                  ),
                  child: IconButton(
                icon: Icon(
                  Icons.shopping_cart), 
                  onPressed: ()
                  {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  }
                  ), 
                  ), 
            
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : 
      ProductGrid(_showFavonly),
    );
  }
}

/*class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        ),
      itemBuilder: (ctx, i) => ProductItem(
        loadedProducts[i].id, 
        loadedProducts[i].title, 
        loadedProducts[i].imageUrl
        ),
      );
  }
}*/