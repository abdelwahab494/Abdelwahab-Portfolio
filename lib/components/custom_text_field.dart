import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.linesNum = 1,
    this.isEmail = false,
  });
  final String title;
  final TextEditingController controller;
  final int linesNum;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 12),
        ),
        Gap(5),
        TextFormField(
          validator: (value) {
            if (isEmail) {
              if (!value!.endsWith("@gmail.com")) {
                return "Invalid Email Format!";
              }
              return null;
            }
            return null;
          },
          controller: controller,
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.background3,
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          style: GoogleFonts.manrope(color: AppColors.text1, fontSize: 13),
          maxLines: linesNum,
        ),
      ],
    );
  }
}
