import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../utils/Dimentions.dart';
import '../../widgets/appbar.dart';

class OTPScreen extends StatefulWidget {
  dynamic argumentsData = Get.arguments;
  OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState(argumentsData);
}

class _OTPScreenState extends State<OTPScreen> {
  dynamic argumentsData;
  var form_key = GlobalKey<FormState>();
  _OTPScreenState(this.argumentsData);
  TextEditingController textEditingController = TextEditingController();
  String strVerificationCode = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsHelper.whiteColor,
        body: Column(
          children: [
            Container(
              height: 70,
              child: CustomAppBar(
                title: Constants.OTP,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .05,
                    ),
                    CustomText(
                      title: Constants.OTP_TITLE,
                      fontColor: ColorsHelper.greyColor,
                      fontSize: Diamentions.font18,
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    CustomText(
                      title: "+91 " + argumentsData[0]['mobile_number'],
                      fontColor: ColorsHelper.blackColor,
                      fontSize: Diamentions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      child: Form(
                        key: form_key,
                        child: OtpTextField(
                          margin: EdgeInsets.only(
                              left: height * 0.008, right: height * 0.008),
                          filled: true,
                          cursorColor: ColorsHelper.blackColor,
                          textStyle: TextStyle(
                              color: ColorsHelper.blackColor,
                              fontSize: Diamentions.font18,
                              fontFamily: Constants.FONT_FAMILY),
                          fillColor: ColorsHelper.whiteColor,
                          numberOfFields: 6,
                          focusedBorderColor: ColorsHelper.primaryColor,
                          disabledBorderColor: ColorsHelper.whiteColor,
                          enabledBorderColor: ColorsHelper.whiteColor,
                          borderColor: ColorsHelper.primaryColor,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            setState(() {
                              strVerificationCode = verificationCode;
                              print(
                                  "veriification code  in onsubmit $strVerificationCode");
                            });
                          }, // end onSubmit
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Countdown(
                      seconds: 20,
                      build: (BuildContext context, double time) {
                        NumberFormat numberFormat =
                            NumberFormat("00.00", "en_US");

                        return CustomText(
                          title: Constants.RESEND_OTP +
                              " " +
                              numberFormat.format(time),
                          fontColor: ColorsHelper.blueColor,
                          fontSize: Diamentions.font18,
                          fontWeight: FontWeight.bold,
                        );
                      },
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        print('Timer is done!');
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    RoundedButton(
                      onTap: loginButtonClicked,
                      title: Constants.LOGIN,
                      backgroundColor: ColorsHelper.primaryColor,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.whiteColor,
                      borderRadius: 10,
                      isSuffix: true,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  loginButtonClicked() {
    {
      Get.toNamed("/permission");
    }
  }
}
