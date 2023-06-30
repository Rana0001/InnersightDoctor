
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_components.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import '../widgets/core.dart';
import '../widgets/insight_screen_widgets.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Set graph label text style
    final graphLabelTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: AppColors.bodyTextColor);
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Insight')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top extra spaces
            AppGaps.hGap15,
            /* <---- 3 colored 3 statistics row ----> */
            SizedBox(
              height: 131,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Orders total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFFBEFE2),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.secondaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.userSVGLogoSolid,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '45',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Clients',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                      AppGaps.wGap16,
                      /* <---- Ride total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFEEECFA),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.primaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.appointmentsSVGLogoSolid,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '68',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Appointments',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                      AppGaps.wGap16,
                      /* <---- Earning total data widget ----> */
                      Container(
                        height: 131,
                        width: 130,
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                            color: Color(0xFFE7F5FD),
                            borderRadius: BorderRadius.all(
                                AppComponents.defaultBorderRadius)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomIconButtonWidget(
                                borderRadiusRadiusValue:
                                    const Radius.circular(8),
                                backgroundColor: AppColors.tertiaryColor,
                                child: SvgPicture.asset(
                                  AppAssetImages.walletSVGLogoLine,
                                  color: Colors.white,
                                )),
                            AppGaps.hGap16,
                            Text(
                              '23800',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            AppGaps.hGap4,
                            Text(
                              'Earnings',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.bodyTextColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            AppGaps.hGap32,
            /* <---- 'Earnings' and date select dropdown menu row ----> */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Earnings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                PopupMenuButton<int>(
                    padding: const EdgeInsets.only(right: 5),
                    position: PopupMenuPosition.under,
                    // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Today',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                        AppGaps.wGap2,
                        SvgPicture.asset(AppAssetImages.arrowDown2SVGLogoSolid,
                            height: 12,
                            width: 12,
                            color: AppColors.primaryColor),
                      ],
                    ),
                    itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 0,
                            // padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Yesterday',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ]),
              ],
            ),
            AppGaps.hGap32,
            /* <---- Linear graph for insight ----> */
            InsightLineGraphWidget(
              spots: const [
                FlSpot(0, 75),
                FlSpot(10, 50),
                FlSpot(20, 65),
                FlSpot(30, 57),
                FlSpot(40, 70),
                FlSpot(50, 25),
                FlSpot(60, 75),
                FlSpot(70, 70),
                FlSpot(80, 110),
                FlSpot(90, 105),
                FlSpot(100, 150),
                FlSpot(110, 75),
                FlSpot(120, 120),
                FlSpot(130, 125),
                FlSpot(140, 130),
                FlSpot(150, 75),
                FlSpot(160, 50),
                FlSpot(170, 55),
                FlSpot(180, 25),
                FlSpot(190, 75),
                FlSpot(200, 50),
                FlSpot(210, 60),
                FlSpot(220, 50),
              ],
              leftTitleWidgets: (double value, TitleMeta meta) {
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = '0';
                    break;
                  case 50:
                    text = '50';
                    break;
                  case 100:
                    text = '100';
                    break;
                  case 150:
                    text = '150';
                    break;
                  case 200:
                    text = '200';
                    break;
                  default:
                    return AppGaps.emptyGap;
                }

                return Text(text,
                    style: graphLabelTextStyle, textAlign: TextAlign.left);
              },
              bottomTitleWidgets: (double value, TitleMeta meta) {
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = '10:00';
                    break;
                  case 44:
                    text = '11:00';
                    break;
                  case 88:
                    text = '12:00';
                    break;
                  case 132:
                    text = '13:00';
                    break;
                  case 176:
                    text = '14:00';
                    break;
                  case 220:
                    text = '15:00';
                    break;
                  default:
                    return AppGaps.emptyGap;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0,
                  child: Text(
                    text,
                    style: graphLabelTextStyle,
                  ),
                );
              },
            ),
            /* <---- 'View all transaction' centered text button ----> */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTightTextButtonWidget(
                  child: const Text('View all transactions'),
                  onTap: () {},
                )
              ],
            ),
            AppGaps.hGap32,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Clients',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                PopupMenuButton<int>(
                    padding: const EdgeInsets.only(right: 5),
                    position: PopupMenuPosition.under,
                    // icon: const Icon(Icons.more_vert_rounded, color: AppColors.darkColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Today',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor),
                        ),
                        AppGaps.wGap2,
                        SvgPicture.asset(AppAssetImages.arrowDown2SVGLogoSolid,
                            height: 12,
                            width: 12,
                            color: AppColors.primaryColor),
                      ],
                    ),
                    itemBuilder: (context) => [
                          const PopupMenuItem<int>(
                            value: 0,
                            // padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Yesterday',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ]),
              ],
            ),
            AppGaps.hGap32,
            /* <---- Insight linear graph ----> */
            InsightLineGraphWidget(
              spots: const [
                FlSpot(0, 75),
                FlSpot(10, 50),
                FlSpot(20, 65),
                FlSpot(30, 57),
                FlSpot(40, 70),
                FlSpot(50, 25),
                FlSpot(60, 75),
                FlSpot(70, 70),
                FlSpot(80, 110),
                FlSpot(90, 105),
                FlSpot(100, 150),
                FlSpot(110, 75),
                FlSpot(120, 120),
                FlSpot(130, 125),
                FlSpot(140, 130),
                FlSpot(150, 75),
                FlSpot(160, 50),
                FlSpot(170, 55),
                FlSpot(180, 25),
                FlSpot(190, 75),
                FlSpot(200, 50),
                FlSpot(210, 60),
                FlSpot(220, 50),
              ],
              leftTitleWidgets: (double value, TitleMeta meta) {
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = '0';
                    break;
                  case 50:
                    text = '50';
                    break;
                  case 100:
                    text = '100';
                    break;
                  case 150:
                    text = '150';
                    break;
                  case 200:
                    text = '200';
                    break;
                  default:
                    return AppGaps.emptyGap;
                }

                return Text(text,
                    style: graphLabelTextStyle, textAlign: TextAlign.left);
              },
              bottomTitleWidgets: (double value, TitleMeta meta) {
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = '10:00';
                    break;
                  case 44:
                    text = '11:00';
                    break;
                  case 88:
                    text = '12:00';
                    break;
                  case 132:
                    text = '13:00';
                    break;
                  case 176:
                    text = '14:00';
                    break;
                  case 220:
                    text = '15:00';
                    break;
                  default:
                    return AppGaps.emptyGap;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0,
                  child: Text(
                    text,
                    style: graphLabelTextStyle,
                  ),
                );
              },
            ),
            // Bottom extra spaces
            AppGaps.hGap30,
          ],
        ),
      )),
    );
  }
}
