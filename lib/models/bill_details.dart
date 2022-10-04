import '../utils/constants.dart';

class BillItem {
  String? name;
  String? value;

  BillItem({required this.name, required this.value});

  factory BillItem.fromJson(Map<String, dynamic> json) {
    return BillItem(
      name: json['name'],
      value: json['value'],
    );
  }

  String getName() {
    return name ?? '';
  }

  String getValue() {
    return value ?? '';
  }
}

BillItem billItem1 = BillItem(name: Constants.RIDE_FARE, value: "3789/-");
BillItem billItem2 = BillItem(name: Constants.EXTRA_FARE_KM, value: "0 km");
BillItem billItem3 = BillItem(name: Constants.EXTRA_FARE_PER_KM, value: "0 km");
BillItem billItem4 =
    BillItem(name: Constants.TOTAL_BASE_FARE, value: "- 740/-");
BillItem billItem5 = BillItem(name: Constants.APPLY_COUPEN, value: "- 720/-");

List<BillItem> billItems = [
  billItem1,
  billItem2,
  billItem3,
  billItem4,
  billItem5
];

class AdvancePaymentItem {
  String? name;
  String? value;

  AdvancePaymentItem({required this.name, required this.value});

  factory AdvancePaymentItem.fromJson(Map<String, dynamic> json) {
    return AdvancePaymentItem(
      name: json['name'],
      value: json['value'],
    );
  }

  String getName() {
    return name ?? '';
  }

  String getValue() {
    return value ?? '';
  }
}

AdvancePaymentItem advancePayment1 =
    AdvancePaymentItem(name: Constants.PAYADV30, value: "3789/-");
AdvancePaymentItem advancePayment2 =
    AdvancePaymentItem(name: Constants.PAYADV30, value: "0 km");
AdvancePaymentItem advancePayment3 =
    AdvancePaymentItem(name: Constants.PAYADV30, value: "0 km");

List<AdvancePaymentItem> advancePaymentItems = [
  advancePayment1,
  advancePayment2,
  advancePayment3,
];
