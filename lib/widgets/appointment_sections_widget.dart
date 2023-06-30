import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';

class AppointmentCategoriesGridSingleItemWidget extends StatelessWidget {
  final String title;
  final int itemNumber;
  final ImageProvider<Object> categoryImageProvider;
  const AppointmentCategoriesGridSingleItemWidget({
    Key? key,
    required this.title,
    required this.itemNumber,
    required this.categoryImageProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: categoryImageProvider))),
        AppGaps.hGap16,
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        AppGaps.hGap8,
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: const BoxDecoration(
                color: AppColors.shadeColor2,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: itemNumber < 1
                ? const Text(
                    'Search Your Appoinment',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: AppColors.bodyTextColor, fontSize: 12),
                  )
                : Text(
                    '$itemNumber Time Slots',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: AppColors.bodyTextColor, fontSize: 12),
                  ),
          ),
        )
      ],
    );
  }
}
