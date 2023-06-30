import 'package:doctor/home/appointment_screen.dart';
import 'package:doctor/home/chats_screen.dart';
import 'package:doctor/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/images.dart';
import '../widgets/home_navigator_screen_widgets.dart';
import 'homescreen.dart';

class HomeNavigatorScreen extends StatefulWidget {
  /// The parameter variable argument holds screen index number to show that tab
  /// screen initially.
  final Object? screenTabIndex;
  const HomeNavigatorScreen({Key? key, this.screenTabIndex}) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  /// Current page index
  int _currentPageIndex = 0;

  /// Tabbed screen widget of selected tab
  Widget _nestedScreenWidget = const Scaffold();

  /* <-------- Select current page index initially --------> */
  void _setCurrentPageIndex(Object? argument) {
    if (argument != null) {
      if (argument is int) {
        _currentPageIndex = argument;
      }
    }
  }

  /* <-------- Select current tab screen --------> */
  void _setCurrentTab() {
    const int homeScreenIndex = 0;
    const int chatScreenIndex = 1;
    const int appointmentScreenIndex = 2;
    switch (_currentPageIndex) {
      case homeScreenIndex:
        _nestedScreenWidget = const HomeScreen();
        break;
      case chatScreenIndex:
        _nestedScreenWidget = const ChatScreen();
        break;
      case appointmentScreenIndex:
        _nestedScreenWidget = const AppointmentScreen();
        break;
      default:
        // Invalid page index set tab to dashboard screen
        _nestedScreenWidget = const HomeScreen();
    }
  }

  /* <-------- Initial state --------> */
  @override
  void initState() {
    _setCurrentPageIndex(widget.screenTabIndex);
    _setCurrentTab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _nestedScreenWidget,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: CustomBottomNavigationBar(
          selectedIndex: _currentPageIndex,
          curve: Curves.easeOutBack,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: AppColors.primaryColor,
          itemCornerRadius: 10,
          showElevation: false,
          onItemSelected: (selectedPageIndex) => setState(() {
            // Set current index and tab screen
            _currentPageIndex = selectedPageIndex;
            _setCurrentTab();
          }),
          items: [
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.homeSVGLogoLine,
              labelText: 'Home',
              width: 100,
              inactiveColor: Colors.white,
            ),
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.messageSVGLogoSolid,
              labelText: 'Chat',
              width: 90,
              inactiveColor: Colors.white,
            ),
            CustomBottomNavigationBarItem(
              svgAssetIconName: AppAssetImages.appointmentsSVGLogoSolid,
              labelText: 'Appointment',
              width: 150,
              inactiveColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
