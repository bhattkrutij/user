import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiwni_user/utils/constants.dart';

class PaymentItem {
  // bool? isRadioButtonFill;
  IconData? icon;
  String? title;
  PaymentItem(
      { //required this.isRadioButtonFill,
      required this.icon,
      required this.title});
  factory PaymentItem.fromJson(Map<String, dynamic> json) {
    return PaymentItem(
      //   isRadioButtonFill: json['isRadioButtonFill'],
      icon: json['icon'],
      title: json['title'],
    );
  }
  // getIsRadioButton() {
  //   return isRadioButtonFill ?? false;
  // }

  getIcon() {
    return icon;
  }

  getTitle() {
    return title;
  }
}

// payement options
PaymentItem PaymentOptionItem1 = PaymentItem(
//    isRadioButtonFill: true,
    icon: FontAwesomeIcons.google,
    title: Constants.GPAY);
PaymentItem PaymentOptionItem2 = PaymentItem(
    //  isRadioButtonFill: false,
    icon: FontAwesomeIcons.ccMastercard,
    title: Constants.ADD_UPI_ID);
PaymentItem PaymentOptionItem3 = PaymentItem(
    //  isRadioButtonFill: false,
    icon: FontAwesomeIcons.creditCard,
    title: Constants.CREDIT_CARD);
PaymentItem PaymentOptionItem4 = PaymentItem(
    //  isRadioButtonFill: false,
    icon: FontAwesomeIcons.creditCard,
    title: Constants.DEBIT_CARD);
PaymentItem PaymentOptionItem5 = PaymentItem(
    //  isRadioButtonFill: false,
    icon: FontAwesomeIcons.bank,
    title: Constants.NET_BANKING);

PaymentItem PaymentOptionItem6 = PaymentItem(
    //  isRadioButtonFill: false,
    icon: FontAwesomeIcons.wallet,
    title: Constants.WALLETS);
PaymentItem PaymentOptionItem7 = PaymentItem(
    //   isRadioButtonFill: false,
    icon: FontAwesomeIcons.gift,
    title: Constants.GIFT_VOUCHER);
PaymentItem PaymentOptionItem8 = PaymentItem(
    // isRadioButtonFill: false,
    icon: FontAwesomeIcons.amazonPay,
    title: Constants.AMAZON_PAY);
PaymentItem PaymentOptionItem9 = PaymentItem(
    //isRadioButtonFill: false,
    icon: FontAwesomeIcons.moneyBill,
    title: Constants.CASH);

List<PaymentItem> paymentOptionsItems = [
  PaymentOptionItem1,
  PaymentOptionItem2,
  PaymentOptionItem3,
  PaymentOptionItem4,
  PaymentOptionItem5,
  PaymentOptionItem6,
  PaymentOptionItem7,
  PaymentOptionItem8,
  PaymentOptionItem9
];
