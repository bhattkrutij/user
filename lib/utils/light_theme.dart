import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  primaryColor: const Color(0xff1db874),
  brightness: Brightness.light,
  accentColor: Colors.white,
  focusColor: const Color(0xFFADC4C8),
  hintColor: const Color(0xFF52575C),
  fontFamily: 'Sans Pro',
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: Colors.black,
    textStyle: const TextStyle(color: Colors.black),
  )),
  // appBarTheme: const AppBarTheme(
  //   backwardsCompatibility: false,
  //   systemOverlayStyle: SystemUiOverlayStyle(
  //     statusBarColor: Color(0xff1db874),
  //     statusBarIconBrightness: Brightness.light,
  //   ),
  //   iconTheme: IconThemeData(color: Colors.black),
  //   titleTextStyle: TextStyle(
  //       color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600),
  // ),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   elevation: 2.0,
  //   backgroundColor: Colors.white,
  //   selectedItemColor: Color(0xff4E3620),
  //   selectedLabelStyle: TextStyle(color: Color(0xff4E3620)),
  //   unselectedItemColor: Color(0xff897853),
  // ),
);
