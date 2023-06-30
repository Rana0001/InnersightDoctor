import 'package:flutter/material.dart';

class FakeMyChatModel {
  String name;
  String lastMessage;
  ImageProvider<Object> personImage;
  String dateText;
  FakeMyChatModel({
    required this.name,
    required this.lastMessage,
    required this.personImage,
    required this.dateText,
  });
}
