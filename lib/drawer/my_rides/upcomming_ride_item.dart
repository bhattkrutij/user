import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images_helper.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/text.dart';

class UpcomingRideItem extends StatefulWidget {
  const UpcomingRideItem({Key? key}) : super(key: key);

  @override
  State<UpcomingRideItem> createState() => _UpcomingRideItemState();
}

class _UpcomingRideItemState extends State<UpcomingRideItem> {
  List<Model> list = [];
  @override
  void initState() {
    super.initState();
    list.add(Model("Spain plaza,choudhri wasti,pune,maharasta...", Colors.red));
    list.add(Model("Lane 3 Link road,Navi mumbai,Maharastra", Colors.green));
    list.add(
        Model("Spain plaza,choudhri wasti,pune,maharasta...", Colors.green));
  }

  void addNew() {
    setState(() {
      list.add(Model("Karnool", Colors.black));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: Diamentions.screenWidth,
          decoration: BoxDecoration(
            border: Border.all(color: ColorsHelper.greyColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                color: ColorsHelper.lightGreenColor,
                child: Column(
                  children: [
                    Container(
                        color: ColorsHelper.lightGreenColor,
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (con, ind) {
                                return ind != 0
                                    ? Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Row(children: [
                                              Column(
                                                children: List.generate(
                                                  3,
                                                  (ii) => Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          top: 2,
                                                          bottom: 2),
                                                      child: Container(
                                                        height: 3,
                                                        width: 2,
                                                        color: Colors.grey,
                                                      )),
                                                ),
                                              ),
                                            ]),
                                            Row(children: [
                                              Icon(
                                                Icons.circle,
                                                color: list[ind].color,
                                                size: Diamentions.width20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          Diamentions.width10),
                                                  child: Text(list[ind].address,
                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: Colors.black,
                                                          fontSize: Diamentions
                                                              .font16)),
                                                ),
                                              )
                                            ])
                                          ])
                                    : Row(children: [
                                        Icon(
                                          Icons.circle,
                                          color: list[ind].color,
                                          size: Diamentions.width20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: Diamentions.width10),
                                          child: Text(list[ind].address,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      Diamentions.font16)),
                                        )
                                      ]);
                              }),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: Diamentions.width15),
                      child: Row(
                        children: [
                          Image.asset(
                            ImagesHelper.IMG_CALENDER,
                            width: Diamentions.width30,
                            height: Diamentions.width30,
                          ),
                          SizedBox(
                            width: Diamentions.width10,
                          ),
                          CustomText(
                            title: "Fir,24 Dec -Mon,27 Dec",
                            fontColor: ColorsHelper.blackColor,
                            fontSize: Diamentions.font16,
                          ),
                          SizedBox(
                            width: Diamentions.width5,
                          ),
                          Image.asset(
                            ImagesHelper.IMG_CLOCK,
                            width: Diamentions.width30,
                            height: Diamentions.width30,
                          ),
                          SizedBox(
                            width: Diamentions.width5,
                          ),
                          CustomText(
                            title: "7:00 PM",
                            fontColor: ColorsHelper.blackColor,
                            fontSize: Diamentions.font16,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Diamentions.width50),
                      child: Row(
                        children: [
                          CustomText(
                            title: "Service Type",
                            fontColor: ColorsHelper.blackColor,
                            fontSize: Diamentions.font16,
                          ),
                          SizedBox(
                            width: Diamentions.width5,
                          ),
                          CustomText(
                            title: "OutStation",
                            fontColor: ColorsHelper.blackColor,
                            fontSize: Diamentions.font16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Divider(
                      height: 1,
                      color: ColorsHelper.greyColor,
                    ),
                    SizedBox(
                      height: Diamentions.width5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Diamentions.width5),
                      child: Container(
                        width: Diamentions.screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              title: Constants.BOOKING_NO + " K012",
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                              fontFamily: Constants.FONT_FAMILY,
                            ),
                            CustomText(
                              title: Constants.KRN_NO + "KIWNI234",
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                              fontFamily: Constants.FONT_FAMILY,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // cab details layout
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: Diamentions.width30),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                          title: "Mahindra vertio :",
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                          fontFamily: Constants.FONT_FAMILY,
                                        ),
                                        SizedBox(
                                          width: Diamentions.width10,
                                        ),
                                        CustomText(
                                          title: "Luxury",
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                          fontFamily: Constants.FONT_FAMILY,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: Diamentions.width5,),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.call,
                                          size: Diamentions.width15,
                                        ),
                                        SizedBox(
                                          width: Diamentions.width5,
                                        ),
                                        CustomText(
                                          title: "992576233693",
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                          fontFamily: Constants.FONT_FAMILY,
                                        ),
                                        SizedBox(
                                          width: Diamentions.width10,
                                        ),
                                        CustomText(
                                          title: "MH 12 JE2329",
                                          fontSize: Diamentions.font16,
                                          fontColor: ColorsHelper.blackColor,
                                          fontFamily: Constants.FONT_FAMILY,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: Diamentions.width10,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          title: "Otp 23456",
                                          fontSize: Diamentions.font18,
                                          fontColor: ColorsHelper.blackColor,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: Diamentions.width5),
                                height: Diamentions.width50,
                                width: Diamentions.width50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: ColorsHelper.blackColor,
                                    border: Border.all(width: 1)),
                                child: CircleAvatar(
                                  backgroundColor: ColorsHelper.whiteColor,
                                  radius: 8,
                                  child: Image.asset(
                                    ImagesHelper.IMG_PERSON,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Diamentions.width5,
                              ),
                              CustomText(
                                title: "Kiran",
                                fontSize: Diamentions.font18,
                                fontColor: ColorsHelper.blackColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Diamentions.width30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: Diamentions.width140,
                                child: RoundedButton(
                                  onTap: () {},
                                  backgroundColor: ColorsHelper.primaryColor,
                                  fontColor: ColorsHelper.whiteColor,
                                  borderRadius: 8,
                                  title: Constants.CANCEL_RIDE,
                                  fontSize: Diamentions.font18,
                                )),
                            SizedBox(
                              width: Diamentions.width10,
                            ),
                            Container(
                              width: Diamentions.width140,
                              child: RoundedButton(
                                onTap: () {},
                                backgroundColor: ColorsHelper.primaryColor,
                                fontColor: ColorsHelper.whiteColor,
                                borderRadius: 8,
                                title: Constants.TRACK_DRIVER,
                                fontSize: Diamentions.font18,
                              ),
                            ),
                            SizedBox(
                              height: Diamentions.width10,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class Model {
  String address;
  double? lat;
  double? long;
  Color? color;
  //Other fields if needed....
  Model(this.address, this.color);
//initialise other fields so on....
}
