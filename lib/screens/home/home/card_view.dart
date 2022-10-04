import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../providers/pickup_provider.dart';
import '../../../utils/Dimentions.dart';
import '../../../utils/colors.dart';
import '../../../utils/images_helper.dart';
import '../../../widgets/text.dart';

class CardViewWidget extends StatefulWidget {
  const CardViewWidget({Key? key}) : super(key: key);

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  // var pickupProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pickupProvider = context.read(
    //   pickupLocationProvider,
    // );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, watch, _) {
        var model = watch(pickupProvider);
        print("KRUIT:: in build${model.formattedAddress}");
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD6D6D6),
                blurRadius: 20.0,
              ),
            ],
          ),
          child: Card(
            shadowColor: Colors.grey[2],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 8.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 20.0),
                  child: Row(
                    children: [
                      Image.asset(ImagesHelper.IMG_SOURCE),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/search');
                              },
                              child: CustomText(
                                title: model.formattedCityState,
                                fontSize: Diamentions.font18,
                                fontColor: ColorsHelper.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * .005,
                            ),
                            if (model.formattedCityState.isNotEmpty)
                              CustomText(
                                title: model.formattedAddress,
                                fontSize: Diamentions.font16,
                                fontColor: ColorsHelper.greyColor,
                                fontWeight: FontWeight.bold,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 20.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Image.asset(ImagesHelper.IMG_DESTINATION),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: "Drop Location",
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: height * .005,
                            ),
                            CustomText(
                              title: "The spire2",
                              fontSize: Diamentions.font16,
                              fontColor: ColorsHelper.greyColor,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: height * .005,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
