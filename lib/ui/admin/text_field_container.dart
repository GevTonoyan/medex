import 'package:flutter/material.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/widgets/app_text_field/app_text_field.dart';
import 'package:medex/widgets/app_text_field/text_field_params.dart';

class TextFieldContainer extends StatelessWidget {
  final TextFieldParams params;

  const TextFieldContainer({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(params.label ?? '', style: AppFonts.subTitleDesktop),
          const SizedBox(height: 16),
          AppTextField(params: params),
        ],
      ),
    );
  }
}
