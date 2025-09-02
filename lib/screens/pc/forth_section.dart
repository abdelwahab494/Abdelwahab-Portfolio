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

class ForthSection extends StatelessWidget {
  ForthSection({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController subjectC = TextEditingController();
  final TextEditingController messageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final dataProv = Provider.of<AppDataProvider>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      color: AppColors.background1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width / 2.5,
            height: height * 0.65,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "let's contact".toUpperCase(),
                      style: GoogleFonts.bebasNeue(
                        color: AppColors.text1,
                        fontSize: 65,
                        height: 1,
                      ),
                    ),
                    Gap(15),
                    SelectableText.rich(
                      TextSpan(
                        text: 'Say hello at ',
                        style: GoogleFonts.manrope(
                          color: AppColors.text2,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'abdelwahab.mohamedd743@gmail.com',
                            style: GoogleFonts.manrope(
                              color: AppColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primary,
                              decorationThickness: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(5),
                    RichText(
                      text: TextSpan(
                        text: "For more info, here's my ",
                        style: GoogleFonts.manrope(
                          color: AppColors.text2,
                          fontSize: 16,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Resume',
                            style: GoogleFonts.manrope(
                              color: AppColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationThickness: 3,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // final anchor =
                                //     html.AnchorElement(
                                //         href:
                                //             'assets/Abdelwahab Mohamed Abdelwahab - Flutter Developer CV.pdf',
                                //       )
                                //       ..setAttribute(
                                //         'download',
                                //         'Abdelwahab Mo - Flutter Developer CV.pdf',
                                //       )
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
                    Gap(35),
                    FittedBox(
                      child: Row(
                        children: [
                          IconBotton(
                            url: dataProv.appData == null
                                ? AppData.linkes["LinkedIn"].toString()
                                : dataProv.links!.linkedIn,
                            svg: 'assets/icons/linkedin.svg',
                          ),
                          Gap(15),
                          IconBotton(
                            url: dataProv.appData == null
                                ? AppData.linkes["Github"].toString()
                                : dataProv.links!.github,
                            svg: 'assets/icons/github.svg',
                          ),
                          Gap(15),
                          IconBotton(
                            url: dataProv.appData == null
                                ? AppData.linkes["Facebook"].toString()
                                : dataProv.links!.facebook,
                            svg: 'assets/icons/facebook.png',
                            isSvg: false,
                          ),
                          Gap(15),
                          IconBotton(
                            url: dataProv.appData == null
                                ? AppData.linkes["Whatsapp"].toString()
                                : dataProv.links!.whatsapp,
                            svg: 'assets/icons/whatsapp.png',
                            isSvg: false,
                          ),
                          Gap(15),
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
                  ],
                ),
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
          ),
          SizedBox(
            width: width / 2.5,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(title: "Name", controller: nameC),
                  Gap(15),
                  CustomTextField(title: "Email", controller: emailC),
                  Gap(15),
                  CustomTextField(title: "Subject", controller: subjectC),
                  Gap(15),
                  CustomTextField(
                    title: "Message",
                    controller: messageC,
                    linesNum: 5,
                  ),
                  Gap(25),
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
                              content: Text(
                                'Submitted Successfully.',
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: AppColors.primary,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Submitting Failed!\nPlease Try again. $e',
                              ),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 18,
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
          ),
        ],
      ),
    );
  }
}
