import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'packag'
    'e:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:kiwni_user/providers/pickup_provider.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/images_helper.dart';
import '../../widgets/text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  _SearchScreenState({Key? key}) : super();

  // late String apiKey;
  // String? placeId = "";
  // late GooglePlace googlePlace;
  // List<AutocompletePrediction> placePredictions = [];
  // TextEditingController search = TextEditingController();
  // bool _isCloseVisible = false;
  // final Completer<GoogleMapController> _controller = Completer();
  // String strSearch = '';
  // late DetailsResult detailsResult;
  // double? lat;
  //double? lng;
  // loc.LocationData? currentLocation;
  // GoogleMapController? googleMapController;
  // final Set<Marker> _markers = {};
  // LatLng atCurrent = const LatLng(22.308155, 70.800705);
  // List<Placemark>? placemarks;
  // String _address = "";
  // var providerModel;
  //
  // getLocation() {
  //   print("get location called");
  //   context.read(pickupLocationProvider).getUserLocation();
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // PickUpLocationProvider provider = PickUpLocationProvider();
  //   // provider.googleMapController!.setMapStyle("[]");
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      init();
    });
  }

  init() {
    String apiKey = "AIzaSyB5Xz9VYYhRSrSlm7R8PM7hwwV9J56DIxo";
    context.read(pickupProvider).googlePlace = GooglePlace(apiKey);
    context.read(pickupProvider).determinePosition();
//     if (context.read(pickupProvider).search == "Pickup Location") {
//       context.read(pickupProvider).determinePosition();
//     }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //  var provider = watch(pickupLocationProvider);
    //   print(
    //       "stack valled + ${provider.atCurrent!.latitude} --- ${provider.atCurrent!.longitude}");

    return SafeArea(child: Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          var provider = watch(pickupProvider);
          return Stack(
            alignment: Alignment(0.0, 0.0),
            children: [
              Container(
                width: width,
                height: height,
                // child: GoogleMap(
                //   buildingsEnabled: true,
                //   zoomControlsEnabled: false,
                //   myLocationButtonEnabled: true,
                //   // polylines: {..._provider.polyline},
                //   mapType: MapType.normal,
                //   initialCameraPosition: CameraPosition(
                //     target: provider.atCurrent!,
                //     zoom: 14.4746,
                //   ),
                //   markers: provider.markers,
                //   onCameraMove: ((cameraPosition) {
                //     double lang = cameraPosition.target.longitude;
                //     double lat = cameraPosition.target.latitude;
                //     provider.atCurrent = LatLng(lat, lang);
                //   }),
                //   onMapCreated: (GoogleMapController controller) {
                //     //controller.setMapStyle(mapStyle)
                //     provider.controller.complete(controller);
                //     // if (provider.controller.isCompleted) {
                //     //   provider.controller.complete(controller);
                //     //   //first calling is false
                //     //   //call "completer()"
                //     //
                //     // } else {
                //     //   //other calling, later is true,
                //     //   //don't call again completer()
                //     // }
                //   },
                // ),
                child: GoogleMap(
                  buildingsEnabled: false,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: true,
                  //   polylines: {..._provider.polyline},
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(provider.currentLatLng!.latitude!,
                        provider.currentLatLng!.longitude!),
                    zoom: 13.5,
                  ),
                  onCameraMove: (CameraPosition position) {},
                  markers: provider.markers,

                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      provider.assignCamera(controller);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * .03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios_new_outlined),
                                iconSize: height * .03,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              SizedBox(
                                width: width * .03,
                              ),
                              CustomText(
                                title: "Pick up",
                                fontColor: ColorsHelper.blackColor,
                                fontSize: Diamentions.font18,
                                fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorsHelper.blackColor, width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: ColorsHelper.greyColor,
                                      size: height * .03,
                                    ),
                                    CustomText(
                                      title: "Myself",
                                      fontColor: ColorsHelper.blackColor,
                                      fontSize: Diamentions.font18,
                                      fontFamily:
                                          Constants.FONT_FAMILY_SEMI_BOLD,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: height * .03,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: height * .03,
                    ),
                    Card(
                      shadowColor: Colors.grey[2],
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        child: Container(
                          width: width,
                          child: TextField(
                            controller: provider.search,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                  color: Color(0xfff9f9f9),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: Diamentions.font16,
                                  fontFamily: Constants.FONT_FAMILY),
                              border: InputBorder.none,
                              filled: false,
                              fillColor: Color(0xfff9f9f9),
                              suffixIcon: provider.getIsCloseVisible()
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      color: ColorsHelper.blackColor,
                                      onPressed: () {
                                        provider.search.clear();
                                        provider.setIsCloseVisible(false);

                                        /* Clear the search field */
                                      },
                                    )
                                  : SizedBox(),
                              hintText: '  Search...',
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                provider.isCloseVisible =
                                    provider.search.text.isNotEmpty;
                                provider.autoCompleteSearch(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    provider.isCloseVisible
                        ? Container(
                            color: ColorsHelper.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: Constants.Location,
                                    fontFamily: Constants.FONT_FAMILY_SEMI_BOLD,
                                    fontSize: Diamentions.font18,
                                    fontWeight: FontWeight.bold,
                                    fontColor: ColorsHelper.blackColor,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          provider.placePredictions.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                provider.search.clear();
                                                provider.search.text = provider
                                                    .placePredictions[index]
                                                    .description!;
                                                provider
                                                    .setIsCloseVisible(false);
                                                provider.googlePlace!.details!
                                                    .get(provider
                                                        .placePredictions![
                                                            index]!
                                                        .placeId!)
                                                    .then((value) {
                                                  provider.placeId = value
                                                      ?.result!.placeId!
                                                      .toString();
                                                  provider.detailsResult =
                                                      value!.result!;
                                                  provider.lat = provider
                                                      .detailsResult!
                                                      .geometry!
                                                      .location!
                                                      .lat;
                                                  provider.lng = provider
                                                      .detailsResult!
                                                      .geometry!
                                                      .location!
                                                      .lng;
                                                  //   getDetils(placeId!);
                                                  provider.currentLatLng =
                                                      new LatLng(provider.lat!,
                                                          provider.lng!);
                                                  print(
                                                      "${provider.lat} --  ${provider.lng}");
                                                  provider.addMarkers();
                                                });

                                                // detailsResult = googlePlace!.details.get(placePredictions[index]);
                                                // googlePlace.details.get(placePredictions[index].)
                                                // double? lat = detailsResult!
                                                //     .geometry.location.lat;
                                                // double? lng = detailsResult
                                                //     .geometry.location.lng;
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0,
                                                    top: 20,
                                                    bottom: 20,
                                                    right: 10),
                                                child: CustomText(
                                                  title: provider
                                                      .placePredictions[index]
                                                      .description!,
                                                  fontFamily:
                                                      Constants.FONT_FAMILY,
                                                  fontSize: Diamentions.font16,
                                                  fontColor:
                                                      ColorsHelper.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: ColorsHelper.greyColor,
                                            )
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
              Positioned(
                bottom: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: Container(
                        color: ColorsHelper.whiteColor,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              provider.determinePosition();
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.asset(
                                    ImagesHelper.IMG_CURRENT_LOCATION,
                                    width: width * 0.05,
                                    height: height * 0.05,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                    title: Constants.CURRENT_LOCATION,
                                    fontSize: Diamentions.font16,
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontColor: ColorsHelper.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: Container(
                        color: ColorsHelper.whiteColor,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Image.asset(
                                    ImagesHelper.IMG_LOCATE_PIN,
                                    width: width * 0.05,
                                    height: height * 0.05,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.getAddress(provider.currentLatLng);
                                  Get.toNamed("/home");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                    title: Constants.LOCATE_ON_MAP,
                                    fontSize: Diamentions.font16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Constants.FONT_FAMILY,
                                    fontColor: ColorsHelper.blackColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
