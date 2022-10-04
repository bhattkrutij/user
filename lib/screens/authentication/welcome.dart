import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/images_helper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    ImagesHelper.IMG_TITLE,
                    width: width * .30,
                    height: height * .30,
                  ),
                ),
                Container(
                  child: Image.asset(
                    ImagesHelper.IMG_LOGO,
                    width: width * .50,
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                CustomText(
                  title: Constants.WELCOME_TITLE,
                  fontSize: Diamentions.font25,
                ),
                SizedBox(
                  height: 50,
                ),
                RoundedButton(
                  fontSize: Diamentions.font18,
                  title: Constants.SIGN_UP,
                  onTap: () {
                    Get.toNamed('/signUp');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                  fontSize: Diamentions.font18,
                  title: Constants.SIGN_IN,
                  onTap: () {
                    Get.toNamed('/signIn');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
