import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kiwni_user/utils/constants.dart';

import '../utils/Dimentions.dart';
import '../utils/colors.dart';
import '../widgets/text.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  late int selectedDrawerIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDrawerIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _getDrawerItemWidget(int pos) {
      switch (pos) {
        case 0:
          Get.toNamed("/myRides");
          break;
        // case 1:
        //   return ScreenOne(
        //
        //   );
        // case 2:
        //   return TwoScreen();
        // case 3:
        //   return new Three();
        // case 4:
        //   return Settings();
        // case 5:
        //   return Help();

        default:
          return new Text("Error");
      }
    }

    return Column(children: <Widget>[
      DrawerHeader(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Diamentions.width10,
            ),
            Container(
              height: Diamentions.width50,
              width: Diamentions.width50,
              child: CircleAvatar(
                backgroundColor: ColorsHelper.whiteColor,
                radius: 20,
                child: Icon(
                  Icons.person,
                  size: Diamentions.width50,
                  color: ColorsHelper.primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: Diamentions.width20,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Diamentions.width10,
                    vertical: Diamentions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      title: "Kiran Patil",
                      fontSize: Diamentions.font18,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      title: "12345567782",
                      fontSize: Diamentions.font18,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: ColorsHelper.primaryColor,
        ),
      ),
      Expanded(
        child: Container(
          height: Diamentions.screenHeight,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: drawerItems.length,
              itemBuilder: (context, index) {
                DrawerItemModel item = drawerItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Diamentions.width10,
                      vertical: Diamentions.width10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDrawerIndex = index;
                        _getDrawerItemWidget(index);

                        print("drawwer");
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          item.getIcon(),
                          width: Diamentions.width20,
                          height: Diamentions.width20,
                          color: ColorsHelper.primaryColor,
                        ),
                        SizedBox(
                          width: Diamentions.width10,
                        ),
                        CustomText(
                          title: item.getTitle(),
                          fontSize: Diamentions.font16,
                          fontColor: ColorsHelper.blackColor,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      )
    ]);
  }
}

///model class
class DrawerItemModel {
  // bool? isRadioButtonFill;
  String? icon;
  String? title;
  DrawerItemModel(
      { //required this.isRadioButtonFill,
      required this.icon,
      required this.title});
  factory DrawerItemModel.fromJson(Map<String, dynamic> json) {
    return DrawerItemModel(
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

DrawerItemModel drawerItem1 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.MY_RIDES);
DrawerItemModel drawerItem2 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.PAYMENT);
DrawerItemModel drawerItem3 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.OFFERS);
DrawerItemModel drawerItem4 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.SAFETY);
DrawerItemModel drawerItem5 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.FAQS);
DrawerItemModel drawerItem6 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.FEEDBACK);
DrawerItemModel drawerItem7 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.SHARE_APP);
DrawerItemModel drawerItem8 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.REFER_EARN);
DrawerItemModel drawerItem9 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.SUPPORT);
DrawerItemModel drawerItem10 =
    DrawerItemModel(icon: Constants.IMG_LOCATION, title: Constants.ABOUT);
List<DrawerItemModel> drawerItems = [
  drawerItem1,
  drawerItem2,
  drawerItem3,
  drawerItem4,
  drawerItem5,
  drawerItem6,
  drawerItem7,
  drawerItem8,
  drawerItem9,
  drawerItem10
];
