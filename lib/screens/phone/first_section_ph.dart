import 'package:abdelwahab_portfolio/components/contactme_botton.dart';
import 'package:abdelwahab_portfolio/components/icon_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FirstSectionPh extends StatelessWidget {
  const FirstSectionPh({super.key, required this.contactKey});
  final GlobalKey contactKey;

  // Future<Map<String, String>> getLinks() async {
  //   final url = Uri.parse(
  //     "https://abdelwahab494.github.io/Abdelwahab-Portfolio/app_data.json",
  //   );
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body);
  //     return Map<String, String>.from(data["linkes"]);
  //   } else {
  //     throw Exception("Failed to load data: ${response.statusCode}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  "HI, I AM\nABDELWAHAB MO.",
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.text1,
                    fontSize: 55,
                    height: 1,
                  ),
                ),
              ),
              Gap(8),
              Text(
                "An Egypt-based Flutter developer passionate about building high-performance, cross-platform mobile applications with beautiful and user-friendly interfaces.",
                style: GoogleFonts.manrope(
                  color: AppColors.text2,
                  fontSize: 14,
                ),
              ),
              Gap(25),
              Consumer<AppDataProvider>(
                builder: (context, dataProv, child) {
                  return Skeletonizer(
                    enabled: dataProv.isLoading,
                    child: FittedBox(
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
                            url: dataProv.appData != null
                                ? dataProv.links!.linkedIn
                                : AppData.linkes["LinkedIn"].toString(),
                            svg: 'assets/icons/linkedin.svg',
                          ),
                          Gap(15),
                          IconBotton(
                            url: dataProv.appData != null
                                ? dataProv.links!.github
                                : AppData.linkes["Github"].toString(),
                            svg: 'assets/icons/github.svg',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Gap(30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://dsyzfqddbgiqtobxctrt.supabase.co/storage/v1/object/public/images//abdelwahab.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Gap(40),
            ],
          ),
        ],
      ),
    );
  }
}
