import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  Color fontColor;
  final double fontSize;
  FontWeight fontWeight;
  Color backgroundColor;
  Color borderColor;
  double borderRadius;
  String title;
  final VoidCallback onTap;
  bool isSuffix;
  IconData suffixIcon;

  RoundedButton({
    Key? key,
    this.fontColor = ColorsHelper.blackColor,
    this.fontWeight = FontWeight.bold,
    required this.fontSize,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderRadius = 40,
    required this.onTap,
    required this.title,
    this.isSuffix = false,
    this.suffixIcon = Icons.arrow_forward_ios_outlined,
  }) : super(key: key);
  // bo: BoxDecoration(
  // color: backgroundColor,
  // borderRadius: BorderRadius.circular(borderRadius),
  // border: Border.all(color: borderColor, width: 1),
  // ),

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * .07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: backgroundColor,
                width: 2.0,
                style: BorderStyle.solid), //set border for the button
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          onPrimary: backgroundColor,
        ),
        onPressed: onTap,
        child: Stack(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: fontWeight,
                    fontSize: Diamentions.font16,
                    color: fontColor,
                    fontFamily: Constants.FONT_FAMILY),
              ),
            ),
            isSuffix
                ? Align(
                    alignment: Alignment.centerRight,
                    child: suffixIcon != null
                        ? Icon(
                            suffixIcon,
                            size: height * .04,
                          )
                        : CircleAvatar(
                            backgroundColor: ColorsHelper.whiteColor,
                            child: Icon(
                              suffixIcon,
                              size: height * .03,
                              color: ColorsHelper.primaryColor,
                            )),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
