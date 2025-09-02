import 'package:abdelwahab_portfolio/components/fotter.dart';
import 'package:abdelwahab_portfolio/components/nav_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/pc/first_section.dart';
import 'package:abdelwahab_portfolio/screens/pc/forth_section.dart';
import 'package:abdelwahab_portfolio/screens/pc/second_section.dart';
import 'package:abdelwahab_portfolio/screens/pc/third_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePc extends StatefulWidget {
  const HomePc({super.key});

  @override
  State<HomePc> createState() => _HomePcState();
}

class _HomePcState extends State<HomePc> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey workKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  bool isShown = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset > 150) {
        setState(() {
          isShown = true;
        });
      } else {
        if (isShown) {
          setState(() {
            isShown = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.background1,
        title: FittedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Abdelwahab",
                style: GoogleFonts.bebasNeue(
                  color: AppColors.text1,
                  fontSize: 32,
                ),
              ),
              Text(
                " Mo.",
                style: GoogleFonts.bebasNeue(
                  color: AppColors.primary,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 50,
        actions: [
          NavBotton(
            onTap: () {
              Scrollable.ensureVisible(
                homeKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "Home",
          ),
          Gap(40),
          NavBotton(
            onTap: () {
              Scrollable.ensureVisible(
                workKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "Work",
          ),
          Gap(40),
          NavBotton(
            onTap: () {
              Scrollable.ensureVisible(
                aboutKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "About",
          ),
          Gap(40),
          NavBotton(
            onTap: () {
              Scrollable.ensureVisible(
                contactKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "Contact",
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 50),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: scrollController,
        child: Column(
          children: [
            FirstSection(key: homeKey, contactKey: contactKey),
            Divider(thickness: 0.3),
            SecondSection(key: workKey),
            Divider(thickness: 0.3),
            ThirdSection(key: aboutKey),
            Divider(thickness: 0.3),
            ForthSection(key: contactKey),
            Fotter(fontSize: 10),
          ],
        ),
      ),
      floatingActionButton: isShown
          ? FloatingActionButton(
              onPressed: () {
                scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.background1,
              tooltip: "Go Up",
              mini: true,
              child: Icon(Icons.keyboard_double_arrow_up, size: 30),
            )
          : null,
    );
  }
}
