import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import 'core.dart';





/// Home page single statistic info summery widget
class HomeSingleStatisticsWidget extends StatelessWidget {
  final String localSVGAssetFileName;
  final Color iconColor;
  final String valueText;
  final String subtitleText;
  final String subtitleText2;

  const HomeSingleStatisticsWidget({
    Key? key,
    required this.iconColor,
    required this.valueText,
    required this.subtitleText,
    required this.localSVGAssetFileName,
    required this.subtitleText2,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButtonWidget(
              borderRadiusRadiusValue: const Radius.circular(8),
              backgroundColor: iconColor.withOpacity(0.1),
              child: SvgPicture.asset(
                localSVGAssetFileName,
                color: iconColor,
              )),
          AppGaps.hGap16,
          Text(
            valueText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          AppGaps.hGap4,
          Text(
            subtitleText,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.bodyTextColor, fontSize: 16),
          ),
          AppGaps.hGap4,
          Text(
            subtitleText2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.bodyTextColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
