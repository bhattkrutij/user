import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/text.dart';

// class CalenderView extends StatelessWidget {
//   String title;
//   String icon;
//   VoidCallback onTap;
//   CalenderView(
//       {Key? key,
//       this.title = "Fir 24,Dec",
//       this.icon = ImagesHelper.IMG_CALENDER,
//       required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     CalenderRow(
//                       title: '',
//                       leadingIcon: icon,
//                       onTap: onTap,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   children: [
//                     CalenderRow(
//                       title: '',
//                       leadingIcon: '',
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     CalenderRow(
//                       title: '',
//                       leadingIcon: '',
//                       onTap: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class CalenderRow extends StatelessWidget {
  String leadingIcon;
  String title;
  VoidCallback onTap;
  double fontSize;
  double leadingIconSize;
  double padding;
  Color fontColor;
  FontWeight fontWeight;
  bool isDownArrowVisible;
  CalenderRow({
    Key? key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    required this.padding,
    required this.fontSize,
    required this.leadingIconSize,
    this.fontColor = ColorsHelper.blackColor,
    this.fontWeight = FontWeight.bold,
    this.isDownArrowVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            leadingIcon,
            width: leadingIconSize,
            height: leadingIconSize,
          ),
          SizedBox(
            width: padding,
          ),
          Expanded(
            child: CustomText(
              title: title,
              fontColor: fontColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
          SizedBox(
            width: padding,
          ),
          if (isDownArrowVisible)
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 25,
              color: ColorsHelper.primaryColor,
            ),
        ],
      ),
    );
  }
}
