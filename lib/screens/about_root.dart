import 'package:abdelwahab_portfolio/screens/pc/about%20me/home_about.dart';
import 'package:abdelwahab_portfolio/screens/phone/about%20me/home_about_ph.dart';
import 'package:flutter/material.dart';

class AboutRoot extends StatelessWidget {
  const AboutRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 810 ? HomeAbout() : HomeAboutPh();
  }
}
