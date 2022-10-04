import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwni_user/screens/authentication/splash.dart';
import 'package:kiwni_user/screens/authentication/welcome.dart';
import 'package:kiwni_user/utils/light_theme.dart';

class UserApp extends StatelessWidget {
  const UserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiwni user App',
      theme: light,
      themeMode: ThemeMode.system,
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomeScreen()
      },
      home: SplashScreen(),
    );
  }
}
