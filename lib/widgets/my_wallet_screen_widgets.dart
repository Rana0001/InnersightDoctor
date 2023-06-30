import 'package:doctor/models/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/fake_models/recent_transaction_model.dart';
import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import 'core.dart';

/// Single recent transaction list tile widget
class RecentTransactionWidget extends StatelessWidget {
   RecentTransactionWidget({Key? key, required this.payment}) : super(key: key);

  final Payment payment;
  FakeRecentTransaction? recentTransaction;

  String _getTransactionTypeText() {
    switch (recentTransaction!.transactionType) {
      case 'send-to-bank':
        return 'Send to bank';
      default:
        return 'Earnings';
    }
  }

  String _getAmountText() {
    switch (recentTransaction!.transactionType) {
      case 'send-to-bank':
        return recentTransaction!.amountText;
      default:
        return recentTransaction!.amountText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomRawListTileWidget(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /* <---- Transaction image ----> */
          CustomIconButtonWidget(
              borderRadiusRadiusValue: const Radius.circular(12),
              child: SvgPicture.asset(AppAssetImages.arrowDown2SVGLogoSolid,
                  color: AppColors.secondaryColor)),
          AppGaps.wGap8,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* <---- Transaction title ----> */
              Text(
                '+977 ${payment.contact}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              AppGaps.hGap8,
              /* <---- Transaction item count, date and time ----> */
              Text(
                ' ${payment.billDate} |'
                ' Khalti',
                style: const TextStyle(
                    fontSize: 12, color: AppColors.bodyTextColor),
              ),
            ],
          )),
          AppGaps.wGap16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /* <---- Transaction amount ----> */
              Text(
                payment.amount!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              AppGaps.hGap8,
              /* <---- Transaction type ----> */
              Text(
                payment.status!,
                style: const TextStyle(
                    fontSize: 12, color: AppColors.bodyTextColor),
              )
            ],
          )
        ],
      )),
    );
  }
}
