import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fotter extends StatelessWidget {
  const Fotter({super.key, required this.fontSize});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.background3,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Text(
        "This portfolio is built using Flutter Web, so performance might not be as smooth as standard web apps.",
        style: GoogleFonts.manrope(
          color: AppColors.text2,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
