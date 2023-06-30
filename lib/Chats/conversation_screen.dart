import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/app/constant.dart';
import 'package:doctor/component/message.dart';
import 'package:doctor/models/chat_room.dart';
import 'package:doctor/models/patient.dart';
import 'package:doctor/services/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/app_page_names.dart';
import '../utils/images.dart';
import '../widgets/chat_screen_widgets.dart';
import '../widgets/core.dart';

class ConversationsScreen extends StatefulWidget {
  ConversationsScreen({Key? key, this.patient}) : super(key: key);
  Patient? patient;
  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  TextEditingController messageController = TextEditingController();
  sendMessage() async {
    ChatRoom chatRoom = ChatRoom();
    chatRoom.doctorId = Constant.doctor.uid;
    chatRoom.dateTimeText = DateTime.now().toString();
    chatRoom.patientMsg = false;
    chatRoom.messages = messageController.text;
    chatRoom.patientId = widget.patient!.id;
    try {
      await ChatRoomService().sendMessage(chatRoom);
    } catch (err) {
      Messages.errorMessage(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Bottom padding value, which is the parts of the display that are
    /// completely obscured by device's keyboard.
    final bottomInsetPaddingValue = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      extendBody: true,
      /* <-------- Content --------> */
      body: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
        alignment: Alignment.topLeft,
        child: SafeArea(
          bottom: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap24,
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomIconButtonWidget(
                    onTap: () {
                      // Goto call screen
                      Navigator.pushNamed(
                          context, AppPageNames.homeNavigatorScreen);
                    },
                    hasShadow: true,
                    child: SvgPicture.asset(
                      AppAssetImages.arrowLeftSVGLogoLine,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppGaps.wGap30,
                  Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: widget.patient!.profileUrl != ""
                              ? CircleAvatar(
                                  backgroundImage: Image.network(
                                  widget.patient!.profileUrl!,
                                ).image)
                              : CircleAvatar(
                                  backgroundImage:
                                      Image.asset(AppAssetImages.background)
                                          .image),
                        ),
                        Positioned(
                            top: 2,
                            right: 3,
                            child: Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: AppColors.successColor,
                                  shape: BoxShape.circle),
                            ))
                      ],
                    ),
                  ),
                  AppGaps.wGap16,
                  /* <---- Delivery man name and designation column ----> */
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.patient!.firstName != ""
                          ? Text(
                              '${widget.patient!.firstName} ${widget.patient!.lastName}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          : const Text(
                              'Nike',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                  const Spacer(),
                  CustomIconButtonWidget(
                    onTap: () {
                      // Goto call screen
                      Navigator.pushNamed(context, AppPageNames.meetingRoom,
                          arguments: "Voice");
                    },
                    hasShadow: true,
                    child: SvgPicture.asset(
                      AppAssetImages.audiocallSVGLogoSolid,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppGaps.wGap8,
                  CustomIconButtonWidget(
                    onTap: () {
                      // Goto call screen
                      Navigator.pushNamed(context, AppPageNames.meetingRoom,
                          arguments: "Video");
                    },
                    hasShadow: true,
                    child: SvgPicture.asset(
                      AppAssetImages.videocallSVGLogoSolid,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
              AppGaps.hGap15,
              const Center(
                  child: Text('Hold on message to copy message',
                      style: TextStyle(fontSize: 12, color: Colors.grey))),
              /* <---- Chat with deliveryman ----> */
              Expanded(
                  child: StreamBuilder(
                stream: ChatRoomService().getMessage(widget.patient!.id!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot<Object?> dataSnapshot =
                        snapshot.data as QuerySnapshot<Object?>;

                    if (dataSnapshot.docs.isNotEmpty) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(top: 17, bottom: 30),
                        separatorBuilder: (context, index) => AppGaps.hGap24,
                        itemCount: dataSnapshot.docs.length,
                        itemBuilder: (context, index) {
                          ChatRoom chatRoom = ChatRoom.fromJson(
                              dataSnapshot.docs[index].data()
                                  as Map<String, dynamic>);

                          return ChatScreenWidgets.getCustomDeliveryChatWidget(
                              chatMessage: chatRoom);
                        },
                      );
                      // Rest of your code
                    } else {
                      return const Center(
                        child: Text(
                          'No message found',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  // Handle other cases, such as when the stream is still loading
                  return const Center(child: CircularProgressIndicator());
                },
              )),
            ],
          ),
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: Padding(
        padding: AppGaps.bottomNavBarPadding.copyWith(
            bottom:
                AppGaps.minimumBottomPaddingValue + bottomInsetPaddingValue),
        /* <---- Chat message text field ----> */
        child: CustomTextFormField(
          controller: messageController,
          hintText: 'Send message',
          prefixIcon: const SizedBox.shrink(),
          suffixIconConstraints: const BoxConstraints(maxHeight: 48),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButtonWidget(
                backgroundColor: AppColors.primaryColor,
                hasShadow: true,
                child: Transform.scale(
                  scaleX: -1,
                  child: SvgPicture.asset(
                    AppAssetImages.arrowLeftSVGLogoLine,
                    color: Colors.white,
                    height: 16,
                    width: 16,
                  ),
                ),
                onTap: () {
                  sendMessage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
