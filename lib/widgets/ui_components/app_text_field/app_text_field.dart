import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/widgets/ui_components/app_text_field/text_field_params.dart';

class AppTextField extends StatelessWidget {
  final TextFieldParams params;

  const AppTextField({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: params.controller,
      decoration: InputDecoration(
        labelText: params.label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: AppColors.appBlack),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: AppColors.appBlack),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: AppColors.disabled),
        ),
      ),
      cursorColor: AppColors.appBlack,
      validator: params.validator,
      maxLines: params.maxLines,
    );
  }
}
