import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwni_user/utils/Dimentions.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../providers/toggle_provider.dart';
import '../../../utils/colors.dart';

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // return ToggleSwitch(
    //   fontSize: 18,
    //   customTextStyles: [],
    //   minHeight: height * .04,
    //   minWidth: width * .40,
    //   cornerRadius: 20.0,
    //   activeBgColors: [
    //     [ColorsHelper.primaryColor!],
    //     [ColorsHelper.primaryColor!]
    //   ],
    //   borderWidth: 1,
    //   borderColor: [ColorsHelper.primaryColor, ColorsHelper.primaryColor],
    //   activeFgColor: ColorsHelper.whiteColor,
    //   inactiveBgColor: ColorsHelper.whiteColor,
    //   inactiveFgColor: ColorsHelper.primaryColor,
    //   initialLabelIndex: 0,
    //   totalSwitches: 2,
    //   labels: ["hhfg", "fghgfhh"],
    //   radiusStyle: true,
    //   onToggle: (index) {
    //     print('switched to: $index');
    //   },
    // );

    return Container(
      child: Consumer(builder: (context, watch, _) {
        var model = watch(toggleProvider);
        return ToggleSwitch(
          fontSize: Diamentions.font16,
          customTextStyles: [],
          minHeight: height * .04,
          minWidth: width * .40,
          cornerRadius: 20.0,
          activeBgColors: [
            [ColorsHelper.primaryColor!],
            [ColorsHelper.primaryColor!]
          ],
          borderWidth: 1,
          borderColor: [ColorsHelper.primaryColor, ColorsHelper.primaryColor],
          activeFgColor: ColorsHelper.whiteColor,
          inactiveBgColor: ColorsHelper.whiteColor,
          inactiveFgColor: ColorsHelper.primaryColor,
          initialLabelIndex: 0,
          totalSwitches: 2,
          labels: [
            model.swtichTitles[0], model.swtichTitles[1]
            // context.read(provider).swtichTitles[0],
            // context.read(provider).swtichTitles[1]
          ],
          radiusStyle: true,
          onToggle: (index) {
            print('switched to: $index');
            model.setSelectedToggleIndex(index!);
          },
        );
      }),
    );
  }
}
