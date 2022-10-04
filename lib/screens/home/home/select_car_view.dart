import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';
import 'package:kiwni_user/utils/images_helper.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../../utils/Dimentions.dart';

class SelectCarView extends StatefulWidget {
  SelectCarView({Key? key}) : super(key: key);

  @override
  State<SelectCarView> createState() => _SelectCarViewState();
}

class _SelectCarViewState extends State<SelectCarView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: height * .15,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              CarModel carModel = carModelList[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      width: width * .30,
                      //define the size of text widget here
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(5),
                      // ),

                      child: Positioned(
                        left: 40,
                        child: Column(
                          children: [
                            Image.asset(
                              selectedIndex == index
                                  ? ImagesHelper.IMG_SELECTED_CAR_BG
                                  : ImagesHelper.IMG_UNSELECTED_CAR_BG,
                              height: width * .20,
                              width: width * .20,
                            ),
                            CustomText(
                              title: carModel.getCarName(),
                              fontSize: Diamentions.font18,
                              fontColor: ColorsHelper.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      carModel.getCarLogo(),
                      height: width * .20,
                      width: width * .20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SelectCarComponent extends StatelessWidget {
  const SelectCarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context)
              .size
              .width, //define the size of text widget here
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Positioned(
            left: 80,
            child: Column(
              children: [
                Image.asset(
                  ImagesHelper.IMG_SELECTED_CAR_BG,
                  height: 80,
                  width: 80,
                ),
                CustomText(
                  title: Constants.HATCH_BACK,
                  fontSize: Diamentions.font18,
                  fontColor: ColorsHelper.blackColor,
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          ImagesHelper.IMG_SEDAN,
          height: 70,
          width: 70,
        ),
      ],
    );
  }
}

class CarModel {
  String? carName;
  String? carLogo;

  CarModel({required this.carName, required this.carLogo});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(carName: json['carName'], carLogo: json['carLogo']);
  }

  String getCarName() {
    return carName ?? '';
  }

  String getCarLogo() {
    return carLogo ?? '';
  }
}

CarModel hatchBack =
    CarModel(carName: "Hatchback", carLogo: ImagesHelper.IMG_HACHBACK);
CarModel sedan = CarModel(carName: "Sedan", carLogo: ImagesHelper.IMG_SEDAN);
CarModel suv = CarModel(carName: "Suv", carLogo: ImagesHelper.IMG_SUV);
List<CarModel> carModelList = [hatchBack, sedan, suv];
