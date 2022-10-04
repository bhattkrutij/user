import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/rounded_button.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/images_helper.dart';

class CabItem extends StatefulWidget {
  const CabItem({Key? key}) : super(key: key);

  @override
  State<CabItem> createState() => _CabItemState();
}

class _CabItemState extends State<CabItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFD6D6D6),
              blurRadius: 10.0,
            )
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          color: Colors.white,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Hyundai EON",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontSize: Diamentions.font16,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          CustomText(
                            title: "Premium",
                            fontFamily: Constants.FONT_FAMILY,
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          CustomText(
                            title: "` 1844",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontSize: Diamentions.font16,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          CustomText(
                            title: "Trimurti Travel",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontSize: Diamentions.font16,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.blackColor,
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          CustomText(
                            title: "TRI5068",
                            fontFamily: Constants.FONT_FAMILY,
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.blueColor,
                          ),
                          SizedBox(
                            height: height * 0.005,
                          ),
                          RatingBar(
                            isHalfAllowed: true,
                            size: width * 0.04,
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
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: width,
                              height: height * 0.15,
                              child: Image.asset(
                                ImagesHelper.IMG_CAR1,
                                width: height * 0.02,
                                height: height * 0.02,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "Review",
                      fontFamily: Constants.FONT_FAMILY,
                      fontSize: Diamentions.font16,
                      fontColor: ColorsHelper.greyColor,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            ImagesHelper.IMG_AC,
                            width: height * 0.02,
                            height: height * 0.02,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          CustomText(
                            title: "AC",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontSize: Diamentions.font16,
                            fontWeight: FontWeight.bold,
                            fontColor: ColorsHelper.greyColor,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: VerticalDivider(
                              thickness: 1,
                              color: ColorsHelper.primaryColor,
                            ),
                          ),
                          Image.asset(
                            ImagesHelper.IMG_PERSON,
                            width: height * 0.02,
                            height: height * 0.02,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          CustomText(
                            title: "4 +1  Seater",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontWeight: FontWeight.bold,
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.greyColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: VerticalDivider(
                              thickness: 1,
                              color: ColorsHelper.primaryColor,
                            ),
                          ),
                          Image.asset(
                            ImagesHelper.IMG_BAG,
                            width: height * 0.02,
                            height: height * 0.02,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          CustomText(
                            title: "3 Bags",
                            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                            fontWeight: FontWeight.bold,
                            fontSize: Diamentions.font16,
                            fontColor: ColorsHelper.greyColor,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  height: height * 0.04,
                                  child: RoundedButton(
                                    onTap: () {
                                      Get.toNamed("/bookingDetails");
                                    },
                                    title: Constants.BOOK,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
