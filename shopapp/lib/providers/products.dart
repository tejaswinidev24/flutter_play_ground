import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/httpException.dart';
import '../providers/product.dart';


class Products with ChangeNotifier{

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);


  List<Product> _items = [
    /*Product(
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
    ),*/
  ];

  //var _showFavoritesonly = false;


  List<Product> get items
  {
    /*if(_showFavoritesonly)
    {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }*/
    return [..._items];
  }

  List<Product> get favoriteItems
  {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  /*void showFavoritesonly()
  {
    _showFavoritesonly= true;
  }

  void showAll()
  {
     _showFavoritesonly= false;
  }*/

  Product findById(String id)
  {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchandSetProduct ([bool filterByUser = false]) async
{
  var filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
  var url = 'https://flutterupdate-81649.firebaseio.com/products.json?auth=$authToken&$filterString';
  try{
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData == null)
    {
      return;
    }
    url = 'https://flutterupdate-81649.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
    final responseFavorite = await http.get(url);
    final favdata = json.decode(responseFavorite.body);

    final List<Product> loadedproducts = [];
    extractedData.forEach((prodId, prodData) {
      loadedproducts.add(Product(
        id: prodId, 
        title: prodData['title'], 
        description: prodData['description'], 
        price: prodData['price'], 
        imageUrl: prodData['imageUrl'],
        isFavorite: favdata == null ? false : favdata[prodId] ?? false,
        ),  
      );
    });
    _items = loadedproducts;
    notifyListeners();
  }catch(error){
    throw error;
  }
}
  Future<void> addProduct(Product product) async
  {
    try {
    final url = 'https://flutterupdate-81649.firebaseio.com/products.json?auth=$authToken';
    final response =  await http.post(url, body:json.encode({
      'title': product.title,
      'description': product.description,
      'price' : product.price,
      'imageUrl': product.imageUrl,
      'creatorId': userId,
      //'isFavorite':product.isFavorite,
    }),
    );
    //)//.then((response){
      //print(json.decode(response.body));
      final newProduct = Product(
      id: json.decode(response.body)['name'], 
      title: product.title, 
      description: product.description, 
      price: product.price, 
      imageUrl: product.imageUrl);
      _items.add(newProduct);
    notifyListeners();
    }catch (error){
      print(error);
      throw error;
    }
    
    /*.catchError((error){
      print(error);
      throw error;
    });*/
  }

  void updateProduct(String id,Product newProduct) async
  {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    final url = 'https://flutterupdate-81649.firebaseio.com/products/$id.json?auth=$authToken';
     await http.patch(url, body: json.encode({
      'title': newProduct.title,
      'description': newProduct.description,
      'price': newProduct.price,
      'imageUrl': newProduct.imageUrl
    }));
    if(prodIndex >= 0)
    {
      _items[prodIndex] = newProduct;
      notifyListeners();
    }else{
      print('...');
    }
    
  }
  Future<void> deleteProduct(String id) async
  {
    final url = 'https://flutterupdate-81649.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id );
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
        if(response.statusCode >= 450)
        {
          _items.insert(existingProductIndex, existingProduct);
           notifyListeners();
          throw HttpException('Could not delete product.');
        }
        existingProduct = null;
      
      //_items.insert(existingProductIndex, existingProduct);
    
    //_items.removeWhere((prod) => prod.id == id );
    //notifyListeners();
  }

}