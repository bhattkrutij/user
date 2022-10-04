import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/screens/payments/payment_list.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/utils/images_helper.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: Stack(
        children: [
          Container(
            width: Diamentions.screenWidth,
            height: Diamentions.screenHeight,
            color: ColorsHelper.primaryColor,
            child: Image.asset(
              ImagesHelper.PAYMENT_OPTIONS_BACKGROUND,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: Diamentions.screenWidth * 0.10,
                  child: Image.asset(
                    ImagesHelper.PAYMENT_TOTAL_BACKGROUND,
                    width: Diamentions.screenWidth * 0.60,
                    height: Diamentions.screenWidth * 0.60,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: Diamentions.screenWidth * 0.27,
                  child: Container(
                    width: Diamentions.screenWidth * 0.25,
                    height: Diamentions.screenWidth * 0.25,
                    child: CircleAvatar(
                      child: CustomText(
                        title: "2980",
                        fontSize: Diamentions.font20,
                        fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                        fontWeight: FontWeight.bold,
                        fontColor: ColorsHelper.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            margin: EdgeInsets.only(top: Diamentions.screenHeight / 3),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Diamentions.width20,
                      vertical: Diamentions.width20),
                  child: CustomText(
                    title: Constants.SELECT_PAYMENT_MODE,
                    fontSize: Diamentions.font20,
                    fontWeight: FontWeight.bold,
                    fontColor: ColorsHelper.primaryColor,
                  ),
                ),
                Expanded(
                  child: PaymentList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: Diamentions.width300,
                        height: Diamentions.width50,
                        child: RoundedButton(
                          fontColor: ColorsHelper.whiteColor,
                          fontSize: Diamentions.font18,
                          onTap: () {
                            Get.toNamed('/paymentCompleted');
                          },
                          title: Constants.PAY,
                          borderRadius: 20,
                          backgroundColor: ColorsHelper.primaryColor,
                        ),
                      ),
                      Container(
                        width: Diamentions.screenWidth,
                        height: Diamentions.screenWidth * 0.20,
                        child: Image.asset(
                          ImagesHelper.PAYMENT_OPTIONS_BOTTOM,
                          width: Diamentions.screenWidth,
                          height: Diamentions.screenWidth * 0.60,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
