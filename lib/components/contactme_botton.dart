import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactmeBotton extends StatefulWidget {
  const ContactmeBotton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon = Icons.arrow_outward_rounded,
  });
  final Function() onTap;
  final String text;
  final IconData icon;

  @override
  State<ContactmeBotton> createState() => _ContactmeBottonState();
}

class _ContactmeBottonState extends State<ContactmeBotton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      onHover: (value) => setState(() {
        hover = value;
      }),
      style: ElevatedButton.styleFrom(
        backgroundColor: hover
            ? Color.fromARGB(255, 187, 207, 107)
            : AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(3),
          Text(
            widget.text,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.bold,
              color: AppColors.background1,
              fontSize: 14,
            ),
          ),
          Gap(10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background1,
              shape: BoxShape.circle,
            ),
            child: Icon(widget.icon, color: AppColors.text1, size: 16),
          ),
        ],
      ),
    );
  }
}
