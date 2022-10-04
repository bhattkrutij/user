import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kiwni_user/providers/toggle_provider.dart';
import 'package:kiwni_user/screens/home/home/tabbar_widget.dart';
import 'package:kiwni_user/screens/home/home/toggle_widget.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:kiwni_user/utils/constants.dart';

import '../../../models/drawer_item.dart';
import '../../../utils/images_helper.dart';
import 'card_view.dart';
import 'middle_view_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    context.read(toggleProvider).selectedTabName =
        Constants.OUTSTATION.toLowerCase();
    context.read(toggleProvider).selectedToggleName =
        Constants.ROUND_TRIP.toLowerCase();
    context.read(toggleProvider).selectedTabIndex = 0;

    context.read(toggleProvider).selectedToggleIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    const CameraPosition cameraPosition = CameraPosition(
      target: LatLng(22.308155, 70.800705),
      zoom: 14.4746,
    );
    return Stack(
      children: [
        Image.asset(
          ImagesHelper.IMG_HOME_SCREEN_BG,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorsHelper.primaryColor),
            backgroundColor: ColorsHelper.whiteColor,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_border,
                  size: height * 0.03,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    ImagesHelper.IMG_CALL,
                    height: height * 0.03,
                    width: height * 0.03,
                  )),
            ],
          ),
          body: Container(
            height: height,
            child: Consumer(
              builder: (context, watch, _) {
                var model = watch(toggleProvider);
                return Stack(
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: TabBarWidget(),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        if (model.getSelectedTabIndex() != 2) ToggleWidget(),
                        SizedBox(
                          height: height * 0.10,
                        ),
                        Expanded(
                          flex: 2,
                          child: MiddleViewWidget(),
                        ),
                        Expanded(
                            flex: 1,
                            child: GoogleMap(
                              buildingsEnabled: true,
                              zoomControlsEnabled: false,
                              myLocationButtonEnabled: true,
                              // polylines: {..._provider.polyline},
                              mapType: MapType.normal,
                              initialCameraPosition: cameraPosition,
                              markers: {
                                const Marker(
                                    markerId: MarkerId('SomeId'),
                                    position: LatLng(22.308155, 70.800705),
                                    infoWindow: InfoWindow(title: 'Rajkot'))
                              },
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ))
                      ],
                    ),
                    Positioned(
                      top: model.getSelectedTabIndex() != 2
                          ? height * .15
                          : height * .10,
                      left: width * .04,
                      right: width * .04,
                      child: CardViewWidget(),
                    ),
                  ],
                );
              },
            ),
          ),
          drawer: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Drawer(
              child: DrawerItem(),
            ),
          ),
        )
      ],
    );
  }
}
