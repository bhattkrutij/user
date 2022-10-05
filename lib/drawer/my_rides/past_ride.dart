import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/drawer/my_rides/past_ride_item.dart';

import '../../utils/Dimentions.dart';

class PastRides extends StatefulWidget {
  const PastRides({Key? key}) : super(key: key);

  @override
  State<PastRides> createState() => _PastRidesState();
}

class _PastRidesState extends State<PastRides> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Diamentions.width10, vertical: Diamentions.width10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: Diamentions.width140),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return PastRideItem();
                    }),
              ),
            ),
          ],
        ));
  }
}
