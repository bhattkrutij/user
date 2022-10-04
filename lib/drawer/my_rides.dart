import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/appbar.dart';

class MyRides extends StatefulWidget {
  const MyRides({Key? key}) : super(key: key);

  @override
  State<MyRides> createState() => _MyRidesState();
}

class _MyRidesState extends State<MyRides> with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsHelper.primaryColor,
        body: Stack(
          children: [
            Positioned(
              top: Diamentions.width10,
              child: Container(
                  width: Diamentions.screenWidth,
                  child: CustomAppBar(
                    title: Constants.MY_RIDE,
                    fontColor: ColorsHelper.whiteColor,
                    iconColor: ColorsHelper.whiteColor,
                  )),
            ),
            Positioned(
              top: Diamentions.width100,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      color: ColorsHelper.whiteColor),
                  width: Diamentions.screenWidth,
                  height: Diamentions.screenHeight,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Diamentions.width10,
                      ),
                      DefaultTabController(
                          length: 2,
                          initialIndex: 0,
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
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
