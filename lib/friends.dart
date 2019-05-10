import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'chat.dart';

List<String> friendsData = [];

class Friends extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FriendsState();
  }

}

class _FriendsState extends State<Friends> {
  TextEditingController newFriend;

  _FriendsState() : newFriend = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friends")),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Chat(receiver: friend))
                    );
                  },
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
                      onPressed: () {
                        setState(() {
                          print(newFriend.text);
                          if (newFriend.text != "") {
                            friendsData.add(newFriend.text);
                            newFriend.clear();
                          }
                        });
                      }
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