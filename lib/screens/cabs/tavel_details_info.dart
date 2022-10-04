import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images_helper.dart';
import '../../widgets/text.dart';
import '../home/home/calender_view.dart';

class TravelDetailsInfo extends StatefulWidget {
  const TravelDetailsInfo({Key? key}) : super(key: key);

  @override
  State<TravelDetailsInfo> createState() => _TravelDetailsInfoState();
}

class _TravelDetailsInfoState extends State<TravelDetailsInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: Colors.grey[400]!,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Card(
          elevation: 8,
          shadowColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: CustomText(
                      title: "Pune- Mumbai",
                      fontSize: Diamentions.font16,
                      fontWeight: FontWeight.bold,
                      fontColor: ColorsHelper.blackColor,
                      fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: CalenderRow(
                                title: "Fri,24 Dec-Mon,27 Dec",
                                fontSize: Diamentions.font12,
                                fontWeight: FontWeight.bold,
                                fontColor: ColorsHelper.greyColor,
                                leadingIcon: ImagesHelper.IMG_CALENDER,
                                onTap: () {},
                                padding: 2,
                                leadingIconSize: width * 0.05,
                              ),
                            )),
                        Flexible(
                            flex: 2,
                            child: Container(
                              child: CalenderRow(
                                title: "07:00 PM",
                                fontSize: Diamentions.font12,
                                fontWeight: FontWeight.bold,
                                fontColor: ColorsHelper.greyColor,
                                leadingIcon: ImagesHelper.IMG_CLOCK,
                                onTap: () {},
                                padding: 2,
                                leadingIconSize: width * 0.05,
                              ),
                            )),
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: CalenderRow(
                              title: "Est kms 211km",
                              fontSize: Diamentions.font12,
                              fontWeight: FontWeight.bold,
                              fontColor: ColorsHelper.greyColor,
                              leadingIcon: ImagesHelper.IMG_EST_KM,
                              onTap: () {},
                              padding: 2,
                              leadingIconSize: width * 0.03,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
