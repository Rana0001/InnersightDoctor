// import 'package:flutter/material.dart';

// import '../utils/app_colors.dart';
// import '../utils/app_gaps.dart';
// import '../widgets/core.dart';

// class ViewAppointmentScreen extends StatefulWidget {
//   const ViewAppointmentScreen({Key? key}) : super(key: key);

//   @override
//   State<ViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
// }

// class _ViewAppointmentScreenState extends State<ViewAppointmentScreen> {
//   final List<String> availableDates = [
//     '10:00 AM',
//     '11:00 AM',
//     '12:00 PM',
//     '01:00 PM',
//     '02:00 PM',
//   ];
//   List<String> bookedDates = ['03:00 PM', '04:00 PM', '05:00 PM'];

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: CoreWidgets.appBarWidget(screenContext: context),
//         body: NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) => [
//             /* <---- Product images carousel ----> */
//             SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 expandedHeight: screenSize.height < 550 ? 290 : 288,
//                 flexibleSpace: FlexibleSpaceBar(
//                   collapseMode: CollapseMode.pin,
//                   background: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       /* <---- Product images carousel widget ----> */
//                       SizedBox(
//                         height: screenSize.height < 550 ? 300 : 380,
//                         child: PageView.builder(
//                           itemCount: 5,
//                           itemBuilder: (context, index) => Container(
//                             alignment: Alignment.center,
//                             child: Image.asset('assets/images/doctor.png'),
//                           ),
//                         ),
//                       ),
//                       AppGaps.hGap24,
//                     ],
//                   ),
//                 ))
//           ],
//           body: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: AppGaps.screenPaddingValue,
//             ),
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 225, 225, 225),
//               borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//             ),
//             child: CustomScrollView(
//               physics: const NeverScrollableScrollPhysics(),
//               slivers: [
//                 const SliverToBoxAdapter(child: AppGaps.hGap24),
//                 SliverToBoxAdapter(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '2023-07-12',
//                         style: Theme.of(context).textTheme.headlineMedium,
//                       ),
//                       AppGaps.hGap7,
//                     ],
//                   ),
//                 ),
//                 const SliverToBoxAdapter(child: AppGaps.hGap24),
//                 SliverToBoxAdapter(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Booked Appointment',
//                         style: Theme.of(context).textTheme.labelLarge,
//                       ),
//                       AppGaps.hGap16,
//                       Wrap(
//                         spacing: 8,
//                         runSpacing: 8,
//                         children: bookedDates.map((date) {
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 bookedDates.remove(date);
//                               });
//                             },
//                             child: Container(
//                               width: 100, // Set your desired width
//                               height: 60,
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: AppColors.primaryColor,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   date,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SliverToBoxAdapter(child: AppGaps.hGap24),
//                 SliverToBoxAdapter(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Available Appointment',
//                         style: Theme.of(context).textTheme.labelLarge,
//                       ),
//                       AppGaps.hGap16,
//                       Wrap(
//                         spacing: 8,
//                         runSpacing: 8,
//                         children: availableDates.map((date) {
//                           final isBooked = bookedDates.contains(date);
//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 if (isBooked) {
//                                   bookedDates.remove(date);
//                                 } else {
//                                   bookedDates.add(date);
//                                 }
//                               });
//                             },
//                             child: Container(
//                               width: 100,
//                               height: 50,
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: isBooked
//                                     ? AppColors.primaryColor.withOpacity(0.5)
//                                     : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: AppColors.primaryColor,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   date,
//                                   style: TextStyle(
//                                     color: isBooked
//                                         ? Colors.white
//                                         : AppColors.primaryColor,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_gaps.dart';
import '../widgets/core.dart';

class ViewAppointmentScreen extends StatefulWidget {
  ViewAppointmentScreen({Key? key, this.date}) : super(key: key);
  String? date;
  @override
  State<ViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
}

class _ViewAppointmentScreenState extends State<ViewAppointmentScreen> {
  List<String> availableDates = [];
  List<String> bookedDates = [];
  List<String> selectedDates = [];
  bool isLoading = false;
  getAppointment() async {
    availableDates = await Services().getAppointment(widget.date);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
      getAppointment();
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: CoreWidgets.appBarWidget(screenContext: context),
        backgroundColor: const Color.fromARGB(238, 247, 247, 251),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            /* <---- Product images carousel ----> */
            SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: screenSize.height < 550 ? 290 : 208,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /* <---- Product images carousel widget ----> */
                      SizedBox(
                        height: screenSize.height < 550 ? 300 : 180,
                        child: Image.asset('assets/images/doctor.png'),
                      ),
                      AppGaps.hGap24,
                    ],
                  ),
                ))
          ],
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppGaps.screenPaddingValue,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: AppGaps.hGap24),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.date!,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      AppGaps.hGap7,
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: AppGaps.hGap24),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booked Appointment',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      AppGaps.hGap16,
                      bookedDates.isNotEmpty
                          ? Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: bookedDates.map((date) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      bookedDates.remove(date);
                                    });
                                  },
                                  child: Container(
                                    width: 100, // Set your desired width
                                    height: 60,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        date,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          : Center(
                              child: Text(
                                'No Booked Appointment',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: AppGaps.hGap24),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Available Appointment',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      AppGaps.hGap16,
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: availableDates.map((date) {
                                final isBooked = selectedDates.contains(date);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!isBooked) {
                                        selectedDates.add(date);
                                      } else {
                                        selectedDates.remove(date);
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 50,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: isBooked
                                          ? AppColors.primaryColor
                                              .withOpacity(0.5)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                          color: isBooked
                                              ? Colors.white
                                              : AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
