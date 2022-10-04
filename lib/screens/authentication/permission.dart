import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../widgets/rounded_button.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  height: height * .50,
                  child: Image.asset(
                    Constants.IMG_LOCATION,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: CustomText(
                    title: Constants.LOCATION_PERMISSION_TITLE,
                    fontSize: Diamentions.font25,
                    fontWeight: FontWeight.bold,
                    fontColor: ColorsHelper.blackColor,
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: CustomText(
                    title: Constants.LOCATION_PERMISSION_DESC,
                    fontSize: Diamentions.font18,
                    fontWeight: FontWeight.normal,
                    fontColor: ColorsHelper.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  SizedBox(
                    height: height * .01,
                  ),
                  RoundedButton(
                    fontSize: Diamentions.font20,
                    fontColor: ColorsHelper.whiteColor,
                    backgroundColor: ColorsHelper.primaryColor,
                    title: Constants.GO_TO_SETTINGS,
                    onTap: () {
                      Get.toNamed("/home");
                    },
                  )
                ],
              ))
        ],
      ),
    );
  }
}
