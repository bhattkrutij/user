import 'package:flutter/cupertino.dart';

import '../utils/Dimentions.dart';
import '../utils/colors.dart';
import '../widgets/appbar.dart';

class customDrawerPage extends StatelessWidget {
  String? title;
  Widget? child;
  customDrawerPage({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: Diamentions.width20,
            child: Container(
              width: Diamentions.screenWidth,
              child: CustomAppBar(
                fontColor: ColorsHelper.whiteColor,
                iconColor: ColorsHelper.whiteColor,
                title: title!,
              ),
            )),
        Positioned(
          top: Diamentions.width100,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: ColorsHelper.whiteColor),
            width: Diamentions.screenWidth,
            height: Diamentions.screenHeight,
            child: child,
          ),
        ),
      ],
    );
  }
}
