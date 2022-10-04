import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/constants.dart';

import '../utils/colors.dart';

class CustomText extends StatelessWidget {
  String title;
  Color fontColor;
  FontWeight fontWeight;
  double? fontSize;
  String fontFamily;

  CustomText(
      {Key? key,
      required this.title,
      this.fontWeight = FontWeight.normal,
      this.fontColor = ColorsHelper.whiteColor,
      required this.fontSize,
      this.fontFamily = Constants.FONT_FAMILY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          overflow: TextOverflow.ellipsis,
          fontFamily: fontFamily),
    );
  }
}
