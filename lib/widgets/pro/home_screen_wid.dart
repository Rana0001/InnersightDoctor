import 'package:doctor/app/constant.dart';
import 'package:doctor/component/message.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_gaps.dart';
import '../../utils/app_page_names.dart';
import '../../utils/images.dart';
import '../core.dart';

/// Drawer content list widgets
class DrawerList extends StatefulWidget {
  const DrawerList({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  bool isLogOut = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLogOut
          ? SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                  AppGaps.hGap10,
                  Text(
                    'Logging out...',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppGaps.screenPaddingValue),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppGaps.hGap20,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomIconButtonWidget(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            backgroundColor: Colors.white.withOpacity(0.1),
                            child: SvgPicture.asset(
                              AppAssetImages.closeSVGLogoLine,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    AppGaps.hGap20,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(Constant.doctor.profileURl!),
                            radius: 44,
                          ),
                          AppGaps.wGap24,
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Constant.doctor.fullName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                AppGaps.hGap10,
                                /* <---- Profile phone number ----> */

                                Constant.doctor.phone != ""
                                    ? Text('+977 ${Constant.doctor.phone}',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)))
                                    : Text('+977 98XXXXXXXX',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7))),
                                AppGaps.hGap5,
                                /* <---- Profile email address ----> */
                                Constant.doctor.email != ""
                                    ? Text(Constant.doctor.email!,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)))
                                    : Text('prashant@gmail.com',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7))),
                              ],
                            ),
                          )
                        ]),
                    AppGaps.hGap48,
                    /* <---- Wallet drawer menu button ----> */
                    DrawerMenuWidget(
                        text: 'My wallet',
                        localAssetIconName: AppAssetImages.walletSVGLogoLine,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.myWalletScreen);
                        }),

                    AppGaps.hGap24,
                    /* <---- Settings drawer menu button ----> */
                    DrawerMenuWidget(
                        text: 'Settings',
                        localAssetIconName: AppAssetImages.settingSVGLogoLine,
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppPageNames.settingsScreen);
                        }),
                    AppGaps.hGap24,
                    /* <---- Sign out drawer menu button ----> */
                    DrawerMenuWidget(
                        text: 'Sign out',
                        localAssetIconName: AppAssetImages.logoutSVGLogoLine,
                        onTap: () async {
                          setState(() {
                            isLogOut = true;
                          });
                          bool result = await Services().logout();
                          if (result) {
                            setState(() {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppPageNames.loginScreen,
                                  (Route<dynamic> route) => false);
                              Messages.successMessage(
                                  "Logout Successful", context);
                            });
                          } else {
                            setState(() {
                              Messages.errorMessage(
                                  "Something went wrong. Please try again later.",
                                  context);
                            });
                          }
                        }),
                    // Bottom extra spaces
                    AppGaps.hGap50,
                  ],
                ),
              ),
            ),
    );
  }
}

/// Single drawer menu widget
class DrawerMenuWidget extends StatelessWidget {
  final String text;
  final String localAssetIconName;
  final void Function()? onTap;
  const DrawerMenuWidget({
    Key? key,
    required this.text,
    required this.localAssetIconName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRawListTileWidget(
        onTap: onTap,
        borderRadiusRadiusValue: const Radius.circular(14),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButtonWidget(
              fixedSize: const Size(48, 48),
              backgroundColor: Colors.white.withOpacity(0.1),
              child: SvgPicture.asset(
                localAssetIconName,
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
            AppGaps.wGap16,
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
            Transform.scale(
                scaleX: -1,
                child: SvgPicture.asset(AppAssetImages.arrowLeftSVGLogoLine,
                    color: Colors.white.withOpacity(0.6))),
          ],
        ));
  }
}

/// Delivery single product details list tile
class DeliveryProductListTile extends StatelessWidget {
  final ImageProvider<Object> productImage;
  final String name;
  final int itemCount;
  final String priceText;
  const DeliveryProductListTile({
    Key? key,
    required this.productImage,
    required this.name,
    required this.itemCount,
    required this.priceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, bottom: 16, right: 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                image: DecorationImage(image: productImage, fit: BoxFit.cover)),
          ),
          AppGaps.wGap8,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              AppGaps.hGap8,
              Text('$itemCount items',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.bodyTextColor,
                      )),
            ],
          )),
          Text(
            '\$$priceText',
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
