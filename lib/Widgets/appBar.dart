import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/screens/home.dart';
import 'package:messenger/screens/profile.dart';
import 'package:messenger/screens/roomProfile.dart';


Widget appBar(String name, BuildContext context){
  return AppBar(
    actionsIconTheme: IconThemeData(
        size: 40.0,
        color: Colors.black,
        opacity: 10.0
    ),
    title: Text(name,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
    leading: GestureDetector(
      onTap: () {
        if (Navigator.canPop(context))
            Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => HomePage()));
      },
      child: Icon(
        Icons.arrow_back,  // add custom icons also
      ),
    ),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.home,  // add custom icons also
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Icon(
          Icons.account_box,  // add custom icons also
        ),
      ),
    ],
    //  leading: Icon(Icons.messenger),

  );
}

Widget roomAppBar(String name, BuildContext context){
  return AppBar(
    actionsIconTheme: IconThemeData(
        size: 40.0,
        color: Colors.black,
        opacity: 10.0
    ),
    title: Text(name,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: Icon(
        Icons.arrow_back,  // add custom icons also
      ),
    ),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(
          Icons.home,  // add custom icons also
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoomProfilePage()));
        },
        child: Icon(
          Icons.info,  // add custom icons also
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Icon(
          Icons.account_box,  // add custom icons also
        ),
      ),
    ],
    //  leading: Icon(Icons.messenger),

  );
}