import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/widgets/text.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  Color fontColor;
  Color iconColor;
  CustomAppBar(
      {Key? key,
      required this.title,
      this.fontColor = ColorsHelper.primaryColor,
      this.iconColor = ColorsHelper.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            left: 10,
            top: 0,
            bottom: 0,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: iconColor,
                ))),
        Expanded(
          child: Center(
            child: CustomText(
              title: title,
              fontColor: fontColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
