import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';

class AppFonts {
  static const TextStyle titleDesktop = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Mardoto',
    height: 48 / 32,
    color: AppColors.appBlack,
  );

  static const TextStyle titleMobile = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'Mardoto',
    height: 33 / 22,
    color: AppColors.appBlack,
  );

  static const TextStyle subTitleDesktop = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Mardoto',
    color: AppColors.appBlack,
    height: 36 / 24,
  );

  static const TextStyle subTitleMobile = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Mardoto',
    color: AppColors.appBlack,
    height: 27 / 18,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Mardoto',
    color: AppColors.appBlack,
    height: 24 / 16,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Mardoto',
    color: AppColors.appBlack,
    height: 24 / 16,
  );
}
