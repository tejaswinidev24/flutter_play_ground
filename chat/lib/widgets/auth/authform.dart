import 'dart:io';

import 'package:chat/widgets/pickers/userimagepicker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function({String email,  String username,  String password, File image, bool isLogin,  BuildContext ctx})submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userName = '';
  var _useremail = '';
  var _userpassword = '';
  File _userImage;

  void _pickedImage(File image)
  {
    _userImage = image;

  }

  void _trySubmit()
  {
    final isvalid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if(_userImage == null && !_isLogin)
    {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image'),
        backgroundColor: Theme.of(context).errorColor,
      )
      );
      return;
    }

    if(isvalid)
    {
      _formKey.currentState.save();
      widget.submitFn(email:_useremail, username: _userName, password: _userpassword, image: _userImage, isLogin: _isLogin, ctx: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if(!_isLogin) UserImagePicker(_pickedImage),
                    TextFormField(
                      key: ValueKey('useremail'),
                      validator: (value) {
                        if(value.isEmpty || !value.contains('@'))
                        {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email Address'),
                      onSaved: (value) {
                        _useremail = value;
                      },
                    ),
                    if(!_isLogin)
                    TextFormField(
                      key: ValueKey('userName'),
                      validator: (value) {
                        if(value.isEmpty || value.length < 4)
                        {
                          return 'Please enter valid Username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                    TextFormField(
                      key: ValueKey('userpassword'),
                      validator: (value) {
                        if(value.isEmpty || value.length < 4)
                        {
                          return 'Password must be atleast 4 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      onSaved: (value) {
                        _userpassword = value;
                      },
                    ),
                    
                    SizedBox(height: 10,),
                    if(widget.isLoading)
                    CircularProgressIndicator(),
                    if(!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'SignUp'),
                      onPressed:() {
                        _trySubmit();
                      }
                    ),
                    if(!widget.isLoading)
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      }, 
                      child: Text(_isLogin ? 'Create new account' : 'I already have an account'),
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
      );
  }
}