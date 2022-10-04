import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:location/location.dart' as loc;

class PickupProvider extends ChangeNotifier {
  late GoogleMapController _controller;
  final Set<Marker> _markers = {};
  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(12.9716, 77.5946), zoom: 10.0);

  LatLng currentLatLng = LatLng(12.9716, 77.5946);
  CameraPosition get initialCameraPosition => _initialCameraPosition;
  Set<Marker> get markers => _markers;
  GoogleMapController get controller => _controller;

  late String apiKey;
  String? placeId = "";
  late GooglePlace googlePlace;
  List<AutocompletePrediction> placePredictions = [];
  TextEditingController search = TextEditingController();
  List<Placemark>? placemarks;
  bool isCloseVisible = false;
  String strSearch = '';
  late DetailsResult detailsResult;
  double? lat;
  double? lng;
  String formattedCityState = "Pickup Location";
  String formattedAddress = "";
  setIsCloseVisible(bool b) {
    isCloseVisible = b;
    notifyListeners();
  }

  getIsCloseVisible() {
    return isCloseVisible;
  }

  PickupProvider() {}
  init() async {
    // if (formattedCityState == "Pickup Location")
    await determinePosition();
  }

  autoCompleteSearch(String value) async {
    var results = await googlePlace.autocomplete.get(value);
    if (results != null && results.predictions != null) {
      print(results.predictions!.first.description);

      placePredictions = results.predictions!;
    }
    notifyListeners();
  }

  Future<void> addMarkers() async {
    await clearMarkers();
    _markers.add(
      Marker(
          markerId: MarkerId("dsds"),
          position: currentLatLng,
          infoWindow: InfoWindow(
            title: "Pizza Parlour",
            snippet: "This is a snippet",
          ),
          draggable: true,
          onDragEnd: ((newPosition) {
            currentLatLng = newPosition;
            getAddress(currentLatLng);
          }),
          icon: BitmapDescriptor.defaultMarker),
    );
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLatLng, zoom: 14)
        //17 is new zoom level
        ));
    getAddress(currentLatLng);
    notifyListeners();
  }

  Future<void> clearMarkers() async {
    _markers.clear();
  }

  void assignCamera(GoogleMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      loc.Location location = loc.Location();
      location.requestPermission();
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    // await seleceAddressFromLatLng(
    //     LatLng(position.latitude, position.longitude));
    currentLatLng = LatLng(position.latitude, position.longitude);
    addMarkers();
  }

  // Future<void> seleceAddressFromLatLng(LatLng latLng) async {
  //   var placemarks =
  //       await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
  //   var location = placemarks.first;
  //   _selectedAddress = AddressModel(
  //     addressid: '',
  //     userid: '',
  //     name: 'name',
  //     type: 'type',
  //     house: location.name.toString(),
  //     street: location.name.toString(),
  //     city: location.subAdministrativeArea.toString(),
  //     state: location.administrativeArea.toString(),
  //     pincode: location.postalCode.toString(),
  //     phonenumber: 'phonenumber',
  //     addressPosition: latLng,
  //   );
  //   notifyListeners();
  // }

  getAddress(LatLng newPosition) async {
    placemarks = await placemarkFromCoordinates(
        newPosition.latitude, newPosition.longitude);
    Placemark placeMark = placemarks![0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String address =
        "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
    search.text = address;
    formattedCityState = "${subLocality},${locality}";
    formattedAddress = "${name}, ${subLocality}, ${locality},";

    print("formateed address ${formattedAddress}");
    notifyListeners();
  }
}

final pickupProvider = ChangeNotifierProvider.autoDispose<PickupProvider>(
  (ref) => PickupProvider(),
);
