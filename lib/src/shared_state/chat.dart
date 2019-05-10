import 'package:flutter/widgets.dart';

class ChatMessage {
  String sender;
  String receiver;
  String message;
  DateTime sendingTime;

  ChatMessage({@required this.sender, @required this.receiver,
    @required this.message, this.sendingTime});
}

class ChatData with ChangeNotifier {
  Map<String, List<ChatMessage>> chatByReceiver = Map();

  sendChat(ChatMessage message) {
      chatByReceiver.putIfAbsent(message.receiver, () => List<ChatMessage>());
      message.sendingTime = DateTime.now();
      chatByReceiver[message.receiver].add(message);
      notifyListeners();
  }
}