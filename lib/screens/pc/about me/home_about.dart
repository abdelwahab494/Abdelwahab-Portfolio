import 'package:abdelwahab_portfolio/components/fotter.dart';
import 'package:abdelwahab_portfolio/components/nav_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/pc/about%20me/first_about.dart';
import 'package:abdelwahab_portfolio/screens/pc/about%20me/second_about.dart';
import 'package:abdelwahab_portfolio/screens/pc/about%20me/third_about.dart';
import 'package:abdelwahab_portfolio/screens/pc/forth_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAbout extends StatefulWidget {
  const HomeAbout({super.key});

  @override
  State<HomeAbout> createState() => _HomeAboutState();
}

class _HomeAboutState extends State<HomeAbout> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey capabilityKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
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
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        titleSpacing: 50,
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
        actions: [
          NavBotton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "Home",
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
                capabilityKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "Capabilities",
          ),
          Gap(40),
          NavBotton(
            onTap: () {
              Scrollable.ensureVisible(
                experienceKey.currentContext!,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: "Experience",
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
            FirstAbout(key: aboutKey),
            SecondAbout(key: capabilityKey),
            Divider(thickness: 0.3),
            ThirdAbout(key: experienceKey),
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
