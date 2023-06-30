import 'package:doctor/models/appointment.dart';
import 'package:flutter/material.dart';

import '../models/doctors.dart';

class Constant {
  static Doctor doctor = Doctor();
  static double height = 0;
  static double width = 0;

  static int total = 0;
  static int appointmentTotal = 1;
  static int totalDoc = 0;
  static int totalPatients = 0;

  static Map<String, bool> sortMap(Map<String, bool> map) {
    List<MapEntry<String, bool>> entries = map.entries.toList();

    entries.sort((a, b) => a.key.compareTo(b.key));

    return Map.fromEntries(entries);
  }

  dimension(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  static Appointment appointment = Appointment();
}
