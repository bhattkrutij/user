import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class AdvancePaymentDetails extends StatefulWidget {
  const AdvancePaymentDetails({Key? key}) : super(key: key);

  @override
  State<AdvancePaymentDetails> createState() => _AdvancePaymentDetailsState();
}

class _AdvancePaymentDetailsState extends State<AdvancePaymentDetails> {
  String _advPaymentValue = "Booking";
  List<String> _advancePaymentGrpValue = [
    Constants.PAYADV30,
    Constants.PAYADV50,
    Constants.PAYADV100
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Diamentions.width20),
      child: Container(
        width: Diamentions.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Diamentions.radius4),
            border: Border.all(color: ColorsHelper.greyColor, width: 1)),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: RadioGroup<String>.builder(
                spacebetween: Diamentions.width40,
                direction: Axis.vertical,
                groupValue: _advPaymentValue,
                activeColor: ColorsHelper.primaryColor,
                horizontalAlignment: MainAxisAlignment.start,
                onChanged: (value) => setState(() {
                  _advPaymentValue = value!;
                }),
                items: _advancePaymentGrpValue,
                textStyle: TextStyle(
                    fontFamily: Constants.FONT_FAMILY,
                    fontSize: Diamentions.font16,
                    color: ColorsHelper.blackColor),
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(Diamentions.width10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomText(
                            title: "2595/-",
                            fontSize: Diamentions.font16,
                            fontFamily: Constants.FONT_FAMILY,
                            fontColor: ColorsHelper.blackColor),
                        SizedBox(
                          height: Diamentions.width20,
                        ),
                        CustomText(
                            title: "4325/-",
                            fontSize: Diamentions.font16,
                            fontFamily: Constants.FONT_FAMILY,
                            fontColor: ColorsHelper.blackColor),
                        SizedBox(
                          height: Diamentions.width20,
                        ),
                        CustomText(
                            title: "8235/-",
                            fontSize: Diamentions.font16,
                            fontFamily: Constants.FONT_FAMILY,
                            fontColor: ColorsHelper.blackColor)
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
