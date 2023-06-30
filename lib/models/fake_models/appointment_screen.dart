import 'package:flutter/material.dart';

class AppointmentSections {
  String title;
  int itemNumber;
  ImageProvider<Object> categoryImage;
  AppointmentSections({
    required this.title,
    required this.itemNumber,
    required this.categoryImage,
  });
}
