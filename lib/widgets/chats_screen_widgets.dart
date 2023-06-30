
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../models/fake_models/chats_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import 'core.dart';

class SingleChatWidget extends StatelessWidget {
  final FakeChatModel chat;
  final int index;
  final void Function()? onDelete;
  const SingleChatWidget({
    Key? key,
    required this.chat,
    required this.index,
    this.onDelete,
  }) : super(key: key);

  TextStyle? _getTextStyle(FakeChatTextModel chatText) {
    if (chatText.isBoldText) {
      return const TextStyle(fontWeight: FontWeight.w600);
    } else if (chatText.isHashText) {
      return const TextStyle(
          color: AppColors.primaryColor, fontWeight: FontWeight.w600);
    } else if (chatText.isColoredText) {
      return const TextStyle(color: AppColors.primaryColor);
    } else {
      return null;
    }
  }

  Widget _getChatContentWidget(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppGaps.screenPaddingValue),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                image: DecorationImage(
                    image: chat.image, fit: BoxFit.cover)),
          ),
          AppGaps.wGap16,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          height: 1.5),
                      children: chat.texts
                          .map((chatText) => TextSpan(
                              text: chatText.text,
                              style: _getTextStyle(chatText)))
                          .toList()),
                ),
                AppGaps.hGap8,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(chat.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w500)),
                    Text(chat.timeText,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.bodyTextColor)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const ScrollMotion(),
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppGaps.wGap16,
                Material(
                  color: AppColors.alertColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: onDelete,
                    child: Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssetImages.deleteSVGLogoLine,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            )
          ]),
      child: chat.isRead
          ? CustomRawListTileWidget(
              onTap: () {},
              child: _getChatContentWidget(context),
            )
          : CustomListTileWidget(
              onTap: () {},
              paddingValue: const EdgeInsets.symmetric(
                  vertical: AppGaps.screenPaddingValue),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: _getChatContentWidget(context)),
    );
  }
}
