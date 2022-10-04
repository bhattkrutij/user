import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';

import '../../utils/constants.dart';
import '../../utils/images_helper.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _form_key = GlobalKey<FormState>();
  final TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsHelper.primaryColor,
          body: Container(
            width: width,
            height: height,
            child: Stack(
              children: [
                Container(
                  height: height * .45,
                  width: double.infinity,
                  child: Image.asset(
                    ImagesHelper.IMG_LOGIN_BACKGORUND,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: width * .05,
                    top: height * .35,
                    child: CustomText(
                      title: Constants.SIGNIN_TO_CONTINUE,
                      fontWeight: FontWeight.bold,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.blackColor,
                    )),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: height * .52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Form(
                        key: _form_key,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: height,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                        controller: mobileNumberController,
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 10) {
                                            return Constants
                                                .MOBILE_NUMBER_VALIDATION;
                                          } else {
                                            return null;
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            labelStyle: TextStyle(
                                                fontFamily:
                                                    Constants.FONT_FAMILY,
                                                fontSize: Diamentions.font20),
                                            prefixIcon: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  '+91 ',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Constants.FONT_FAMILY,
                                                      fontSize:
                                                          Diamentions.font20),
                                                )),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: ColorsHelper
                                                        .primaryColor)),
                                            hintText:
                                                Constants.HINT_MOBILE_NUMBER,
                                            hintStyle: TextStyle(
                                                fontFamily:
                                                    Constants.FONT_FAMILY,
                                                fontSize: Diamentions.font20)),
                                      ),
                                      SizedBox(
                                        height: height * .05,
                                      ),
                                      RoundedButton(
                                        onTap: signInClicked,
                                        title: Constants.SIGN_IN,
                                        backgroundColor:
                                            ColorsHelper.primaryColor,
                                        fontSize: Diamentions.font20,
                                        fontColor: ColorsHelper.whiteColor,
                                        borderRadius: 10,
                                        isSuffix: true,
                                      ),
                                      SizedBox(
                                        height: height * .05,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: CustomText(
                                          title: Constants.FORGOT_PASSWORD,
                                          fontWeight: FontWeight.bold,
                                          fontColor: ColorsHelper.blackColor,
                                          fontSize: Diamentions.font18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  signInClicked() {
    if (_form_key.currentState!.validate()) {
      Get.toNamed('/otp', arguments: [
        {"mobile_number": mobileNumberController.text},
      ]);
    }
  }
}
