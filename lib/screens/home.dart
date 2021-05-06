import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/Widgets/appBar.dart';
import 'package:messenger/screens/createRoom.dart';
import 'package:messenger/screens/room.dart';
import 'package:messenger/screens/roomSearch.dart';
import '../domain/ChatRoom.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: appBar('Home', context),
        body: RoomsList(),
      );
  }

}

class RoomsList extends StatelessWidget {
  final rooms = <ChatRoom>[
    ChatRoom(title:'chat 1',avatar: Icons.camera ,description:'ыыыааыы'),
    ChatRoom(title:'chat 2',avatar: Icons.camera ,description:'ыыыааыы'),
    ChatRoom(title:'chat 3',avatar: Icons.camera ,description:'ыыыааыы'),
    ChatRoom(title:'chat 4',avatar: Icons.accessibility_new_rounded ,description:'ооооееемм')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 8),
        child:Container(
            child: GridView.builder(
                itemCount: rooms.length+2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 10.0 / 10.0,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, i) {
                  if (i==rooms.length){
                    return GestureDetector(
                    child: Icon(
                      Icons.add_comment_outlined,
                      size: 100,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewRoomPage()));
                    },
                      );
                  }
                  if (i==rooms.length+1){
                    return GestureDetector(
                      child: Icon(
                        Icons.search,
                        size: 100,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RoomSearchPage()));
                      },
                    );
                  }

                  return GestureDetector(
                  child: Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      elevation: 8.0,
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.grey[300]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage('./lib/assets/no-image.png'),
                                          fit: BoxFit.contain),
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(rooms[i].title, style: TextStyle(color: Theme.of(context).textTheme.title.color, fontWeight: FontWeight.bold, fontSize: 24.0,)),

                              ),
                            ],

                          )
                      )
                  ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    },);

                }

            )
        )
    );
  }

}