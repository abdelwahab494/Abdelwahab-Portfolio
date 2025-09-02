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

class FirstSection extends StatelessWidget {
  const FirstSection({super.key, required this.contactKey});
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height - 80,
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 30,
        children: [
          SizedBox(
            width: width / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    "HI, I AM\nABDELWAHAB MO.",
                    style: GoogleFonts.bebasNeue(
                      color: AppColors.text1,
                      fontSize: 95,
                      height: 1,
                    ),
                  ),
                ),
                Text(
                  "An Egypt-based Flutter developer passionate about building high-performance, cross-platform mobile applications with beautiful and user-friendly interfaces.",
                  style: GoogleFonts.manrope(
                    color: AppColors.text2,
                    fontSize: 15,
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
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              text: "CONTACT ME",
                            ),
                            const Gap(15),
                            IconBotton(
                              url: dataProv.appData != null
                                  ? dataProv.links!.linkedIn
                                  : AppData.linkes["LinkedIn"].toString(),
                              svg: 'assets/icons/linkedin.svg',
                            ),
                            const Gap(15),
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
              ],
            ),
          ),
          Container(
            width: width / 2.7,
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
        ],
      ),
    );
  }
}
