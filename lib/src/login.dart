import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_mobile/src/shared_state/user.dart';
import 'package:chat_mobile/src/friends.dart';

class Login extends StatefulWidget {
  static const loginRouteName = "/login";

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  TextEditingController _username;
  TextEditingController _password;

  _LoginState() :
      _username = TextEditingController(),
      _password = TextEditingController();

  login() {
    if (_username.text != "") {
      User user = Provider.of<User>(context);
      user.updateUsername(_username.text);
      Navigator.pushNamed(context, Friends.friendsRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Username: "),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _username,
              ),
            ),
            Text("Password: "),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _password,
                obscureText: true,
              ),
            ),
            RaisedButton(
              onPressed: () {
                this.login();
              },
              child: Text("Login")
            )
          ],
        ),
      )
    );
  }

}