import 'package:abdelwahab_portfolio/screens/pc/home_pc.dart';
import 'package:abdelwahab_portfolio/screens/phone/home_ph.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 810 ? HomePc() : HomePh();
  }
}
