import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/images_helper.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/constants.dart';
import '../drawer_header.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: customDrawerPage(
        title: Constants.PAYMENT,
        child: PaymentContent(),
      ),
    ));
  }
}

class PaymentContent extends StatelessWidget {
  const PaymentContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: Diamentions.width20,
            left: Diamentions.width5,
            right: Diamentions.width5),
        child: ListView.builder(
            itemCount: paymentMethodItems.length,
            itemBuilder: (context, index) {
              PaymentMethodItem item = paymentMethodItems[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Diamentions.width10,
                    vertical: Diamentions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: item.getHeader(),
                      fontSize: Diamentions.font20,
                      fontWeight: FontWeight.bold,
                      fontColor: ColorsHelper.blackColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Diamentions.width10),
                      child: Card(
                        elevation: 4,
                        shadowColor: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.all(Diamentions.width10),
                          child: Container(
                            width: Diamentions.screenWidth,
                            child: Padding(
                              padding: EdgeInsets.all(Diamentions.width10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item.getLeadingIcon(),
                                    width: Diamentions.width20,
                                    height: Diamentions.width20,
                                  ),
                                  SizedBox(
                                    width: Diamentions.width20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          title: item.getTitle(),
                                          fontWeight: FontWeight.bold,
                                          fontColor: ColorsHelper.blackColor,
                                          fontSize: Diamentions.font18),
                                      if (index != 0)
                                        CustomText(
                                            title: item.getDesc(),
                                            fontWeight: FontWeight.bold,
                                            fontColor: ColorsHelper.greyColor,
                                            fontSize: Diamentions.font18)
                                    ],
                                  )),
                                  if (index != 0)
                                    Image.asset(
                                      item.getLeadingIcon(),
                                      width: Diamentions.width20,
                                      height: Diamentions.width20,
                                    ),
                                ],
                              ),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class PaymentMethodItem {
  String? header;
  String? title;
  String? desc;
  String? leadingIcon;
  String? actionIcon;

  PaymentMethodItem(
      {required this.header,
      required this.title,
      this.desc = "",
      this.leadingIcon = ImagesHelper.IMG_AC,
      this.actionIcon = ImagesHelper.IMG_AC});

  getHeader() {
    return header ?? '';
  }

  getTitle() {
    return title ?? '';
  }

  getDesc() {
    return desc ?? '';
  }

  getLeadingIcon() {
    return leadingIcon ?? '';
  }

  getActionIcon() {
    return actionIcon ?? '';
  }
}

PaymentMethodItem item1 = PaymentMethodItem(
    header: Constants.DEFAULT_PAYMENT, title: Constants.CASH, desc: "");
PaymentMethodItem item2 = PaymentMethodItem(
    header: Constants.CARD,
    title: Constants.ADD_CARD,
    desc: Constants.SAVE_AND_PAY_CARD);
PaymentMethodItem item3 = PaymentMethodItem(
    header: Constants.WALLETS,
    title: Constants.ADD_WALLETS,
    desc: Constants.SAVE_AND_PAY_WALLET);
List<PaymentMethodItem> paymentMethodItems = [item1, item2, item3];
