import 'package:chat_mobile/src/chat.dart';
import 'package:chat_mobile/src/friends.dart';
import 'package:chat_mobile/src/login.dart';
import 'package:chat_mobile/src/shared_state/chat.dart';
import 'package:chat_mobile/src/shared_state/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => User()),
        ChangeNotifierProvider(builder: (context) => ChatData())
      ],
      child:  MaterialApp(
        key: GlobalKey(),
        title: 'Chat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => Login(),
          Login.loginRouteName: (context) => Login(),
          Friends.friendsRouteName: (context) => Friends(),
          Chat.chatRouteName: (context) => Chat()
        },

      ),
    );

  }

  @override
  void initState() {
    super.initState();
  }
}