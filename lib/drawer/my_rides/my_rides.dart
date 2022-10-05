import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/drawer/my_rides/past_ride.dart';
import 'package:kiwni_user/drawer/my_rides/upcoming.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';

import '../drawer_header.dart';

class MyRides extends StatefulWidget {
  const MyRides({Key? key}) : super(key: key);

  @override
  State<MyRides> createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: customDrawerPage(
        title: Constants.PAYMENT,
        child: MyRideBody(),
      ),
    ));
  }
}

class MyRideBody extends StatefulWidget {
  MyRideBody({Key? key}) : super(key: key);

  @override
  State<MyRideBody> createState() => _MyRideBodyState();
}

class _MyRideBodyState extends State<MyRideBody>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Diamentions.width100,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: ColorsHelper.whiteColor),
          width: Diamentions.screenWidth,
          height: Diamentions.screenHeight,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Container(
                  child: Center(
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: ColorsHelper.greyColor,
                      unselectedLabelColor: ColorsHelper.blackColor,
                      unselectedLabelStyle: TextStyle(
                        fontSize: Diamentions.font18,
                        fontFamily: Constants.FONT_FAMILY,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: const [
                        Tab(
                          text: Constants.UPCOMING,
                        ),
                        Tab(
                          text: Constants.PAST,
                        ),
                      ],
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Diamentions.font18,
                          fontFamily: Constants.FONT_FAMILY),
                      labelColor: ColorsHelper.blackColor,
                    ),
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    UpcomingRide(),
                    PastRides(),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
