import '../widgets/auth/chat/newmessages.dart';

import '../widgets/auth/chat/chatmessages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg)
    {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Chat'),
            actions: <Widget>[
              DropdownButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryIconTheme.color,
                  ),
                items: [
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.exit_to_app),
                          SizedBox(
                            width: 10
                          ),
                          Text('Logout'),
                        ],
                      ),
                    ),
                    value: 'logout', 
                  )
                ], 
                onChanged: (itemIdentifier) {
                  if(itemIdentifier == 'logout')
                  {
                    FirebaseAuth.instance.signOut();
                  }
                }
              )
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(child: Messages()),
                NewMessages()
              ],
            ),
          ),
          /*StreamBuilder(
            stream: Firestore.instance.collection('chats/zEgEU8Zog4rKyzp6Q3aZ/messages')
          .snapshots(),
            builder: (ctx, streamsnapshot) { 
              if(streamsnapshot.connectionState == ConnectionState.waiting)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final documents = streamsnapshot.data.documents;
              return ListView.builder(
        itemCount: documents.length,
        itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(10),
            child: Text(documents[index]['text']),
        ), 
      );
    },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {}
      
      ),*/
    );
  }
}