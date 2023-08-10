import 'package:flutter/material.dart';
import 'package:medex/theming/colors.dart';

class AppFonts {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 48 / 32,
    color: AppColors.appBlack,
  );

  static const TextStyle subTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.appBlack,
    height: 36 / 24,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.appBlack,
    height: 24 / 16,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.appBlack,
    height: 24 / 16,
  );
}
