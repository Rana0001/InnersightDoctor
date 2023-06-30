import 'package:doctor/component/message.dart';
import 'package:doctor/services/services.dart';
import 'package:doctor/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

import '../utils/app_gaps.dart';
import '../utils/images.dart';
import '../widgets/appointment_time_screen_widgets.dart';
import '../widgets/core.dart';

class SheduleAppointmentScreen extends StatefulWidget {
  const SheduleAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<SheduleAppointmentScreen> createState() =>
      _SheduleAppointmentScreenState();
}

class _SheduleAppointmentScreenState extends State<SheduleAppointmentScreen> {
  DateTime? selectedDate;

  List<bool> allAppointTimeValue = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> selectedTime = [];

  List<String> allAppointmentTime = [
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
    '04:00 PM',
  ];

  scheduleAnAppointment() async {
    if (selectedDate == null) {
      Messages.errorMessage("Please select a date", context);
      return;
    }

    if (selectedTime.isEmpty) {
      Messages.errorMessage('Please select a time', context);
      return;
    }

    bool result = await Services().setAppointment(
      DateFormat('yyyy-MM-dd').format(selectedDate!),
      selectedTime,
    );
    if (result) {
      setState(() {
        Messages.successMessage('Appointment scheduled successfully', context);
      });
    } else {
      setState(() {
        Messages.errorMessage('Something went wrong', context);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: true,
        titleWidget: const Text('Schedule Appointment'),
      ),
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
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppGaps.screenPaddingValue,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          AppGaps.hGap15,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  isReadOnly: true,
                                  onTap: () async {
                                    final pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 100),
                                    );

                                    if (pickedDate != null) {
                                      setState(() {
                                        selectedDate = pickedDate;
                                        // Assign the selected date
                                      });
                                    }
                                  },
                                  labelText: 'Appointment Date',
                                  hintText: selectedDate != null
                                      ? DateFormat('yyyy-MM-dd').format(
                                          selectedDate!) // Display the selected date
                                      : 'Select Date',
                                  prefixIcon: SvgPicture.asset(
                                    AppAssetImages.calendarSVGLogoLine,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppGaps.hGap10,
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          AppGaps.hGap10,
                          for (var i = 0;
                              i < allAppointmentTime.length;
                              i++) ...{
                            AppointmentTimeListTileWidget(
                              titleText: allAppointmentTime[i],
                              showRightArrow: false,
                              valueWidget: FlutterSwitch(
                                value: allAppointTimeValue[i],
                                width: 35,
                                height: 20,
                                toggleSize: 12,
                                activeColor: AppColors.primaryColor,
                                onToggle: (value) {
                                  setState(() {
                                    allAppointTimeValue[i] = value;
                                    if (allAppointTimeValue[i]) {
                                      selectedTime.add(allAppointmentTime[i]);
                                    } else {
                                      selectedTime
                                          .remove(allAppointmentTime[i]);
                                    }
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  allAppointTimeValue[i] =
                                      !allAppointTimeValue[i];
                                  if (allAppointTimeValue[i]) {
                                    selectedTime.add(allAppointmentTime[i]);
                                  } else {
                                    selectedTime.remove(allAppointmentTime[i]);
                                  }
                                });
                              },
                            ),
                            AppGaps.hGap10
                          }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
          child: CustomStretchedButtonWidget(
        onTap: () => scheduleAnAppointment(),
        child: const Text('Schedule Appointment'),
      )),
    );
  }
}
