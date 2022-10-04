import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwni_user/providers/toggle_provider.dart';
import 'package:kiwni_user/screens/home/home/calender_view.dart';
import 'package:kiwni_user/screens/home/home/select_car_view.dart';
import 'package:kiwni_user/screens/home/home/select_package.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/utils/images_helper.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../../utils/Dimentions.dart';

class MiddleViewWidget extends StatelessWidget {
  MiddleViewWidget({Key? key}) : super(key: key);
  Completer<GoogleMapController> _controller = Completer();
  onTap() {}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ColorsHelper.whiteColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            title: Constants.PICKUP_ON,
                            fontSize: Diamentions.font18,
                            fontColor: ColorsHelper.greyColor,
                          ),
                        ),
                        SizedBox(
                          height: 0.03,
                        ),
                        Expanded(
                          child: CustomText(
                            title: Constants.RETURN_BY,
                            fontSize: Diamentions.font18,
                            fontColor: ColorsHelper.greyColor,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CalenderRow(
                                      onTap: onTap,
                                      fontSize: Diamentions.font14,
                                      title: Constants.CUSTOM_DATE,
                                      leadingIcon: ImagesHelper.IMG_CALENDER,
                                      padding: width * 0.03,
                                      leadingIconSize: width * 0.10,
                                      isDownArrowVisible: true,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CalenderRow(
                                      onTap: onTap,
                                      fontSize: Diamentions.font14,
                                      title: "Tue ,28 Dec",
                                      leadingIcon: ImagesHelper.IMG_CALENDER,
                                      padding: width * 0.03,
                                      leadingIconSize: width * 0.10,
                                      isDownArrowVisible: true,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CalenderRow(
                                      fontSize: Diamentions.font14,
                                      onTap: onTap,
                                      title: "07:00 PM",
                                      leadingIcon: ImagesHelper.IMG_CLOCK,
                                      padding: width * 0.03,
                                      leadingIconSize: width * 0.10,
                                      isDownArrowVisible: true,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                      title: Constants.SELECT_CAR,
                      fontSize: Diamentions.font16,
                      fontColor: ColorsHelper.blackColor,
                    ),
                    SelectCarView(),
                    if (context.read(toggleProvider).getSelectedTabIndex() == 2)
                      SelectPackage(),
                    RoundedButton(
                      onTap: () {
                        Get.toNamed("/cabList");
                      },
                      title: Constants.VIEW_CAB,
                      isSuffix: true,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.whiteColor,
                      borderRadius: 10,
                      backgroundColor: ColorsHelper.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
