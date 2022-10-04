/***
 * SWITCHES IN MAIN SCREEN ARE TOGGLEING USING THIS PROVIDER
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiwni_user/utils/constants.dart';

class ToggleProvider extends ChangeNotifier {
  // String? switchValue1;
  // String? switchValue2;
  int? selectedTabIndex;
  int? selectedToggleIndex = 0;
  String selectedTabName = Constants.OUTSTATION.toLowerCase();
  String? selectedToggleName;
  List swtichTitles = [];
  ToggleProvider() {
    swtichTitles.add(Constants.ROUND_TRIP);
    swtichTitles.add(Constants.ONE_WAY);
    if (selectedTabIndex == 0) selectedTabName = Constants.ROUND_TRIP;
    if (selectedTabIndex == 1) selectedTabName = Constants.AIRPORT_PICKUP;
  }

  setSelectedTabIndex(int index) {
    selectedTabIndex = index;
    setSelectedTabName();
    addToList();
  }

  setSelectedToggleIndex(int index) {
    selectedToggleIndex = index;
    print("selected toggle index: ${selectedToggleIndex}==${selectedTabIndex}");

    setSelectedToggleName();
    //  notifyListeners();
  }

  setSelectedToggleName() {
    if (selectedToggleIndex == 0 && selectedTabIndex == 0) {
      print(Constants.ROUND_TRIP.toLowerCase());
      selectedToggleName = Constants.ROUND_TRIP.toLowerCase();
    } else if (selectedToggleIndex == 1 && selectedTabIndex == 0) {
      selectedToggleName = Constants.ONE_WAY.toLowerCase();
    } else if (selectedToggleIndex == 0 && selectedTabIndex == 1) {
      selectedToggleName = Constants.AIRPORT_PICKUP.toLowerCase();
    } else if (selectedToggleIndex == 1 && selectedTabIndex == 1) {
      selectedToggleName = Constants.AIRPORT_DROP.toLowerCase();
    }
    print("KKK${selectedToggleName}");
  }

  setSelectedTabName() {
    if (selectedTabIndex == 0) {
      selectedTabName = Constants.OUTSTATION.toLowerCase();
    } else if (selectedTabIndex == 1) {
      selectedTabName = Constants.AIRPORT.toLowerCase();
    } else if (selectedTabIndex == 2) {
      selectedTabName = Constants.RENTAL.toLowerCase();
    }
    print("KRUTIv::${selectedTabName}");
    notifyListeners();
  }

  getSelectedTabIndex() {
    return selectedTabIndex;
  }

  addToList() {
    swtichTitles.clear();
    if (getSelectedTabIndex() == 0) {
      swtichTitles.add(Constants.ROUND_TRIP);
      swtichTitles.add(Constants.ONE_WAY);
      selectedToggleIndex = 0;
      selectedToggleName = Constants.ROUND_TRIP.toLowerCase();
    } else if (getSelectedTabIndex() == 1) {
      swtichTitles.add(Constants.AIRPORT_PICKUP);
      swtichTitles.add(Constants.AIRPORT_DROP);
      selectedToggleIndex = 1;
      selectedToggleName = Constants.AIRPORT_PICKUP.toLowerCase();
    }
    selectedToggleIndex = 0;

    print(swtichTitles);
    notifyListeners();
  }
}

class ToggleItem {
  ToggleItem({required this.name});

  final String name;
  getName() {
    return name;
  }
}

final toggleProvider = ChangeNotifierProvider.autoDispose<ToggleProvider>(
  (ref) => ToggleProvider(),
);
