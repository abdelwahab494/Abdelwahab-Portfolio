import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/models/work_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class WorkColumn extends StatefulWidget {
  const WorkColumn({super.key, required this.model});
  final WorkModel model;

  @override
  State<WorkColumn> createState() => _WorkColumnState();
}

class _WorkColumnState extends State<WorkColumn> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    WorkModel model = widget.model;

    return Column(
      children: [
        SizedBox(
          width: 250,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.background1,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: Text(
                    model.imageComment,
                    style: GoogleFonts.manrope(
                      color: AppColors.text1,
                      fontSize: 10,
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
                        padding: EdgeInsets.zero,
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
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.background1,
                      ),
                      icon: Icon(Icons.arrow_right, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              model.projectTitle,
              style: GoogleFonts.manrope(
                color: AppColors.text1,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Gap(10),
            Text(
              model.projectDescription,
              style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 13),
            ),
            Gap(25),
            Text(
              "PROJECT INFO",
              style: GoogleFonts.manrope(
                color: AppColors.text1,
                fontSize: 15,
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
                    fontSize: 15,
                  ),
                ),
                Text(
                  model.projectYear,
                  style: GoogleFonts.manrope(
                    color: AppColors.text1,
                    fontSize: 14,
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
                    fontSize: 15,
                  ),
                ),
                Text(
                  model.projectRole,
                  style: GoogleFonts.manrope(
                    color: AppColors.text1,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Gap(5),
            Divider(),
            Gap(20),
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
                      SvgPicture.asset("assets/icons/github.svg", width: 17),
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
      ],
    );
  }
}
