import 'package:doctor/Chats/conversation_screen.dart';
import 'package:doctor/models/patient.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../widgets/core.dart';
import '../widgets/my_chat_screen_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  /// Currently selected tab index
  int _selectedTabIndex = 0;

  /// Tab titles
  final List<String> _tabNames = ['All Messages'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context,
          hasBackButton: false,
          titleWidget: const Text('Chats')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top extra spaces
            AppGaps.hGap10,
            /* <---- Order status tabs ----> */
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _tabNames.map((tabName) {
                    final index = _tabNames.indexOf(tabName);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextButton(
                          onPressed: () =>
                              setState(() => _selectedTabIndex = index),
                          style: TextButton.styleFrom(
                              foregroundColor: _selectedTabIndex == index
                                  ? Colors.white
                                  : AppColors.darkColor,
                              elevation: 10,
                              shadowColor: _selectedTabIndex == index
                                  ? AppColors.primaryColor.withOpacity(0.25)
                                  : Colors.black.withOpacity(0.05),
                              backgroundColor: _selectedTabIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal:
                                      _selectedTabIndex == index ? 24 : 20),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)))),
                          child: Text(
                            tabName,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          )),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppGaps.hGap8,
            /* <---- Order list ----> */
            Expanded(
                child: FutureBuilder(
                    initialData: const [],
                    future: Services().getAllPatient(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          padding: const EdgeInsets.only(top: 16, bottom: 30),
                          separatorBuilder: (context, index) => AppGaps.hGap16,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            /// Single order
                            Patient patient = snapshot.data![index];

                            return MyChatWidget(
                              onTap: () {
                                // Tapping on it goes to order status screen
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConversationsScreen(
                                              patient: patient,
                                            )),
                                    (route) => true);
                              },
                              personName: patient.firstName!,
                              personImage: patient.profileUrl!,
                              messageText: "",
                              dateText: "",
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
