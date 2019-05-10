import 'package:flutter/material.dart';

import 'friends.dart';


class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }

}

class _LoginState extends State<Login> {

  String username;
  String password;

  login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Friends(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Username: ${this.username}"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (username) {
                  this.setState(() {
                    this.username = username;
                  });
                },
              ),
            ),
            Text("Password: "),
            TextField(
              onChanged: (password) {
                this.password = password;
              },
              obscureText: true,
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