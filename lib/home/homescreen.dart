import 'dart:ui';
import 'package:doctor/app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import '../widgets/core.dart';
import '../widgets/home_screen_widgets.dart';
import '../widgets/pro/home_screen_wid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Bottom slider panel controller
  final PanelController _panelController = PanelController();

  /// Global of home scaffold key for opening drawer
  final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /* <-------- Initial state --------> */
  @override
  @override
  Widget build(BuildContext context) {
    /// Get screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _homeScaffoldKey,
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
        /* <---- Show drawer button ----> */
        leading: Center(
          child: CustomIconButtonWidget(
              onTap: () {
                if (_homeScaffoldKey.currentState != null &&
                    !_homeScaffoldKey.currentState!.isDrawerOpen) {
                  _homeScaffoldKey.currentState?.openDrawer();
                }
              },
              hasShadow: true,
              child: SvgPicture.asset(
                AppAssetImages.userSVGLogoSolid,
                color: AppColors.darkColor,
                height: 20,
                width: 20,
              )),
        ),
      ),
      /* <-------- Drawer --------> */
      drawer: Stack(
        clipBehavior: Clip.none,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.05,
              sigmaY: 3.05,
            ),
            child: const SizedBox.expand(),
          ),
          const Drawer(
            backgroundColor: AppColors.primaryColor,
            child: DrawerList(),
          )
        ],
      ),
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: AppGaps.hGap15),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Profile Overview',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisSpacing: AppGaps.screenPaddingValue,
                  mainAxisExtent: 178,
                  crossAxisCount: 2,
                  childAspectRatio: 1),
              delegate: SliverChildListDelegate([
                CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.primaryColor,
                    localSVGAssetFileName: AppAssetImages.walletVGLogoSolid,
                    valueText: 'Nrs. ${Constant.total}',
                    subtitleText: 'Total',
                    subtitleText2: 'Payments',
                  ),
                ),
                CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.tertiaryColor,
                    localSVGAssetFileName: AppAssetImages.homeSVGLogoLine,
                    valueText: '${Constant.totalPatients}',
                    subtitleText: 'Total',
                    subtitleText2: 'Patients',
                  ),
                ),
                CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.secondaryColor,
                    localSVGAssetFileName:
                        AppAssetImages.appointmentsSVGLogoSolid,
                    valueText: '${Constant.appointmentTotal}',
                    subtitleText: 'Total',
                    subtitleText2: 'Appointments',
                  ),
                ),
                const CustomGridSingleItemWidget(
                  child: HomeSingleStatisticsWidget(
                    iconColor: AppColors.successColor,
                    localSVGAssetFileName: AppAssetImages.messageSVGLogoSolid,
                    valueText: '****',
                    subtitleText: 'Total',
                    subtitleText2: 'Conversation',
                  ),
                ),
              ]),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap32),
          ],
        ),
      ),
    );
  }
}
