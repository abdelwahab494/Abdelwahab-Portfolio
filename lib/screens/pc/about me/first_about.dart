import 'package:abdelwahab_portfolio/components/contactme_botton.dart';
import 'package:abdelwahab_portfolio/components/icon_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class FirstAbout extends StatelessWidget {
  const FirstAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      color: AppColors.background1,
      child: Column(
        children: [
          Row(
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
                width: width / 2.5,
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
                    Gap(30),
                    FittedBox(
                      child: Row(
                        children: [
                          ContactmeBotton(
                            onTap: () {
                              html.window.open(
                                AppData.linkes["Resume"].toString(),
                                '_blank',
                              );
                            },
                            text: "DOWNLOAD RESUME",
                            icon: Icons.file_download_outlined,
                          ),
                          Gap(15),
                          IconBotton(
                            url: AppData.linkes["LinkedIn"].toString(),
                            svg: 'assets/icons/linkedin.svg',
                          ),
                          Gap(15),
                          IconBotton(
                            url: AppData.linkes["Github"].toString(),
                            svg: 'assets/icons/github.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(70),
          Container(
            width: width * 0.75,
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://dsyzfqddbgiqtobxctrt.supabase.co/storage/v1/object/public/images//3bwhab3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
