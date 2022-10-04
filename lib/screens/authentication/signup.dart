import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/constants.dart';
import '../../utils/images_helper.dart';
import '../../utils/regex.dart';
import '../../widgets/appbar.dart';
import '../../widgets/rounded_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  FocusNode lastNameFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     _isObscureText = !_isObscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * .10,
              child: CustomAppBar(
                title: Constants.SIGN_UP,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      focusNode: firstNameFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Constants.FNAME_VALIDATION;
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsHelper.primaryColor)),
                          hintText: Constants.HINT_FNAME,
                          hintStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18)),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(lastNameFocusNode);
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      focusNode: lastNameFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Constants.LNAME_VALIDATION;
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsHelper.primaryColor)),
                          hintText: Constants.HINT_LNAME,
                          hintStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18)),
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(emailFocusNode);
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@') ||
                            !value.contains('.')) {
                          return Constants.EMAIL_VALIDATION;
                        }
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsHelper.primaryColor)),
                          hintText: Constants.HINT_EMAIL,
                          hintStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18)),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(passwordFocusNode);
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    TextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                      validator: (value) {
                        if ((value!.isEmpty) ||
                            (!Regex.password.hasMatch(value))) {
                          return Constants.PASSWORD_VALIDATION;
                        }
                      },
                      obscureText: _showPassword,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: _togglePasswordVisibility,
                            child: _showPassword
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                          ),
                          labelStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsHelper.primaryColor)),
                          hintText: Constants.HINT_PASSWORD,
                          hintStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18)),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(mobileFocusNode);
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    TextFormField(
                      focusNode: mobileFocusNode,
                      controller: mobileController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return Constants.MOBILE_NUMBER_VALIDATION;
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18),
                          prefixIcon: Text(
                            '+91 ',
                            style: TextStyle(
                                fontFamily: Constants.FONT_FAMILY,
                                fontSize: Diamentions.font18),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorsHelper.primaryColor)),
                          hintText: Constants.HINT_MOBILE_NUMBER,
                          hintStyle: TextStyle(
                              fontFamily: Constants.FONT_FAMILY,
                              fontSize: Diamentions.font18)),
                      onFieldSubmitted: (_) {
                        mobileFocusNode.unfocus();
                      },
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    RoundedButton(
                      onTap: signUpClicked,
                      title: Constants.REGISTER,
                      backgroundColor: ColorsHelper.primaryColor,
                      fontSize: Diamentions.font20,
                      fontColor: ColorsHelper.whiteColor,
                      borderRadius: 10,
                      isSuffix: true,
                    ),

                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: ColorsHelper.blackColor,
                              )),
                        ),
                        CustomText(
                          title: Constants.OR,
                          fontColor: ColorsHelper.blackColor,
                          fontSize: Diamentions.font18,
                        ),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: ColorsHelper.blackColor,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagesHelper.IMG_GOOGLE,
                          height: 70,
                          width: 70,
                        ),
                        SizedBox(
                          width: width * .10,
                        ),
                        Image.asset(
                          ImagesHelper.IMG_FB,
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                    // Positioned(
                    //     bottom: 0,
                    //     child: Container(
                    //       width: width,
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             width: width,
                    //             child: Image.asset(Constants.IMG_SIGNUP),
                    //           )
                    //         ],
                    //       ),
                    //     )),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              child: Column(
                children: [
                  Container(
                    width: width,
                    child: Image.asset(ImagesHelper.IMG_SIGNUP),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  signUpClicked() {
    if (_formKey.currentState!.validate()) {
      Get.toNamed("/permission");
    }
  }

  void _togglePasswordVisibility() {
    print("togglepasswordvisiblity");
    setState(() {
      print("set state called");
      _showPassword = !_showPassword;
    });
  }
}
