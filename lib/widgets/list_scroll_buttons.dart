import 'package:flutter/material.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/widgets/app_icon.dart';

class ListScrollButtons extends StatelessWidget {
  final ScrollController controller;
  final double offset;

  const ListScrollButtons({
    Key? key,
    required this.controller,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          iconData: Icons.arrow_back_ios_new_rounded,
          iconColor: AppColors.appBlack,
          hoverColor: AppColors.primary,
          onPressed: () {
            controller.animateTo(
              controller.offset - (2 * offset),
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
        const SizedBox(width: 16),
        AppIcon(
          iconData: Icons.arrow_forward_ios_rounded,
          iconColor: AppColors.appBlack,
          hoverColor: AppColors.primary,
          onPressed: () {
            controller.animateTo(
              controller.offset + (2 * offset),
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 600),
            );
          },
        ),
      ],
    );
  }
}
