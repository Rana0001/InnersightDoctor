import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import '../widgets/core.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int? selectedSpecialization;
    final bool _toggleHideNewPassword = true;

  /// Toggle value of hide confirm password
  bool _toggleHideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Change Password')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppGaps.hGap32,
                    Row(
                      children: [
                        Text('Password',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                    AppGaps.hGap24,
                    CustomTextFormField(
                        hasShadow: false,
                        isPasswordTextField: _toggleHideConfirmPassword,
                        labelText: 'Current password',
                        hintText: '********',
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                        suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            color: Colors.transparent,
                            onPressed: () => setState(() =>
                                _toggleHideConfirmPassword =
                                    !_toggleHideConfirmPassword),
                            icon: SvgPicture.asset(AppAssetImages.unlockSVGLogoLine,
                                color: _toggleHideConfirmPassword
                                    ? AppColors.bodyTextColor
                                    : AppColors.primaryColor)),
                      ),
                    AppGaps.hGap24,
                     CustomTextFormField(
                        hasShadow: false,
                        isPasswordTextField: _toggleHideConfirmPassword,
                        labelText: 'New password',
                        hintText: '********',
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                        suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            color: Colors.transparent,
                            onPressed: () => setState(() =>
                                _toggleHideConfirmPassword =
                                    !_toggleHideConfirmPassword),
                            icon: SvgPicture.asset(AppAssetImages.unlockSVGLogoLine,
                                color: _toggleHideConfirmPassword
                                    ? AppColors.bodyTextColor
                                    : AppColors.primaryColor)),
                      ),
                    AppGaps.hGap24,
                     CustomTextFormField(
                        hasShadow: false,
                        isPasswordTextField: _toggleHideConfirmPassword,
                        labelText: 'Confirm password',
                        hintText: '********',
                        prefixIcon:
                            SvgPicture.asset(AppAssetImages.unlockSVGLogoLine),
                        suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            color: Colors.transparent,
                            onPressed: () => setState(() =>
                                _toggleHideConfirmPassword =
                                    !_toggleHideConfirmPassword),
                            icon: SvgPicture.asset(AppAssetImages.unlockSVGLogoLine,
                                color: _toggleHideConfirmPassword
                                    ? AppColors.bodyTextColor
                                    : AppColors.primaryColor)),
                      ),
                    AppGaps.hGap24,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      /* <-------- Bottom bar --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedButtonWidget(
        onTap: () {},
        child: const Text('Change Password'),
      )),
    );
  }

  String getGenderText(int? gender) {
    switch (gender) {
      case 0:
        return 'Others';
      case 1:
        return 'Heart';
      case 2:
        return 'Brain';
      default:
        return 'Others';
    }
  }
}
