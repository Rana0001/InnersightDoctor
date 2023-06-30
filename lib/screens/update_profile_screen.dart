import 'dart:io';

import 'package:doctor/app/constant.dart';
import 'package:doctor/component/message.dart';
import 'package:doctor/models/doctors.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/images.dart';
import '../widgets/core.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String? selectedSpecialization;
  File? img;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _qualifucationController =
      TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();

  Future _browseImage(ImageSource imageSource) async {
    try {
      // Source is either Gallary or Camera
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateProfile() async {
    if (_fullNameController.text.isEmpty) {
      Messages.errorMessage('Please enter your full name', context);
      return;
    }

    if (_phoneNumber.text.isEmpty) {
      Messages.errorMessage('Please enter your phone number', context);
      return;
    }

    if (_qualifucationController.text.isEmpty) {
      Messages.errorMessage('Please enter your qualification', context);
      return;
    }

    if (_experienceController.text.isEmpty) {
      Messages.errorMessage('Please enter your experience', context);
      return;
    }

    if (_rateController.text.isEmpty) {
      Messages.errorMessage('Please enter your rate', context);
      return;
    }

    if (selectedSpecialization == null) {
      Messages.errorMessage('Please select your specialization', context);
      return;
    }

    Doctor doctor = Doctor();
    doctor.fullName = _fullNameController.text ?? Constant.doctor.fullName;
    doctor.phone = _phoneNumber.text ?? Constant.doctor.phone;
    doctor.qualification =
        _qualifucationController.text ?? Constant.doctor.qualification;
    doctor.experience =
        _experienceController.text ?? Constant.doctor.experience;
    doctor.price = _rateController.text ?? Constant.doctor.price;
    doctor.speciality = selectedSpecialization! ?? Constant.doctor.speciality;

    bool result = await Services().updateProfile(doctor);

    if (result) {
      setState(() {
        Messages.successMessage('Profile updated successfully', context);
      });
    } else {
      setState(() {
        Messages.errorMessage('Something went wrong', context);
      });
    }
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          // Open camera logic
                          _browseImage(ImageSource.camera);
                        },
                        title: const Text(
                          'Open Camera',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          // Open gallery logic
                          _browseImage(ImageSource.gallery);
                        },
                        title: const Text(
                          'Open Gallery',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        title: const Center(child: Text('Cancel')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
          screenContext: context, titleWidget: const Text('Update Profile')),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top extra spaces
              AppGaps.hGap15,
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        /* <---- Product picture ----> */
                        Constant.doctor.profileURl != '' && img == null
                            ? CircleAvatar(
                                backgroundColor: AppColors.lineShapeColor,
                                backgroundImage:
                                    NetworkImage(Constant.doctor.profileURl!),
                                radius: 64,
                              )
                            : Constant.doctor.profileURl == '' && img == null
                                ? const CircleAvatar(
                                    backgroundColor: AppColors.lineShapeColor,
                                    radius: 64,
                                  )
                                : CircleAvatar(
                                    backgroundColor: AppColors.lineShapeColor,
                                    backgroundImage: FileImage(img!),
                                    radius: 64,
                                  ),
                        /* <---- Small camera circle icon button ----> */
                        Positioned(
                            bottom: 7,
                            right: -3,
                            child: IconButton(
                              onPressed: () {
                                _showOptionsDialog(context);
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                  minHeight: 34, minWidth: 34),
                              icon: Container(
                                height: 34,
                                width: 34,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor,
                                    border: Border.all(color: Colors.white)),
                                child: SvgPicture.asset(
                                  AppAssetImages.cameraSVGLogoSolid,
                                  height: 14,
                                  width: 14,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                    AppGaps.hGap18,
                    CustomHorizontalDashedLineWidget(
                        color: AppColors.darkColor.withOpacity(0.1)),
                    AppGaps.hGap32,
                    Row(
                      children: [
                        Text('Profile info',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                      ],
                    ),
                    AppGaps.hGap24,
                    CustomTextFormField(
                        controller: _fullNameController,
                        labelText: 'Full Name',
                        hintText: 'Full name here',
                        prefixIcon: AppGaps.emptyGap),
                    AppGaps.hGap24,

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                              controller: _phoneNumber,
                              labelText: 'Phone number',
                              hintText: 'Phone number here',
                              prefixIcon: const Text('+977')),
                        ),
                        AppGaps.wGap16,
                      ],
                    ),
                    AppGaps.hGap24,

                    CustomTextFormField(
                        controller: _qualifucationController,
                        labelText: 'Qualification',
                        hintText: 'Qualification here',
                        prefixIcon: AppGaps.emptyGap),
                    AppGaps.hGap24,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            isReadOnly: true,
                            labelText: 'Specialization',
                            hintText: 'Select Your Speciality',
                            prefixIcon: SvgPicture.asset(
                                AppAssetImages.starBlowingSVGLogoDualTone),
                            suffixIcon: PopupMenuButton<int>(
                              padding: const EdgeInsets.only(right: 5),
                              position: PopupMenuPosition.under,
                              child: CustomIconButtonWidget(
                                fixedSize: const Size(20, 20),
                                child: SvgPicture.asset(
                                  AppAssetImages.arrowDown2SVGLogoSolid,
                                  height: 25,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: const Text(
                                    'Clinical Psychology',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedSpecialization =
                                          'Clinical Psychology';
                                    });
                                  },
                                ),
                                PopupMenuItem<int>(
                                  value: 1,
                                  child: const Text(
                                    'Neuro Psychology',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedSpecialization =
                                          'Neuro Psychology';
                                    });
                                  },
                                ),
                                PopupMenuItem<int>(
                                  value: 2,
                                  child: const Text(
                                    'Forensic Psychology',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedSpecialization =
                                          'Forensic Psychology';
                                    });
                                  },
                                ),
                                PopupMenuItem<int>(
                                  value: 3,
                                  child: const Text(
                                    'Child Psychology',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedSpecialization =
                                          'Child Psychology';
                                    });
                                  },
                                ),
                                PopupMenuItem<int>(
                                  value: 4,
                                  child: const Text(
                                    'Others',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedSpecialization = 'Others';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    AppGaps.hGap24,
                    /* <---- Product price and stock ----> */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                              controller: _rateController,
                              labelText: 'Rate/hr',
                              hintText: '0.00',
                              prefixIcon: const Text('Nrs')),
                        ),
                        AppGaps.wGap16,
                        Expanded(
                          child: CustomTextFormField(
                              controller: _experienceController,
                              labelText: 'Experience',
                              hintText: '20',
                              prefixIcon: const Text('Yr')),
                        ),
                      ],
                    ),
                    AppGaps.hGap24,
                    Row(
                      children: [
                        CustomTightTextButtonWidget(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                    AppAssetImages.plusSVGLogoSolid,
                                    color: AppColors.primaryColor),
                                AppGaps.wGap4,
                                const Text('Add more options'),
                              ],
                            )),
                      ],
                    ),
                    // Bottom extra spaces
                    AppGaps.hGap30,
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
        child: const Text('Update Profile'),
      )),
    );
  }
}
