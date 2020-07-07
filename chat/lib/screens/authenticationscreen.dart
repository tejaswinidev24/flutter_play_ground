
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import '../widgets/auth/authform.dart';
import 'package:flutter/material.dart';


class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm({String email,  String username, String password, File image, bool isLogin, BuildContext ctx}) async
  {
    AuthResult authResult;

    try{
    if(isLogin) {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.signInWithEmailAndPassword(email: email.toString().trim(), password: password);
    }else {
      authResult = await _auth.createUserWithEmailAndPassword(email: email.toString().trim(), password: password);
     
      final ref = FirebaseStorage.instance.ref().child('user_image').child(authResult.user.uid + '.jpg');
      
      await ref.putFile(image).onComplete;
      final url = await ref.getDownloadURL();

      await Firestore.instance.collection('users').document(authResult.user.uid).setData({
        'username':username,
        'useremail':email,
        'password':password,
        'image_url': url,
      });
    }
    } on PlatformException catch(error){
      var message = 'Please enter valid credentials';

      if(error.message!=null)
      {
        message = error.message;
      }
  

      Scaffold.of(ctx).showSnackBar(
        SnackBar(content: 
        Text(message), 
        backgroundColor: Theme.of(ctx).errorColor,)
        );
        setState(() {
          
          _isLoading=false;
        });
    }catch (error){
      print(error);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}