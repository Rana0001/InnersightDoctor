import 'package:doctor/utils/app_routes.dart';
import 'package:doctor/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'utils/app_page_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCoZ4Akinjt2M6sw_-KKlWiP0KYuKFbn10",
          appId: "1:92054237811:android:3b2fddf40626f73c99b006",
          messagingSenderId: "XXX",
          projectId: "innersight-6b3dd"));
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Ji',
      onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      debugShowCheckedModeBanner: false,
      // home: TempScreen(),
      theme: AppThemeData.appThemeData,
    );
  }
}
