import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwni_user/providers/pickup_provider.dart';
import 'package:kiwni_user/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../utils/images_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.toNamed('/welcome'));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PickupProvider()),
      ],
      child: Scaffold(
        backgroundColor: ColorsHelper.primaryColor,
        body: Align(
          alignment: Alignment.center,
          child: Stack(children: [
            Positioned(
              top: height * .08,
              right: 0,
              left: 0,
              child: Container(
                child: Image.asset(
                  ImagesHelper.IMG_TITLE,
                  width: width * .30,
                  height: height * .30,
                ),
              ),
            ),
            Center(
              child: Container(
                child: Image.asset(
                  ImagesHelper.IMG_LOGO,
                  width: width * .50,
                  height: height * .50,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
