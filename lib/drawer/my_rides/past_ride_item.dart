import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/drawer/my_rides/upcomming_ride_item.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';

class PastRideItem extends StatefulWidget {
  const PastRideItem({Key? key}) : super(key: key);

  @override
  State<PastRideItem> createState() => _PastRideItemState();
}

class _PastRideItemState extends State<PastRideItem> {
  List<Model> list = [];
  @override
  void initState() {
    super.initState();
    list.add(Model("Lan no 2 ,Link Road ,Mumbai 420110", Colors.red));
    list.add(Model("SrNo.12,House 15,Crystal Plazz....", Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Diamentions.width10, vertical: Diamentions.width10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: "5-07-2021 on 6 am",
                    fontSize: Diamentions.font18,
                    fontColor: ColorsHelper.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    title: "RS 1500/-",
                    fontSize: Diamentions.font18,
                    fontColor: ColorsHelper.blackColor,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
              SizedBox(height: Diamentions.width5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
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
                                                          padding:
                                                              EdgeInsets.only(
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
                                                    padding: EdgeInsets.only(
                                                        left: Diamentions
                                                            .width10),
                                                    child: Text(
                                                        list[ind].address,
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.black,
                                                            fontSize:
                                                                Diamentions
                                                                    .font16)),
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.black,
                                                      fontSize:
                                                          Diamentions.font16)),
                                            )
                                          ]);
                                  }),
                            )),
                        SizedBox(
                          height: Diamentions.width10,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: "One way Trip ",
                              fontSize: Diamentions.font16,
                              fontColor: ColorsHelper.blackColor,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.grey,
                            Colors.grey,
                            Colors.grey,
                            Colors.grey
                          ]),
                          shape: BoxShape.circle),
                      child: Padding(
                        //this padding will be you border size
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            foregroundImage: NetworkImage(
                                "https://i.ibb.co/rkG8cCs/112921315-gettyimages-876284806.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
          color: ColorsHelper.greyColor,
        )
      ],
    );
  }
}
