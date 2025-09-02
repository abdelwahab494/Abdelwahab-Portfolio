import 'package:abdelwahab_portfolio/components/fotter.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/phone/about%20me/first_about_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/about%20me/second_about_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/about%20me/third_about_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/forth_section_ph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAboutPh extends StatefulWidget {
  const HomeAboutPh({super.key});

  @override
  State<HomeAboutPh> createState() => _HomeAboutPhState();
}

class _HomeAboutPhState extends State<HomeAboutPh> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background1,
        appBar: AppBar(
          backgroundColor: AppColors.background1,
          leading: SizedBox.shrink(),
          leadingWidth: 0,
          title: FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Abdelwahab",
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.text1,
                    fontSize: 30,
                  ),
                ),
                Text(
                  " Mo.",
                  style: GoogleFonts.bebasNeue(
                    color: AppColors.primary,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            PopupMenuButton(
              color: AppColors.background3,
              icon: Icon(Icons.menu, color: AppColors.text1, size: 30),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Home",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Scrollable.ensureVisible(
                        aboutKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "About",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Scrollable.ensureVisible(
                        capabilityKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Capabilities",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Scrollable.ensureVisible(
                        experienceKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Experience",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Scrollable.ensureVisible(
                        contactKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Contact",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                ];
              },
            ),
          ],
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              FirstAboutPh(contactKey: contactKey, key: aboutKey),
              SecondAboutPh(key: capabilityKey),
              Divider(thickness: 0.3),
              ThirdAboutPh(key: experienceKey),
              Divider(thickness: 0.3),
              ForthSectionPh(key: contactKey),
              Fotter(fontSize: 7),
            ],
          ),
        ),
      ),
    );
  }
}
