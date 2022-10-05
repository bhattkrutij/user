import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/widgets/text.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../drawer_header.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: customDrawerPage(
        title: Constants.SUPPORT,
        child: SupportBody(),
      ),
    ));
  }
}

class SupportBody extends StatefulWidget {
  const SupportBody({Key? key}) : super(key: key);

  @override
  State<SupportBody> createState() => _SupportBodyState();
}

class _SupportBodyState extends State<SupportBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            top: Diamentions.width20,
            left: Diamentions.width5,
            right: Diamentions.width5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Diamentions.width30,
            ),
            CustomText(
              title: Constants.HELP_TOPICS,
              fontSize: Diamentions.font20,
              fontColor: ColorsHelper.blackColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: Diamentions.width20,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: supportItems.length,
                itemBuilder: (context, index) {
                  SupportItem item = supportItems[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        left: Diamentions.width10, right: Diamentions.width10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: item.getTitle(),
                          fontSize: Diamentions.font18,
                          fontColor: ColorsHelper.blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: Diamentions.width15),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: Diamentions.width20,
                            color: ColorsHelper.blackColor,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportItem {
  String? title;
  SupportItem({required this.title});
  getTitle() {
    return title ?? "";
  }
}

SupportItem item1 = SupportItem(title: Constants.TRIP_ISSUES);
SupportItem item2 = SupportItem(title: Constants.GUIDE);
SupportItem item3 = SupportItem(title: Constants.ACCESSIBILITY);
SupportItem item4 = SupportItem(title: Constants.SERVICE);
SupportItem item5 = SupportItem(title: Constants.BOOKING_ERROR);
SupportItem item6 = SupportItem(title: Constants.EMERGENCY_NUMBER);
List<SupportItem> supportItems = [
  item1,
  item2,
  item3,
  item4,
  item5,
  item5,
  item6
];
