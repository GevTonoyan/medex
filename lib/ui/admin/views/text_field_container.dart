import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/widgets/ui_components/app_text_field/app_text_field.dart';
import 'package:medex/widgets/ui_components/app_text_field/text_field_params.dart';

class TextFieldContainer extends StatelessWidget {
  /// The label of the container
  final String label;

  /// Multiple text fields can be added to the container
  final List<TextFieldParams> params;

  const TextFieldContainer({
    Key? key,
    required this.label,
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
          Text(label ?? '', style: AppFonts.subTitleDesktop),
          const SizedBox(height: 16),
          ...params.map(
            (param) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(params: param),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
          //AppTextField(params: params),
        ],
      ),
    );
  }
}
