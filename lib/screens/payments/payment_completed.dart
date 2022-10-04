import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/images_helper.dart';

class PaymentCompleted extends StatefulWidget {
  const PaymentCompleted({Key? key}) : super(key: key);

  @override
  State<PaymentCompleted> createState() => _PaymentCompletedState();
}

class _PaymentCompletedState extends State<PaymentCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsHelper.lightGreenColor,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: Diamentions.width90,
              child: Image.asset(
                ImagesHelper.DOT,
                width: Diamentions.screenWidth,
                height: 100,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: Diamentions.width50,
              child: Image.asset(
                ImagesHelper.IMG_HOME_SCREEN_BG_STAR,
                width: Diamentions.screenWidth,
                height: 100,
              ),
            ),
            Positioned(
              right: 0,
              left: Diamentions.width15,
              top: Diamentions.screenWidth / 3,
              child: Center(
                child: CustomText(
                  title: Constants.THANK_YOU,
                  fontSize: Diamentions.font50,
                  fontColor: ColorsHelper.darkBlueColor,
                  fontFamily: Constants.FONT_FAMILY,
                ),
              ),
            ),
            Container(
              width: Diamentions.screenWidth,
              height: Diamentions.screenHeight,
              margin: EdgeInsets.only(top: Diamentions.screenHeight / 3.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Diamentions.width15,
                  vertical: Diamentions.width50,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                          title: Constants.BOOKING_NO + " K012",
                          fontSize: Diamentions.font20,
                          fontColor: ColorsHelper.blackColor,
                          fontFamily: Constants.FONT_FAMILY,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: Constants.KRN_NO + "KIWNI234",
                          fontSize: Diamentions.font20,
                          fontColor: ColorsHelper.blackColor,
                          fontFamily: Constants.FONT_FAMILY,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Diamentions.width15,
                    ),
                    Divider(
                      color: ColorsHelper.greyColor,
                      thickness: 2,
                      height: 2,
                    ),
                    SizedBox(
                      height: Diamentions.width20,
                    ),
                    Center(
                      child: CustomText(
                        title: Constants.THANK_YOU_INFO,
                        fontSize: Diamentions.font18,
                        fontColor: ColorsHelper.greyColor,
                        fontFamily: Constants.FONT_FAMILY,
                      ),
                    ),
                    SizedBox(
                      height: Diamentions.width50,
                    ),
                    Container(
                      width: Diamentions.width200,
                      height: Diamentions.width40,
                      child: RoundedButton(
                        fontColor: ColorsHelper.whiteColor,
                        fontSize: Diamentions.font20,
                        onTap: () {},
                        title: Constants.OK,
                        borderRadius: 20,
                        backgroundColor: ColorsHelper.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: Diamentions.screenWidth,
                height: Diamentions.screenHeight / 3,
                child: Image.asset(
                  ImagesHelper.PAYMENT_COMPLETED_BOTTOM,
                  width: Diamentions.screenWidth,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
