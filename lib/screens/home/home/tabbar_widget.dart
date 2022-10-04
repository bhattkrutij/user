import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../providers/toggle_provider.dart';
import '../../../utils/Dimentions.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: 3)
      ..addListener(() {
        if (_controller.indexIsChanging) {
          setState(() {
            _selectedIndex = _controller.index;
            context
                .read(toggleProvider)
                .setSelectedTabIndex(_controller.index.toInt());
          });
        } else {}
      });
    // _controller = TabController(length: 3, vsync: this);
    //
    // _controller.addListener(() {
    //   if (_controller.indexIsChanging) {
    //     setState(() {
    //       _selectedIndex = _controller.index;
    //     });
    //
    //     context.read(provider).setSelectedTabIndex(_controller.index.toInt());
    //     print("Selected Index: " +
    //         context.read(provider).getSelectedTabIndex().toString());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: Constants.TAB_COUNT,
        initialIndex: 0,
        child: Center(
          child: TabBar(
            controller: _controller,
            indicatorColor: ColorsHelper.primaryColor,
            unselectedLabelColor: ColorsHelper.primaryColor,
            unselectedLabelStyle: TextStyle(
              fontSize: Diamentions.font18,
              fontFamily: Constants.FONT_FAMILY,
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(
                text: Constants.OUTSTATION,
              ),
              Tab(
                text: Constants.AIRPORT,
              ),
              Tab(
                text: Constants.RENTAL,
              ),
            ],
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Diamentions.font18,
                fontFamily: Constants.FONT_FAMILY),
            labelColor: ColorsHelper.whiteColor,
            indicator: RectangularIndicator(
              color: ColorsHelper.primaryColor,
              bottomLeftRadius: height * .03,
              bottomRightRadius: height * .03,
              topLeftRadius: height * .03,
              topRightRadius: height * .03,
            ),
          ),
        ));
  }
}
