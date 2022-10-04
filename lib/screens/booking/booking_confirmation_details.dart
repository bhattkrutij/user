import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

class BookingConfirmationDetails extends StatefulWidget {
  const BookingConfirmationDetails({Key? key}) : super(key: key);

  @override
  State<BookingConfirmationDetails> createState() =>
      _BookingConfirmationDetailsState();
}

class _BookingConfirmationDetailsState
    extends State<BookingConfirmationDetails> {
  int _stackIndex = 0;

  String _singleValue = "Text alignment right";
  String _bookingConfirmGroupValue = "Booking";
  String _tripTypeGroupValue = "TripType";

  List<String> _booking_conftimation = ["E-Mail", "Phone", "Whats app"];
  List<String> _tripType = [
    "Personal",
    "Business",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: Diamentions.width15),
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
              child: Center(
                child: CustomText(
                  title: Constants.SEND_BOOKING_CONFIRM,
                  fontSize: Diamentions.font18,
                  fontColor: ColorsHelper.whiteColor,
                  fontFamily: Constants.FONT_FAMILY,
                ),
              ),
            ),
            Stack(
              children: [
                RadioGroup<String>.builder(
                  spacebetween: 0,
                  direction: Axis.horizontal,
                  groupValue: _bookingConfirmGroupValue,
                  activeColor: ColorsHelper.redColor,
                  horizontalAlignment: MainAxisAlignment.start,
                  onChanged: (value) => setState(() {
                    _bookingConfirmGroupValue = value!;
                  }),
                  items: _booking_conftimation,
                  textStyle: TextStyle(
                      fontFamily: Constants.FONT_FAMILY,
                      fontSize: Diamentions.font14,
                      color: ColorsHelper.greyColor),
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Diamentions.width15,
                  right: Diamentions.width15,
                  top: Diamentions.width10,
                  bottom: Diamentions.width10),
              child: CustomText(
                title: Constants.TRIP_TYPE,
                fontSize: Diamentions.font14,
                fontWeight: FontWeight.bold,
                fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                fontColor: ColorsHelper.blackColor,
              ),
            ),
            Stack(
              children: [
                RadioGroup<String>.builder(
                  spacebetween: 0,
                  direction: Axis.horizontal,
                  groupValue: _tripTypeGroupValue,
                  activeColor: ColorsHelper.redColor,
                  horizontalAlignment: MainAxisAlignment.start,
                  onChanged: (value) => setState(() {
                    _tripTypeGroupValue = value!;
                  }),
                  items: _tripType,
                  textStyle: TextStyle(
                      fontFamily: Constants.FONT_FAMILY,
                      fontSize: Diamentions.font14,
                      color: ColorsHelper.greyColor),
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Diamentions.width10,
            )
          ]),
        ));
  }
}
