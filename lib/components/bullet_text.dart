import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletText extends StatelessWidget {
  const BulletText({super.key, required this.text});
  final String text;

  factory BulletText.fromJson(Map<String, dynamic> json) {
    return BulletText(text: json['text']);
  }

  Map<String, dynamic> toJson() => {'text': text};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            "•",
            style: GoogleFonts.manrope(color: AppColors.text1, fontSize: 13),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.manrope(color: AppColors.text1, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
