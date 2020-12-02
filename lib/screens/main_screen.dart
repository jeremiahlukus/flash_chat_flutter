import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/card_component.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static String id = '/main';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).popUntil((route) => route.isFirst);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CardComponent(
                    title: "Chat",
                    color: Colors.green[300],
                    screenId: ChatScreen.id,
                    imagePath: "images/chat.png",
                    scale: 3.6,
                  ),
                  CardComponent(
                    title: "Groups",
                    color: Colors.red[400],
                    screenId: ChatScreen.id,
                    imagePath: "images/group.png",
                    scale: 3.3,
                  )
                ],
              ),
              Row(
                children: [
                  CardComponent(
                    title: "Inbox",
                    color: Colors.blue[200],
                    screenId: ChatScreen.id,
                    imagePath: "images/inbox.png",
                    scale: 3.6,
                  ),
                  CardComponent(
                    title: "ParkStone",
                    color: Colors.blueAccent,
                    screenId: ChatScreen.id,
                    imagePath: "images/home.png",
                    scale: 3.6,
                  )
                ],
              ),
              Row(
                children: [
                  CardComponent(
                    title: "Services",
                    color: Colors.orange[300],
                    screenId: ChatScreen.id,
                    imagePath: "images/builder.png",
                    scale: 3.6,
                  ),
                  CardComponent(
                    title: "For Sale",
                    color: Colors.pink[300],
                    screenId: ChatScreen.id,
                    imagePath: "images/for-sale.png",
                    scale: 3.6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
