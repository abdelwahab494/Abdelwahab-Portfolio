import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/models/work_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class WorkRow extends StatefulWidget {
  const WorkRow({super.key, required this.model});
  final WorkModel model;

  @override
  State<WorkRow> createState() => _WorkRowState();
}

class _WorkRowState extends State<WorkRow> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    WorkModel model = widget.model;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: width / 3.5,
                height: height / 1.5,
                decoration: BoxDecoration(
                  color: AppColors.background3,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: ClipRRect(
                  child: Image.network(model.images[selectedIndex - 1]),
                ),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.background1,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: Text(
                    model.imageComment,
                    style: GoogleFonts.manrope(
                      color: AppColors.text1,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        setState(() {
                          if (selectedIndex > 1) {
                            selectedIndex--;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2),
                        backgroundColor: AppColors.background1,
                      ),
                      icon: Icon(Icons.arrow_left, color: AppColors.primary),
                    ),
                    Gap(20),
                    IconButton.filled(
                      onPressed: () {
                        setState(() {
                          if (selectedIndex < model.images.length) {
                            selectedIndex++;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(2),
                        backgroundColor: AppColors.background1,
                      ),
                      icon: Icon(Icons.arrow_right, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: width - (width / 4) - 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  model.projectTitle,
                  style: GoogleFonts.manrope(
                    color: AppColors.text1,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                Gap(10),
                Text(
                  model.projectDescription,
                  style: GoogleFonts.manrope(
                    color: AppColors.text2,
                    fontSize: 14,
                  ),
                ),
                Gap(25),
                Text(
                  "PROJECT INFO",
                  style: GoogleFonts.manrope(
                    color: AppColors.text1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(5),
                Divider(),
                Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Year",
                      style: GoogleFonts.manrope(
                        color: AppColors.text1,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      model.projectYear,
                      style: GoogleFonts.manrope(
                        color: AppColors.text1,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Divider(),
                Gap(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Role",
                      style: GoogleFonts.manrope(
                        color: AppColors.text1,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      model.projectRole,
                      style: GoogleFonts.manrope(
                        color: AppColors.text1,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Divider(),
                Gap(30),
                InkWell(
                  onTap: () {
                    html.window.open(model.url, '_blank');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'SEE ON GITHUB',
                            style: GoogleFonts.manrope(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: 8),
                          SvgPicture.asset(
                            "assets/icons/github.svg",
                            width: 17,
                          ),
                        ],
                      ),
                      Gap(5),
                      Container(
                        height: 2,
                        width: 130,
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
