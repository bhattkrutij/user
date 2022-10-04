import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/providers/toggle_provider.dart';
import 'package:kiwni_user/screens/cabs/cab_item.dart';
import 'package:kiwni_user/screens/cabs/tavel_details_info.dart';
import 'package:kiwni_user/screens/home/home/select_car_view.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/images_helper.dart';
import '../home/home/calender_view.dart';

class CabsList extends StatefulWidget {
  const CabsList({Key? key}) : super(key: key);

  @override
  State<CabsList> createState() => _CabsListState();
}

class _CabsListState extends State<CabsList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var model = context.read(toggleProvider);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: height * 0.03,
                                color: ColorsHelper.primaryColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: height * 0.03,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: model.selectedTabName.toLowerCase()!,
                                    style: TextStyle(
                                        fontFamily: Constants.FONT_FAMILY,
                                        color: ColorsHelper.primaryColor,
                                        fontSize: Diamentions.font18),
                                    children: [
                                      TextSpan(
                                        text: (model.selectedTabIndex == 0 ||
                                                model.selectedTabIndex == 1)
                                            ? '(${model.selectedToggleName!.toLowerCase()})'
                                            : '',
                                        style: TextStyle(
                                            color: ColorsHelper.primaryColor,
                                            fontSize: Diamentions.font12),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => print('Tap Here onTap'),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  ImagesHelper.IMG_CALL,
                                  height: height * 0.03,
                                  width: height * 0.03,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TravelDetailsInfo(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: SelectCarView(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Image.asset(
                                  ImagesHelper.IMG_SORT,
                                  width: width * 0.04,
                                  height: width * 0.04,
                                  color: ColorsHelper.primaryColor,
                                ),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                Positioned(
                                  left: width * 0.10,
                                  child: Center(
                                    child: CustomText(
                                      fontFamily: Constants.FONT_FAMILY,
                                      title: "Sort",
                                      fontColor: ColorsHelper.greyColor,
                                      fontSize: Diamentions.font18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    ImagesHelper.IMG_FILTER,
                                    width: width * 0.04,
                                    height: width * 0.04,
                                    color: ColorsHelper.primaryColor,
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(
                                      fontFamily: Constants.FONT_FAMILY,
                                      title: "Filter",
                                      fontColor: ColorsHelper.greyColor,
                                      fontSize: Diamentions.font18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              height: 2,
              color: ColorsHelper.blackColor,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CabItem();
                  }))
        ],
      ),
    ));
  }
}
