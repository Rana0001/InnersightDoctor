import 'package:doctor/component/message.dart';
import 'package:doctor/services/services.dart';
import 'package:doctor/utils/app_page_names.dart';
import 'package:flutter/material.dart';

import '../utils/app_gaps.dart';
import '../widgets/core.dart';
import '../widgets/settings_screen_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// Toggle value of popup notification
  final bool _togglePopupNotification = true;

  /// Toggle value of text notification
  final bool _toggleTextNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Settings')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              Text('Profile',
                  style: Theme.of(context).textTheme.headlineMedium),
              AppGaps.hGap16,
              /* <---- 'Country' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Update Profile',
                  valueWidget: const SettingsValueTextWidget(text: 'Tab'),
                  onTap: () {
                    Navigator.pushNamed(context, '/updateProfile');
                  }),
              AppGaps.hGap16,
              /* <---- 'Currency' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Documents',
                  valueWidget: const SettingsValueTextWidget(text: 'Tab'),
                  onTap: () {}),
              AppGaps.hGap16,

              Text('Security',
                  style: Theme.of(context).textTheme.headlineMedium),

              AppGaps.hGap16,
              /* <---- 'Terms & conditions' List Tile ----> */
              SettingsListTileWidget(
                  titleText: 'Delete Account',
                  onTap: () async {
                    bool result = await Services().deleteAccount();
                    if (result) {
                      setState(() {
                        Navigator.pushNamed(context, AppPageNames.loginScreen);
                        Messages.successMessage(
                            "Account Deletion Successful", context);
                      });
                    } else {
                      setState(() {
                        Messages.errorMessage(
                            "Account Deletion Failed", context);
                      });
                    }
                  }),
              // Bottom extra spaces
              AppGaps.hGap30,
            ],
          ),
        ),
      ),
    );
  }
}
