import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/widgets/text.dart';

class SelectPackage extends StatefulWidget {
  const SelectPackage({Key? key}) : super(key: key);

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  int selectedIndex = 0;
  PackageModel selectedPackageModel = packageModelList[0];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            fontSize: Diamentions.font16,
            title: Constants.SELECT_PACKAGE,
            fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
            fontColor: ColorsHelper.blackColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Container(
              height: height * .08,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: packageModelList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    PackageModel item = packageModelList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          right: 6.0, top: 0.8, bottom: 0.8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            selectedPackageModel = packageModelList[index];
                          });
                        },
                        child: Container(
                          width: width * .15,
                          height: height * .08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: ColorsHelper.primaryColor, width: 1),
                              color: selectedIndex == index
                                  ? ColorsHelper.primaryColor
                                  : ColorsHelper.whiteColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                title: item.getHrs(),
                                fontSize: Diamentions.font18,
                                fontWeight: FontWeight.bold,
                                fontColor: ColorsHelper.blackColor,
                              ),
                              CustomText(
                                title: item.getKms(),
                                fontSize: Diamentions.font16,
                                fontWeight: FontWeight.bold,
                                fontColor: selectedIndex == index
                                    ? ColorsHelper.blackColor
                                    : ColorsHelper.greyColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.timer_outlined,
                size: height * 0.02,
              ),
              CustomText(
                title: '  ${selectedPackageModel.getHrs()}'
                    '  ${selectedPackageModel.getKms()} Package',
                fontColor: ColorsHelper.blackColor,
                fontSize: Diamentions.font16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 0.10,
          ),
          RichText(
            text: TextSpan(
                text: 'Rental Package rules & Restrictions. ',
                style: TextStyle(
                    fontFamily: Constants.FONT_FAMILY,
                    color: ColorsHelper.greyColor,
                    fontSize: Diamentions.font16),
                children: [
                  TextSpan(
                    text: 'View Details',
                    style: TextStyle(
                        color: ColorsHelper.blueColor,
                        fontSize: Diamentions.font16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => print('Tap Here onTap'),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class PackageModel {
  String? hr;
  String? km;
  PackageModel(this.hr, this.km);

  getHrs() {
    return hr ?? '';
  }

  getKms() {
    return km ?? '';
  }
}

PackageModel p1 = PackageModel("2hrs", "25 km");
PackageModel p2 = PackageModel("4hrs", "40 km");
PackageModel p3 = PackageModel("6hrs", "60 km");
PackageModel p4 = PackageModel("8hrs", "80 km");
PackageModel p5 = PackageModel("10hrs", "100 km");
PackageModel p6 = PackageModel("12hrs", "120 km");
List packageModelList = [p1, p2, p3, p4, p5, p6];
