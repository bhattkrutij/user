import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimentions.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../drawer_header.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorsHelper.primaryColor,
      body: customDrawerPage(
        title: Constants.FAQS,
        child: AboutBody(),
      ),
    ));
  }
}

class AboutBody extends StatelessWidget {
  AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Diamentions.width20),
      child: Column(
        children: [
          SizedBox(
            height: Diamentions.width50,
          ),
          Text(
            Constants.ABOUT_DESC,
            textAlign: TextAlign.start,
            maxLines: 10,
            style: TextStyle(
              fontSize: Diamentions.font18,
              fontFamily: Constants.FONT_FAMILY,
            ),
          ),
          SizedBox(
            height: Diamentions.width20,
          ),
          Text(
            Constants.ABOUT_DESC1,
            textAlign: TextAlign.start,
            maxLines: 10,
            style: TextStyle(
              fontSize: Diamentions.font18,
              fontFamily: Constants.FONT_FAMILY,
            ),
          ),
        ],
      ),
    );
  }
}
