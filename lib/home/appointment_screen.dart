import 'package:flutter/material.dart';

import '../models/fake_models/appointment_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../utils/app_page_names.dart';
import '../widgets/appointment_sections_widget.dart';
import '../widgets/core.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentSections = [
      AppointmentSections(
        title: 'Schedule',
        itemNumber: 7,
        categoryImage: Image.asset('assets/images/schedule.png').image,
      ),
      AppointmentSections(
        title: 'View',
        itemNumber: 0,
        categoryImage: Image.asset('assets/images/view_appointment.png').image,
      )
    ];

    return Scaffold(
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: false,
        titleWidget: const Text('Appointments'),
      ),
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: AppGaps.hGap10),
            const SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Appointments',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  AppGaps.wGap10,
                  Text(
                    'Settings',
                    style: TextStyle(color: AppColors.bodyTextColor),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap16),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: AppGaps.screenPaddingValue,
                mainAxisSpacing: AppGaps.screenPaddingValue,
                mainAxisExtent: 235,
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final board = appointmentSections[index];

                  return GestureDetector(
                    onTap: () {
                      // Open different pages based on the category
                      if (board.title == 'Schedule') {
                        Navigator.pushNamed(
                          context,
                          AppPageNames.sheduleAppointmentScreen,
                          arguments: board.title,
                        );
                      } else if (board.title == 'View') {
                        Navigator.pushNamed(
                          context,
                          AppPageNames.searchappointmentDetailsScreen,
                          arguments: board.title,
                        );
                      }
                    },
                    child: CustomGridSingleItemWidget(
                      child: AppointmentCategoriesGridSingleItemWidget(
                        title: board.title,
                        itemNumber: board.itemNumber,
                        categoryImageProvider: board.categoryImage,
                      ),
                    ),
                  );
                },
                childCount: appointmentSections.length,
              ),
            ),
            const SliverToBoxAdapter(child: AppGaps.hGap30),
          ],
        ),
      ),
    );
  }
}
