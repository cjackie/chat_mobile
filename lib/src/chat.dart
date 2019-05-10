import 'package:chat_mobile/src/shared_state/chat.dart';
import 'package:chat_mobile/src/shared_state/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  static const chatRouteName = "/chat";
  String receiver;

  @override
  State<StatefulWidget> createState() {
    return _ChatState();
  }
}

class _ChatState extends State<Chat> {
  TextEditingController messageInputController ;

  _ChatState() {

    messageInputController = TextEditingController(text: "");
  }

  _sendChate(ChatData chatData, String receiver, String sender) {
    if (messageInputController.text != "") {
      ChatMessage message = ChatMessage(sender: sender, receiver: receiver, message: messageInputController.text);
      message.sendingTime = DateTime.now();
      this.messageInputController.clear();
      chatData.sendChat(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    String receiver = args["receiver"];

    User user = Provider.of<User>(context);
    ChatData chatData = Provider.of<ChatData>(context);
    List<ChatMessage> messages = [];
    if (chatData.chatByReceiver.containsKey(receiver)) {
      messages = chatData.chatByReceiver[receiver];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(receiver),
      ),

      body: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: ListView(
              children: messages.map((ChatMessage message) {
                return ListTile(
                  title: Text(message.sender + " said: "),
                  subtitle: Text(message.message),
                );
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
                    onPressed: () => this._sendChate(chatData, receiver, user.username),
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
