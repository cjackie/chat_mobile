import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Chat extends StatefulWidget {
  final String receiver;
  Chat({@required this.receiver});

  @override
  State<StatefulWidget> createState() {
    return _ChatState(chat: this);
  }
}

class ChatMessage {
  String sender;
  String receiver;
  String message;
  DateTime sendingTime;

  ChatMessage({@required this.sender, @required this.receiver,
    @required this.message, this.sendingTime});
}

class _ChatState extends State<Chat> {
  final Chat chat;
  List<ChatMessage> messages;
  TextEditingController messageInputController ;

  _ChatState({
    @required this.chat
  }) {
    messageInputController = TextEditingController(text: "");
    messages = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.chat.receiver),
      ),

      body: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: ListView(
              children: this.messages.map((ChatMessage message) {
                return ListTile(
                  title: Text(message.sender + " said: "),
                  subtitle: Text(message.message),
                );
//                return Text(message);
              }).toList(),
            ),
          ),

          Flexible(
            flex: 1,
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: TextField(
                          controller: messageInputController
                      )
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("Send"),
                    onPressed: () {
                      setState(() {
                        if (messageInputController.text != "") {
                          ChatMessage message = ChatMessage(sender: "todo", receiver: this.chat.receiver, message: messageInputController.text);
                          message.sendingTime = DateTime.now();
                          this.messages.add(message);
                          this.messageInputController.clear();
                        }
                      });
                    }
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
