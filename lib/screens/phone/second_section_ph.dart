import 'package:abdelwahab_portfolio/components/work_column.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SecondSectionPh extends StatefulWidget {
  const SecondSectionPh({super.key});
  @override
  State<SecondSectionPh> createState() => _SecondSectionPhState();
}

class _SecondSectionPhState extends State<SecondSectionPh> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30),
          Text(
            "Featured Projects".toUpperCase(),
            style: GoogleFonts.bebasNeue(
              color: AppColors.text1,
              fontSize: 45,
              height: 1,
            ),
          ),
          Text(
            "Here are some of the selected projects that showcase my passion for Flutter development.",
            style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 14),
          ),
          Gap(30),
          Consumer<AppDataProvider>(
            builder: (context, dataProv, child) {
              return Skeletonizer(
                enabled: dataProv.isLoading,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataProv.isLoading
                      ? 1
                      : (dataProv.appData != null
                            ? dataProv.work!.length
                            : AppData.works.length),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        WorkColumn(
                          model: dataProv.appData != null
                              ? dataProv.work![index]
                              : AppData.works[index],
                        ),
                        Gap(60),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
