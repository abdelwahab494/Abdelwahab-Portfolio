import 'package:abdelwahab_portfolio/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:html' as html;

class IconBotton extends StatelessWidget {
  const IconBotton({
    super.key,
    required this.url,
    required this.svg,
    this.isSvg = true,
  });
  final String url;
  final String svg;
  final bool isSvg;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        html.window.open(url, '_blank');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.background3,
        foregroundColor: AppColors.primary,
      ),
      color: AppColors.text1,
      icon: isSvg
          ? SvgPicture.asset(svg, color: AppColors.primary)
          : Image.asset(svg, width: 23, color: AppColors.primary),
    );
  }
}
