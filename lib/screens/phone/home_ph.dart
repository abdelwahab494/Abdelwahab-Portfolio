import 'package:abdelwahab_portfolio/components/fotter.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/screens/phone/first_section_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/forth_section_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/second_section_ph.dart';
import 'package:abdelwahab_portfolio/screens/phone/third_section_ph.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePh extends StatefulWidget {
  const HomePh({super.key});

  @override
  State<HomePh> createState() => _HomePhState();
}

class _HomePhState extends State<HomePh> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background1,
        appBar: AppBar(
          backgroundColor: AppColors.background1,
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
                      Scrollable.ensureVisible(
                        homeKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Home",
                      style: GoogleFonts.manrope(color: AppColors.text1),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Scrollable.ensureVisible(
                        workKey.currentContext!,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Work",
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
              FirstSectionPh(contactKey: contactKey, key: homeKey),
              const Divider(thickness: 0.3),
              SecondSectionPh(key: workKey),
              const Divider(thickness: 0.3),
              ThirdSectionPh(key: aboutKey),
              const Divider(thickness: 0.3),
              ForthSectionPh(key: contactKey),
              Fotter(fontSize: 7),
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
      ),
    );
  }
}
