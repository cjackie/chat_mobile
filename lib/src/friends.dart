import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:chat_mobile/src/chat.dart';
import 'package:chat_mobile/src/shared_state/user.dart';

List<String> friendsData = [];

class Friends extends StatefulWidget {
  static const friendsRouteName = "/friends";

  @override
  State<StatefulWidget> createState() {
    return _FriendsState();
  }
}

class _FriendsState extends State<Friends> {
  TextEditingController newFriend;

  _FriendsState() : newFriend = TextEditingController(text: "");

  _openChat(String friend) {
    print(friend);
    Navigator.pushNamed(context, Chat.chatRouteName, arguments: {"receiver": friend});
  }
  
  _addNewFriend() {
    setState(() {
      print(newFriend.text);
      if (newFriend.text != "") {
        friendsData.add(newFriend.text);
        newFriend.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends of ${user.username}"),
        leading: Text(""),
      ),
      body: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: ListView(
              children: friendsData.map((String friend) {
                return ListTile(
                  title: Text(friend),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => this._openChat(friend)
                );
              }).toList(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: <Widget>[
                Flexible(
                    flex: 3,
                    child: TextField(controller: newFriend)
                ),
                Flexible(
                    flex: 1,
                    child: RaisedButton(
                      child: Text("Add New Friend"),
                      onPressed: () => this._addNewFriend()
                    )
                ),
              ]
            )
          ),
        ]
      )
    );
  }

}