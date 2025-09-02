import 'package:abdelwahab_portfolio/components/contactme_botton.dart';
import 'package:abdelwahab_portfolio/components/icon_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstAboutPh extends StatelessWidget {
  const FirstAboutPh({super.key, required this.contactKey});
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30),
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
            ],
          ),
          Gap(20),
          FittedBox(
            child: Row(
              children: [
                ContactmeBotton(
                  onTap: () {
                    Scrollable.ensureVisible(
                      contactKey.currentContext!,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: "CONTACT ME",
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
          Gap(30),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
          Gap(40),
        ],
      ),
    );
  }
}
