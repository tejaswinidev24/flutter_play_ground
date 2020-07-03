import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/splash_screen.dart';
import './providers/auth.dart';
import './screen/cartscreen.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './screen/orderscreen.dart';
import './screen/editproductscreen.dart';
import './screen/productoverviewscreen.dart';
import './screen/productdetailscreen.dart';
import './screen/userproductscreen.dart';
import './screen/auth_screen.dart';
import './providers/products.dart';

void main() {
  runApp(
    MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiProvider(providers: [
          ChangeNotifierProvider.value(value: Auth()),
          /*ChangeNotifierProvider(
        create: (ctx) => Auth(),
        ),*/
        ChangeNotifierProxyProvider<Auth, Products>(
          //create: null,
          update: (ctx, auth, prevproducts) => Products(
          auth.token,
          auth.userId,
          prevproducts == null ? [] : prevproducts.items), 
          ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
      ),
      ChangeNotifierProxyProvider<Auth, Orders>(
        update: (ctx, auth , previousOrders) => Orders(
        auth.token,
        auth.userId, 
        previousOrders == null ? [] : previousOrders.orders),
        ),
        ],
        
          child: Consumer<Auth>(builder: (ctx, auth, _) => 
          MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: auth.isAuth ? 
        ProductScreen() : 
        FutureBuilder(
          future: auth.autologin(),
          builder: (ctx, authResultsnapshot) => 
          authResultsnapshot.connectionState == ConnectionState.waiting ?
          SplashScreen()
          : AuthScreen()),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Shopping'),
      ),
      body: Center(
        
        child: Text('Product Screen')
      ),
      
     
    );
  }
}*/
