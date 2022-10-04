// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:get/get.dart';
import 'package:kiwni_user/screens/authentication/otp.dart';
import 'package:kiwni_user/screens/authentication/permission.dart';
import 'package:kiwni_user/screens/authentication/signin.dart';
import 'package:kiwni_user/screens/authentication/signup.dart';
import 'package:kiwni_user/screens/authentication/splash.dart';
import 'package:kiwni_user/screens/authentication/welcome.dart';
import 'package:kiwni_user/screens/booking/booking_details.dart';
import 'package:kiwni_user/screens/cabs/cab_list.dart';
import 'package:kiwni_user/screens/home/home/home.dart';
import 'package:kiwni_user/screens/home/search.dart';
import 'package:kiwni_user/screens/payments/payment_completed.dart';
import 'package:kiwni_user/screens/payments/paymnet_options.dart';

import 'drawer/my_rides.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/signIn': (context) => const SignIn(),
        '/otp': (context) => OTPScreen(),
        '/permission': (context) => const PermissionScreen(),
        '/signUp': (context) => const SignUp(),
        '/home': (context) => const Home(),
        '/search': (context) => SearchScreen(),
        '/cabList': (context) => CabsList(),
        '/bookingDetails': (context) => BookingDetails(),
        '/paymentOptions': (context) => PaymentOptions(),
        '/paymentCompleted': (context) => PaymentCompleted(),
        '/myRides': (context) => MyRides(),
      },
      title: 'Kiwni User App',
      theme: ThemeData(
        dividerColor: Colors.transparent,
        primaryColor: const Color(0xff1db874),
      ),
    );
  }
}
