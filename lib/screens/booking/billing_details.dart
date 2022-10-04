import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../models/bill_details.dart';
import '../../utils/colors.dart';

class BillingDetails extends StatefulWidget {
  const BillingDetails({Key? key}) : super(key: key);

  @override
  State<BillingDetails> createState() => _BillingDetailsState();
}

class _BillingDetailsState extends State<BillingDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: Diamentions.width20),
        child: Container(
          width: Diamentions.screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Diamentions.radius4),
              border: Border.all(color: ColorsHelper.greyColor, width: 1)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Diamentions.radius4),
                      topLeft: Radius.circular(Diamentions.radius4)),
                  color: ColorsHelper.primaryColor),
              width: Diamentions.screenWidth,
              height: Diamentions.width30,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: Constants.BILLING_DETAILS,
                    fontSize: Diamentions.font16,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Diamentions.width5),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: billItems.length,
                        itemBuilder: (context, index) {
                          BillItem item = billItems[index];
                          print("JKJKJ ::${item.getName()}");
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    title: item.getName(),
                                    fontSize: Diamentions.font16,
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontColor: ColorsHelper.greyColor,
                                  ),
                                  CustomText(
                                      title: item.getValue().toString(),
                                      fontSize: Diamentions.font16,
                                      fontFamily: Constants.FONT_FAMILY,
                                      fontColor: ColorsHelper.greyColor)
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Divider(
                    color: ColorsHelper.greyColor,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Diamentions.width5),
                        child: CustomText(
                          title: Constants.TOTAL,
                          fontSize: Diamentions.font18,
                          fontFamily: Constants.FONT_FAMILY,
                          fontColor: ColorsHelper.blackColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Diamentions.width5),
                        child: CustomText(
                            title: "8234/-",
                            fontSize: Diamentions.font18,
                            fontFamily: Constants.FONT_FAMILY,
                            fontColor: ColorsHelper.blackColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
