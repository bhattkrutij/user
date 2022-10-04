import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/screens/booking/advance_payment_details.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/colors.dart';
import '../../utils/images_helper.dart';
import '../../widgets/rounded_button.dart';
import '../cabs/tavel_details_info.dart';
import 'billing_details.dart';
import 'booking_confirmation_details.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Diamentions.width10, vertical: Diamentions.width10),
        child: Column(
          children: [
            Container(
              width: Diamentions.screenWidth,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: Diamentions.screenHeight * 0.03,
                        color: ColorsHelper.primaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                    left: Diamentions.screenHeight * 0.03,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: CustomText(
                          title: Constants.BOOKING_DETAILS,
                          fontColor: ColorsHelper.primaryColor,
                          fontSize: Diamentions.font18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          ImagesHelper.IMG_CALL,
                          height: Diamentions.iconSize24,
                          width: Diamentions.iconSize24,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      ImagesHelper.IMG_CAR1,
                      width: Diamentions.screenWidth,
                      height: Diamentions.screenHeight * 0.25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Diamentions.width20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              title: "Audi  Q7",
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                              fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomText(
                              title: "Ultraluxury",
                              fontSize: Diamentions.font16,
                              fontColor: ColorsHelper.greyColor,
                              fontFamily: Constants.FONT_FAMILY,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Expanded(
                              flex: 3,
                              child: CustomText(
                                title: "`7654",
                                fontSize: Diamentions.font20,
                                fontColor: ColorsHelper.blackColor,
                                fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Diamentions.width5),
                      child: Row(
                        children: [
                          RatingBar(
                            isHalfAllowed: true,
                            size: Diamentions.screenWidth * 0.04,
                            alignment: Alignment.centerLeft,
                            filledIcon: Icons.star,
                            halfFilledIcon: Icons.star_half,
                            emptyIcon: Icons.star_border_outlined,
                            emptyColor: Colors.amber,
                            halfFilledColor: Colors.amber,
                            initialRating: 2.5,
                            maxRating: 5,
                            onRatingChanged: (double) {},
                          ),
                          SizedBox(
                            width: Diamentions.width10,
                          ),
                          CustomText(
                            title: "Review",
                            fontSize: Diamentions.font14,
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontColor: ColorsHelper.greyColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Diamentions.width5),
                      child: Row(
                        children: [
                          CustomText(
                            title: "Girkand Travel",
                            fontSize: Diamentions.font14,
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            width: Diamentions.width10,
                          ),
                          CustomText(
                            title: "Giri5008",
                            fontSize: Diamentions.font12,
                            fontColor: ColorsHelper.blueColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                    TravelDetailsInfo(),
                    BookingConfirmationDetails(),
                    Padding(
                      padding: EdgeInsets.only(top: Diamentions.width15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: Diamentions.screenHeight * 0.05,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Diamentions.radius4),
                                  border: Border.all(
                                      color: ColorsHelper.greyColor, width: 1)),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Diamentions.width10),
                                  child: CustomText(
                                    title: "KIWNI 20%",
                                    fontSize: Diamentions.font14,
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontColor: ColorsHelper.greyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  height: Diamentions.screenHeight * 0.05,
                                  child: RoundedButton(
                                    onTap: () {},
                                    title: Constants.APPLY,
                                    borderRadius: 4,
                                    fontColor: ColorsHelper.whiteColor,
                                    backgroundColor: ColorsHelper.primaryColor,
                                    fontSize: Diamentions.font16,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    BillingDetails(),
                    AdvancePaymentDetails()
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Diamentions.width10),
              child: RoundedButton(
                onTap: () {
                  Get.toNamed("/paymentOptions");
                },
                title: Constants.CONFIRM,
                isSuffix: true,
                suffixIcon: Icons.arrow_forward,
                fontSize: Diamentions.font20,
                fontColor: ColorsHelper.whiteColor,
                borderRadius: 10,
                backgroundColor: ColorsHelper.primaryColor,
              ),
            )
          ],
        ),
      )),
    );
  }
}
