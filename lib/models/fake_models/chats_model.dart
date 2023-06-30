import 'package:flutter/material.dart';

class FakeChatsGroupModel {
  List<FakeChatModel> groupChats;
  FakeChatsGroupModel({
    required this.groupChats,
  });
}

class FakeChatModel {
  String name;
  String timeText;
  bool isRead;
  List<FakeChatTextModel> texts;
  ImageProvider<Object> image;
  FakeChatModel({
    required this.name,
    required this.timeText,
    required this.isRead,
    required this.texts,
    required this.image,
  });
}

class FakeChatTextModel {
  String text;
  bool isHashText;
  bool isColoredText;
  bool isBoldText;
  FakeChatTextModel({
    required this.text,
    this.isHashText = false,
    this.isColoredText = false,
    this.isBoldText = false,
  });
}
