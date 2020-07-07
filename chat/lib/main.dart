import './screens/splashscreen.dart';

import './screens/authenticationscreen.dart';
import 'package:flutter/material.dart';
import './screens/chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData( 
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.purple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnaphot) {
          if(userSnaphot.connectionState == ConnectionState.waiting)
          {
            return SplashScreen();
          }
          if(userSnaphot.hasData)
          {
            return ChatScreen();
          }
            return AuthScreen();
        }
        
      ),
    );
  }
}

