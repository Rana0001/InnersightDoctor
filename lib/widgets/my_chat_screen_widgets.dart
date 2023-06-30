import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import 'core.dart';

/// Order status box widget
class OrderStatusWidget extends StatelessWidget {
  final String orderStatus;
  const OrderStatusWidget({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String statusText;
    final Color statusBackgroundColor;
    switch (orderStatus.toLowerCase()) {
      case 'pending':
        statusText = 'Pending';
        statusBackgroundColor = AppColors.secondaryColor;
        break;
      case 'processing':
        statusText = 'Processing';
        statusBackgroundColor = AppColors.tertiaryColor;
        break;
      case 'delivered':
        statusText = 'Delivered';
        statusBackgroundColor = AppColors.successColor;
        break;
      case 'cancelled':
        statusText = 'Cancelled';
        statusBackgroundColor = AppColors.alertColor;
        break;
      default:
        statusText = 'Pending';
        statusBackgroundColor = AppColors.secondaryColor;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: statusBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Text(
        statusText,
        style: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// Product list tile for my order tab page from home screen.
class MyChatWidget extends StatelessWidget {
  final void Function()? onTap;
  final String personImage;
  final String personName;
  final String messageText;
  final String dateText;
  const MyChatWidget({
    Key? key,
    this.onTap,
    required this.personImage,
    required this.personName,
    required this.messageText,
    required this.dateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTileWidget(
        paddingValue: const EdgeInsets.all(16),
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(64)),
                  image:
                      DecorationImage(image: Image.network(personImage).image, fit: BoxFit.cover)),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  AppGaps.hGap12,
                  Text(
                    "Send Message",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppGaps.hGap16,
                Text(
                  dateText,
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.bodyTextColor),
                ),
              ],
            )
          ],
        ));
  }
}
