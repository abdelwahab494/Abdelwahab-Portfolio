import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBotton extends StatefulWidget {
  const NavBotton({super.key, required this.onTap, required this.text});
  final Function() onTap;
  final String text;

  @override
  State<NavBotton> createState() => _NavBottonState();
}

class _NavBottonState extends State<NavBotton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        hover = value;
      }),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: GoogleFonts.inter(
                color: hover ? AppColors.primary : AppColors.text1,
                fontSize: 12,
              ),
            ),
            Gap(5),
            hover
                ? Container(
                    height: 3,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(500),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
