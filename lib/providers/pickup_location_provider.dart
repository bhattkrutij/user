// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/all.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_place/google_place.dart';
// import 'package:location/location.dart' as loc;
//
// class PickUpLocationProvider extends ChangeNotifier {
//   late String apiKey;
//   String? placeId = "";
//   late GooglePlace googlePlace;
//   List<AutocompletePrediction> placePredictions = [];
//   TextEditingController search = TextEditingController();
//   bool isCloseVisible = false;
//   final Completer<GoogleMapController> controller = Completer();
//   String strSearch = '';
//   late DetailsResult detailsResult;
//   double? lat;
//   double? lng;
//   loc.LocationData? currentLocation;
//   final Set<Marker> markers = {};
//   //LatLng atCurrent = LatLng(22.8252, 70.8491);
//   late LatLng atCurrent;
//   List<Placemark>? placemarks;
//   String formattedCityState = "Pickup Location";
//   String formattedaddress = "";
//   CameraPosition? cameraPosition;
//
//   setIsCloseVisible(bool b) {
//     isCloseVisible = b;
//     notifyListeners();
//   }
//
//   getIsCloseVisible() {
//     return isCloseVisible;
//   }
//
//   PickUpLocationProvider() {
//     apiKey = "AIzaSyB5Xz9VYYhRSrSlm7R8PM7hwwV9J56DIxo";
//     googlePlace = GooglePlace(apiKey);
//     isCloseVisible = search.text.isNotEmpty;
//
//     if (formattedCityState == "Pickup Location") {
//       getUserLocation();
//       // print(
//       //     "constructor of provider called ${atCurrent.longitude} == ${atCurrent.latitude}");
//       // cameraPosition = CameraPosition(
//       //   target: atCurrent,
//       //   zoom: 14.4746,
//       // );
//     } else {
//       atCurrent = new LatLng(lat!, lng!);
//       clearMarkers();
//       addMarkers();
//       animateTo(atCurrent!.latitude!, atCurrent!.longitude!);
//       getAddress(atCurrent);
//       print(
//           "constructor of provider called ${atCurrent.longitude} == ${atCurrent.latitude}");
//       // cameraPosition = CameraPosition(
//       //   target: atCurrent,
//       //   zoom: 14.4746,
//       // );
//     }
//
//     notifyListeners();
//
//     init();
//   }
//
//   init() async {
//     clearMarkers();
//     addMarkers();
//     lat = atCurrent.latitude;
//     lng = atCurrent.longitude;
//
//     animateTo(atCurrent.latitude, atCurrent.longitude);
//
//     notifyListeners();
//   }
//
//   void addMarkers() {
//     markers.addAll(createMarker());
//     notifyListeners();
//   }
//
//   void clearMarkers() {
//     markers.clear();
//     notifyListeners();
//   }
//
//   Set<Marker> createMarker() {
//     print("created markers (The map widget with the pin.)");
//     return {
//       Marker(
//           markerId: const MarkerId("marker_1"),
//           position: atCurrent,
//           infoWindow: const InfoWindow(title: 'Marker 1'),
//           draggable: true,
//           onDragEnd: ((newPosition) {
//             atCurrent = LatLng(newPosition.latitude, newPosition.longitude);
//             clearMarkers();
//             addMarkers();
//             getAddress(newPosition);
//             animateTo(newPosition.latitude, newPosition.longitude);
//             notifyListeners();
//           }),
//           icon: BitmapDescriptor.defaultMarker),
//     };
//   }
//
//   void getUserLocation() async {
//     print("getuserlocation called");
//     //call this async method from whereever you need
//
//     loc.LocationData? myLocation;
//     String error;
//     loc.Location location = await loc.Location();
//     try {
//       myLocation = await location.getLocation().then((value) {
//         currentLocation = value;
//         print(
//             "jjjjj${currentLocation!.longitude}longitutude ${currentLocation!.longitude}");
//         atCurrent =
//             LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
//
//         clearMarkers();
//         addMarkers();
//         animateTo(currentLocation!.latitude!, currentLocation!.longitude!);
//         getAddress(atCurrent);
//         // print(
//         //     "constructor of provider called ${atCurrent.longitude} == ${atCurrent.latitude}");
//         // cameraPosition = CameraPosition(
//         //   target: atCurrent,
//         //   zoom: 14.4746,
//         // );
//       });
//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         error = 'please grant permission';
//         print(error);
//       }
//       if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
//         error = 'permission denied- please enable it from app settings';
//         print(error);
//       }
//     }
//
//     //   final coordinates = new Coordinates(
//     //      myLocation?.latitude, myLocation?.longitude);
//     // var addresses = await Geocoder.local.findAddressesFromCoordinates(
//     //     coordinates);
//     // var first = addresses.first;
//     // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
//   }
//
//   autoCompleteSearch(String value) async {
//     var results = await googlePlace.autocomplete.get(value);
//     if (results != null && results.predictions != null) {
//       print(results.predictions!.first.description);
//
//       placePredictions = results.predictions!;
//     }
//     notifyListeners();
//   }
//
//   getAddress(LatLng newPosition) async {
//     placemarks = await placemarkFromCoordinates(
//         newPosition.latitude, newPosition.longitude);
//     Placemark placeMark = placemarks![0];
//     String? name = placeMark.name;
//     String? subLocality = placeMark.subLocality;
//     String? locality = placeMark.locality;
//     String? administrativeArea = placeMark.administrativeArea;
//     String? postalCode = placeMark.postalCode;
//     String? country = placeMark.country;
//     String address =
//         "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
//     search.text = address;
//     formattedCityState = "${subLocality},${locality}";
//     formattedaddress = "${name}, ${subLocality}, ${locality},";
//
//     print("formateed address ${formattedaddress}");
//     notifyListeners();
//   }
//
//   Future<void> animateTo(double lat, double lng) async {
//     print("animate method call ${lat}==${lng}");
//     final c = await controller.future;
//     final p = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
//     c.animateCamera(CameraUpdate.newCameraPosition(p));
//     atCurrent = new LatLng(lat, lng);
//
//     // controller.a(CameraUpdate.newCameraPosition(CameraPosition(
//     //     target: LatLong(..., ...),
//     //     zoom: ...,
//     clearMarkers();
//     addMarkers();
//     getAddress(atCurrent);
//     notifyListeners();
//   }
// }
//
// final pickupLocationProvider =
//     ChangeNotifierProvider.autoDispose<PickUpLocationProvider>(
//   (ref) => PickUpLocationProvider(),
// );
