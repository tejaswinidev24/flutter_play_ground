import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/editscreen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedProduct = Product(
    id: null, 
    title: '', 
    description: '', 
    price: 0, 
    imageUrl: ''
    );
    var _initValues = {
      'title' : '',
      'description' : '',
      'price':'',
      'imageUrl':'',
    };
    var _isInit = true;
    var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_isInit)
    {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if(productId!=null)
      {
         _editedProduct = Provider.of<Products>(context).findById(productId);
      _initValues = {
        'title':_editedProduct.title,
        'description': _editedProduct.description,
        'price':_editedProduct.price.toString(),
        //'imageUrl': _editedProduct.imageUrl,
        'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl()
  {
    if(!_imageUrlFocusNode.hasFocus)
    if(!_imageUrlController.text.startsWith('http') && !_imageUrlController.text.startsWith('https'))
                     {
                       return;
                     }
    setState(() {
    });
  }
  
  Future<void> _saveForm() async
  {
    final _isValid = _form.currentState.validate();
    if(!_isValid)
    {
      return;
    }
    _form.currentState.save();
    setState(() {
        _isLoading = true;
      });
    if(_editedProduct.id !=null)
    {
     await Provider.of<Products>(context, listen: false).updateProduct(_editedProduct.id, _editedProduct);
     /* setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();*/

    }else{  
      try{
        await Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
      }catch(error)
      {
      await showDialog(context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Occured'),
        content: Text('Something went wrong.'),
        actions: <Widget>[
          FlatButton(onPressed: () {
            Navigator.of(ctx).pop();
          }, 
          child: Text('Okay'))
        ],
      )
      );
      }
      /*finally{
        setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
      }*/
    }
     setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
  }
      //await Provider.of<Products>(context, listen: false).addProduct(_editedProduct).
      /*catchError((error){
      return showDialog(context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error Occured'),
        content: Text('Something went wrong.'),
        actions: <Widget>[
          FlatButton(onPressed: () {
            Navigator.of(ctx).pop();
          }, 
          child: Text('Okay'))
        ],
      )
      );
    })*/
   /*.then((_) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    });
    }*/
    //Navigator.of(context).pop();
    /*print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
    print(_editedProduct.price);*/
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: _saveForm,
            ),
        ],
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator()
        )
      : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Please provide a value';
                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite, 
                    title: value, 
                    description: _editedProduct.description, 
                    price: _editedProduct.price, 
                    imageUrl: _editedProduct.imageUrl
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Please enter the price';
                  }
                  if(double.tryParse(value)== null)
                  {
                    return 'Please enter valid number.';
                  }
                  if(double.parse(value) <= 0)
                  {
                    return 'Please enter a number greater than zero';
                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite, 
                    title: _editedProduct.title, 
                    description: _editedProduct.description, 
                    price: double.parse(value), 
                    imageUrl: _editedProduct.imageUrl);
                }
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'Please enter the description';
                  }
                  if(value.length < 10)
                  {
                    return 'Should be atleast 10 characters long';
                  }
                  return null;
                },
                onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,  
                    title: _editedProduct.title, 
                    description: value, 
                    price: _editedProduct.price, 
                    imageUrl: _editedProduct.imageUrl
                  );
                },
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 8, right:10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: _imageUrlController.text.isEmpty ? Text('Enter URL') :
                  FittedBox(
                    child: Image.network(_imageUrlController.text,
                    fit: BoxFit.cover,
                    )
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    //initialValue: _initValues['imageUrl'],
                    decoration: InputDecoration(labelText: 'Image URL'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _imageUrlFocusNode,
                    onFieldSubmitted: (_){
                      _saveForm();
                    },
                    validator: (value){
                      if(value.isEmpty)
                      {
                        return 'Please enter the Url.';
                      }
                      if(!value.startsWith('http') && (!value.startsWith('https')))
                      {
                        return 'Please enter valid URL.';
                      }
                      return null;
                    },
                    onSaved: (value){
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite, 
                    title: _editedProduct.title, 
                    description: _editedProduct.description, 
                    price: _editedProduct.price, 
                    imageUrl: value,
                  );
                },
                  ),
                ),
              ],)
            ],
          ) ),
      ),
    );
  }
}
