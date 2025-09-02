import 'package:abdelwahab_portfolio/components/bullet_text.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ThirdAbout extends StatelessWidget {
  const ThirdAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      color: AppColors.background1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width / 3,
            child: Text(
              "My Experience".toUpperCase(),
              style: GoogleFonts.bebasNeue(
                color: AppColors.text1,
                fontSize: 65,
                height: 1,
              ),
            ),
          ),
          SizedBox(
            width: width / 2.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 25,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(AppData.experience.length, (index) {
                final item = AppData.experience[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FittedBox(
                          child: Text(
                            item.title,
                            style: GoogleFonts.manrope(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            item.date,
                            style: GoogleFonts.manrope(
                              color: AppColors.text2,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      item.location,
                      style: GoogleFonts.manrope(
                        color: AppColors.text2,
                        fontSize: 13,
                      ),
                    ),
                    Gap(10),
                    Column(
                      children: List.generate(item.detailes.length, (index) {
                        return BulletText(text: item.detailes[index]);
                      }),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
