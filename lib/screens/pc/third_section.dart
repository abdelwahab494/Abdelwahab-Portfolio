import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/about_root.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.7,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      color: AppColors.background1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Me".toUpperCase(),
            style: GoogleFonts.bebasNeue(
              color: AppColors.text1,
              fontSize: 65,
              height: 1,
            ),
          ),
          SizedBox(
            width: width / 2.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I am a Flutter developer based in Egypt. Has Electrical & Computer Engineering background.",
                  style: GoogleFonts.manrope(
                    color: AppColors.text1,
                    fontSize: 24,
                  ),
                ),
                Gap(12),
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
                              fontSize: 13,
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
          ),
        ],
      ),
    );
  }
}
