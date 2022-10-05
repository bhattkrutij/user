import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/images_helper.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../drawer_header.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: customDrawerPage(
        title: Constants.OFFERS,
        child: OffersBody(),
      ),
    ));
  }
}

class OffersBody extends StatelessWidget {
  const OffersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: Diamentions.width50,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(Diamentions.width5),
                      child: Card(
                        elevation: 8,
                        child: Container(
                          height: Diamentions.screenHeight * 0.20,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: Diamentions.screenWidth,
                                  color: ColorsHelper.whiteColor,
                                  child: Column(
                                    children: [
                                      CustomText(
                                        title: "Honda",
                                        fontSize: Diamentions.font18,
                                        fontColor: ColorsHelper.blueColor,
                                      ),
                                      SizedBox(
                                        height: Diamentions.width5,
                                      ),
                                      Expanded(
                                        child: Container(
                                            width: Diamentions.screenWidth,
                                            height: Diamentions.width20,
                                            child: Image.asset(
                                                ImagesHelper.IMG_CAR1)),
                                      ),
                                      SizedBox(
                                        height: Diamentions.width5,
                                      ),
                                      SizedBox(
                                        width: Diamentions.screenWidth - 100,
                                        height: 2,
                                        child: DotWidget(
                                          totalWidth:
                                              (Diamentions.screenWidth / 2) -
                                                  Diamentions.width25,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Diamentions.width10),
                                        child: Container(
                                          width: Diamentions.screenWidth,
                                          height: Diamentions.width30,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: ColorsHelper.blueColor,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color:
                                                        ColorsHelper.blueColor,
                                                    width: 2.0,
                                                    style: BorderStyle
                                                        .solid), //set border for the button
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8)),
                                              ),
                                              onPrimary:
                                                  ColorsHelper.primaryColor,
                                            ),
                                            onPressed: () {},
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Rs 6000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            Diamentions.font16,
                                                        color: ColorsHelper
                                                            .whiteColor,
                                                        fontFamily: Constants
                                                            .FONT_FAMILY),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                width: Diamentions.screenWidth,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      ImagesHelper.PAYMENT_OPTIONS_BACKGROUND,
                                      fit: BoxFit.cover,
                                      width: Diamentions.screenWidth,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          title: "Pune to Alibag",
                                          fontSize: Diamentions.font16,
                                          fontWeight: FontWeight.bold,
                                          fontColor: ColorsHelper.blackColor,
                                        ),
                                        CustomText(
                                          title: "29-07-2021,11:00 am",
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        color: ColorsHelper.blackColor,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: Diamentions.width5),
                                          child: CustomText(
                                            title:
                                                "Get Flat 20%  Instant \n Discount on Booking",
                                            fontSize: Diamentions.font14,
                                            fontColor:
                                                ColorsHelper.lightGreyColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 0,
    this.dashWidth = 5,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = ColorsHelper.greyColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
