import 'package:doctor/app/constant.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';

import '../utils/app_gaps.dart';
import '../widgets/core.dart';
import '../widgets/my_wallet_screen_widgets.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  int total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* <-------- Appbar --------> */
      appBar: CoreWidgets.appBarWidget(
        screenContext: context,
        hasBackButton: true,
        titleWidget: const Text('Wallet'),
      ),
      /* <-------- Content --------> */
      body: CustomScaffoldBodyWidget(
        child: CustomScrollView(slivers: [
          // Top extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap15),
          /* <---- Card widget ----> */
          SliverToBoxAdapter(
              child: PaymentCardWidget(
                  child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Name',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text(Constant.doctor.fullName!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              AppGaps.hGap16,
              Constant.doctor.phone != ""
                  ? Text(
                      'Khalti: +977 ${Constant.doctor.phone}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    )
                  : Text(
                      'Khalti: +977 98XXXXXXXX',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    ),
              AppGaps.hGap16,
              Text('Balance',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white.withOpacity(0.7))),
              AppGaps.hGap2,
              Text(r'Nrs. ' + Constant.total.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ],
          ))),
          const SliverToBoxAdapter(child: AppGaps.hGap32),
          SliverToBoxAdapter(
              child: Text(
            'Recent transactions',
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          const SliverToBoxAdapter(child: AppGaps.hGap16),
          /* <---- Recent transaction list ----> */
          FutureBuilder(
              future: Services().getTransactionToDoc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      /// Get single recent transaction
                      final recentTransaction = snapshot.data![index];

                      return RecentTransactionWidget(
                        payment: recentTransaction,
                      );
                    },
                    childCount: snapshot.data!.length,
                  ));
                } else {
                  return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()));
                }
              }),

          // Bottom extra spaces
          const SliverToBoxAdapter(child: AppGaps.hGap30),
        ]),
      ),
    );
  }
}
