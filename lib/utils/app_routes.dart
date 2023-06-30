import 'package:doctor/Chats/conversation_screen.dart';
import 'package:doctor/Chats/video_call.dart';
import 'package:doctor/appointment/searchappointments_screen.dart';
import 'package:doctor/home/appointment_screen.dart';
import 'package:doctor/home/chats_screen.dart';
import 'package:doctor/home/homescreen.dart';
import 'package:doctor/home/profile_screen.dart';
import 'package:doctor/screens/change_password_screen.dart';
import 'package:doctor/screens/login_screen.dart';
import 'package:doctor/screens/my_wallet_screen.dart';
import 'package:doctor/screens/settings_screen.dart';
import 'package:doctor/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

import '../appointment/shedule_appointments_screen.dart';
import '../appointment/viewappointments_screen.dart';
import '../home/home_navigator_screen.dart';
import '../screens/insight_screen.dart';
import '../screens/splash_screen.dart';
import 'app_page_names.dart';

class AppRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final Object? argument = settings.arguments;
    switch (settings.name) {
      case AppPageNames.rootScreen:
      case AppPageNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppPageNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppPageNames.chatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case AppPageNames.appointmentScreen:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case AppPageNames.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppPageNames.conversationScreen:
        return MaterialPageRoute(builder: (_) => ConversationsScreen());
      case AppPageNames.sheduleAppointmentScreen:
        return MaterialPageRoute(
            builder: (_) => const SheduleAppointmentScreen());
      case AppPageNames.searchappointmentDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const SearchAppointmentScreen());
      case AppPageNames.viewappointmentDetailsScreen:
        return MaterialPageRoute(builder: (_) => ViewAppointmentScreen());
      case AppPageNames.insightScreen:
        return MaterialPageRoute(builder: (_) => const InsightScreen());
      case AppPageNames.myWalletScreen:
        return MaterialPageRoute(builder: (_) => const MyWalletScreen());
      case AppPageNames.settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppPageNames.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      case AppPageNames.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case AppPageNames.meetingRoom:
        return MaterialPageRoute(builder: (_) => const Meeting());

      case AppPageNames.homeNavigatorScreen:
        return MaterialPageRoute(
            builder: (_) => HomeNavigatorScreen(screenTabIndex: argument));
      case AppPageNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const Login());
      default:
        // Open this page if wrong route address used
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Page not found')))));
    }
  }
}
