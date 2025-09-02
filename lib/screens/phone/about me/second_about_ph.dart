import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SecondAboutPh extends StatelessWidget {
  const SecondAboutPh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10),
          Text(
            "My Capabilities".toUpperCase(),
            style: GoogleFonts.bebasNeue(
              color: AppColors.text1,
              fontSize: 45,
              height: 1,
            ),
          ),
          Gap(8),
          Text(
            "I specialize in Flutter development, crafting responsive and scalable cross-platform apps. I’m always expanding my skills in mobile UI/UX, state management, and backend integration to deliver seamless app experiences.",
            style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 14),
          ),
          Gap(15),
          Consumer<AppDataProvider>(
            builder: (context, dataProv, child) {
              return Skeletonizer(
                enabled: dataProv.isLoading,
                child: Wrap(
                  children: List.generate(
                    dataProv.appData != null
                        ? dataProv.capabilities!.length
                        : AppData.capabilities.length,
                    (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.text2,
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          dataProv.appData != null
                              ? dataProv.capabilities![index]
                              : AppData.capabilities[index],
                          style: GoogleFonts.manrope(
                            color: AppColors.text1,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
