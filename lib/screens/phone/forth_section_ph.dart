import 'package:abdelwahab_portfolio/components/custom_text_field.dart';
import 'package:abdelwahab_portfolio/components/icon_botton.dart';
import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:abdelwahab_portfolio/data/app_data.dart';
import 'package:abdelwahab_portfolio/database/contact_form_database.dart';
import 'package:abdelwahab_portfolio/providers/app_data_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

import 'package:provider/provider.dart';

class ForthSectionPh extends StatelessWidget {
  ForthSectionPh({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final subjectC = TextEditingController();
  final messageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProv = Provider.of<AppDataProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "let's contact".toUpperCase(),
            style: GoogleFonts.bebasNeue(
              color: AppColors.text1,
              fontSize: 45,
              height: 1,
            ),
          ),
          const Gap(15),
          RichText(
            text: TextSpan(
              text: 'Say hello at ',
              style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 14),
              children: [
                TextSpan(
                  text: 'abdelwahab.mohamedd743@gmail.com',
                  style: GoogleFonts.manrope(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                  ),
                ),
              ],
            ),
          ),
          const Gap(5),
          RichText(
            text: TextSpan(
              text: "For more info, here's my ",
              style: GoogleFonts.manrope(color: AppColors.text2, fontSize: 14),
              children: [
                TextSpan(
                  text: 'Resume',
                  style: GoogleFonts.manrope(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // final anchor =
                      //     html.AnchorElement(
                      //         href: 'assets/Abdelwahab_Mo_CV.pdf',
                      //       )
                      //       ..setAttribute('download', 'Abdelwahab_Mo_CV.pdf')
                      //       ..click();
                      html.window.open(
                        dataProv.appData == null
                            ? AppData.linkes["Resume"].toString()
                            : dataProv.links!.resume,
                        '_blank',
                      );
                    },
                ),
              ],
            ),
          ),
          const Gap(25),
          FittedBox(
            child: Row(
              children: [
                IconBotton(
                  url: dataProv.appData == null
                      ? AppData.linkes["LinkedIn"].toString()
                      : dataProv.links!.linkedIn,
                  svg: 'assets/icons/linkedin.svg',
                ),
                const Gap(10),
                IconBotton(
                  url: dataProv.appData == null
                      ? AppData.linkes["Github"].toString()
                      : dataProv.links!.github,
                  svg: 'assets/icons/github.svg',
                ),
                const Gap(10),
                IconBotton(
                  url: dataProv.appData == null
                      ? AppData.linkes["Facebook"].toString()
                      : dataProv.links!.facebook,
                  svg: 'assets/icons/facebook.png',
                  isSvg: false,
                ),
                const Gap(10),
                IconBotton(
                  url: dataProv.appData == null
                      ? AppData.linkes["Whatsapp"].toString()
                      : dataProv.links!.whatsapp,
                  svg: 'assets/icons/whatsapp.png',
                  isSvg: false,
                ),
                const Gap(10),
                IconBotton(
                  url: dataProv.appData == null
                      ? AppData.linkes["Instagram"].toString()
                      : dataProv.links!.instagram,
                  svg: 'assets/icons/instagram.png',
                  isSvg: false,
                ),
              ],
            ),
          ),
          const Gap(30),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(title: "Name", controller: nameC),
                const Gap(15),
                CustomTextField(
                  title: "Email",
                  controller: emailC,
                  isEmail: true,
                ),
                const Gap(15),
                CustomTextField(title: "Subject", controller: subjectC),
                const Gap(15),
                CustomTextField(
                  title: "Message",
                  controller: messageC,
                  linesNum: 5,
                ),
                const Gap(25),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final db = ContactFormDatabase();
                        await db.submitForm(
                          name: nameC.text,
                          email: emailC.text,
                          subject: subjectC.text,
                          message: messageC.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Submitted Successfully.'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Submitting Failed!\nPlease Try again. $e',
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(
                    "SUBMIT",
                    style: GoogleFonts.manrope(
                      color: AppColors.background1,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(30),
          Text(
            "© 2025 Abdelwahab Mo",
            style: GoogleFonts.manrope(
              color: AppColors.text2,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
