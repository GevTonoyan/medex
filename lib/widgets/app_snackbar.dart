import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar({
    Key? key,
    required String message,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) : super(
          key: key,
          content: Text(
            message,
            style: const TextStyle(
              color: AppColors.appWhite,
            ),
          ),
          duration: duration,
          action: action,
        );
}
