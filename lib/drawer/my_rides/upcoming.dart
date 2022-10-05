import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_user/drawer/my_rides/upcomming_ride_item.dart';

import '../../utils/Dimentions.dart';

class UpcomingRide extends StatefulWidget {
  const UpcomingRide({Key? key}) : super(key: key);

  @override
  State<UpcomingRide> createState() => _UpcomingRideState();
}

class _UpcomingRideState extends State<UpcomingRide> {
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
                      return UpcomingRideItem();
                    }),
              ),
            ),
          ],
        ));
  }
}
