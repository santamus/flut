import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/screens/roomProfile.dart';
import 'package:messenger/screens/roomSearch.dart';
import 'domain/ChatRoom.dart';
import 'screens/auth.dart';
import 'screens/room.dart';
import 'screens/profile.dart';
import 'screens/createRoom.dart';

void main() => runApp(MessengerApp());

class MessengerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'RP MESSENGER',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        textTheme: TextTheme(title: TextStyle(color: Colors.black))
      ),
      home: AuthorizationPage(),
    );
  }
}

