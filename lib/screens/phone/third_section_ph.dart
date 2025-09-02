import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/about_root.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdSectionPh extends StatelessWidget {
  const ThirdSectionPh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me".toUpperCase(),
            style: GoogleFonts.bebasNeue(
              color: AppColors.text1,
              fontSize: 45,
              height: 1,
            ),
          ),
          Gap(15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I am a Flutter developer based in Egypt. Has Electrical & Computer Engineering background.",
                style: GoogleFonts.manrope(
                  color: AppColors.text1,
                  fontSize: 18,
                ),
              ),
              Gap(8),
              Text(
                "I’m a Flutter developer from Egypt with a background in Electrical and Computer Engineering. I specialize in building cross-platform mobile apps with smooth UI and great user experience. In my free time, I enjoy watching movies and series, playing Mech Arena, and traveling. Always eager to learn and grow in the mobile development field.",
                style: GoogleFonts.manrope(
                  color: AppColors.text2,
                  fontSize: 14,
                ),
              ),
              Gap(40),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => AboutRoot()),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'More About Me'.toUpperCase(),
                          style: GoogleFonts.manrope(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Gap(5),
                    Container(
                      height: 2,
                      width: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(600),
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
