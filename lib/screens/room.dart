import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger/domain/ChatMessage.dart';
import '../Widgets/appBar.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Охайо", messageType: "receiver", sender: "Anonimus1"),
    ChatMessage(messageContent: "Я те дам охайо!",messageType: "receiver", sender: "Anonimus2"),
    ChatMessage(messageContent: "bruh",   messageType: "sender",),
    ChatMessage(messageContent: "bruh? в смысле bruh? Что это вообще значит? Ты адекватный? Может быть ты головой в детсве ударился? Жесть вообще как так можно.", messageType: "receiver", sender: "Anonimus1"),
    ChatMessage(messageContent: "bruh",messageType: "sender",),
    ChatMessage(messageContent: "Охайо", messageType: "receiver", sender: "Anonimus1"),
  ];

  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Widget _input(String hint, TextEditingController controller){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 80,
          width: double.infinity,
          color: Colors.grey[300],
          child: Row(
            children: <Widget>[
              SizedBox(width: 5,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "...",
                    hintStyle: TextStyle(color: Colors.black54),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 3)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54, width: 1)
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5,),
              FloatingActionButton(
                onPressed: (){},
                child: Icon(Icons.send,color: Theme.of(context).primaryColor,size: 26),
                backgroundColor: Colors.black,
                elevation: 0,
              ),
            ],

          ),
        ),
      );
    }

    Widget _chat(){
      return ListView.builder(
        itemCount: messages.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10,bottom: 10),
       // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.only(top: 0),
            child:Container(
            padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
            child: Align(
              alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (messages[index].messageType  == "receiver"?Colors.grey[300]:Theme.of(context).primaryColor),
                ),
                padding: EdgeInsets.all(14),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:EdgeInsets.only(bottom: 5),
                      child: Text(messages[index].messageType  == "receiver"?messages[index].sender:"Me", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    ),
                    Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ]
                ),
              ),
            ),
          ),
          );
        },
      );
    }


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey,
      appBar: roomAppBar("Room name", context),
      body: Stack(
        children: <Widget>[
          _chat(),
          _input("...",_messageController),
        ],
      ),
    );
  }
}
