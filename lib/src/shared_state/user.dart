import 'package:flutter/widgets.dart';

class User with ChangeNotifier {
  String username;
  DateTime loginAt;

  updateUsername(String username) {
    this.username = username;
    this.notifyListeners();
  }
}