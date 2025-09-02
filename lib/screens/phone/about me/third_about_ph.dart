import 'package:abdelwahab_portfolio/components/bullet_text.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ThirdAboutPh extends StatelessWidget {
  const ThirdAboutPh({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppDataProvider>(
      builder: (context, dataProv, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Text(
                "My Experience".toUpperCase(),
                style: GoogleFonts.bebasNeue(
                  color: AppColors.text1,
                  fontSize: 45,
                  height: 1,
                ),
              ),
              Gap(10),
              Skeletonizer(
                enabled: dataProv.isLoading,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 25,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    dataProv.isLoading
                        ? 2
                        : (dataProv.appData != null
                              ? dataProv.experience!.length
                              : AppData.experience.length),
                    (index) {
                      final item = dataProv.appData != null
                          ? dataProv.experience![index]
                          : AppData.experience[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: GoogleFonts.manrope(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                          Gap(3),
                          Text(
                            item.date,
                            style: GoogleFonts.manrope(
                              color: AppColors.text2,
                              fontSize: 11,
                            ),
                          ),
                          Gap(2),
                          Text(
                            item.location,
                            style: GoogleFonts.manrope(
                              color: AppColors.text2,
                              fontSize: 11,
                            ),
                          ),
                          Gap(10),
                          Column(
                            children: List.generate(item.detailes.length, (
                              index,
                            ) {
                              return BulletText(text: item.detailes[index]);
                            }),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
