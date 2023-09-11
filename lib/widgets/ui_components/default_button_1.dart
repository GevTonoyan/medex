import 'package:flutter/material.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';

class DefaultButton1 extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Size size;
  final bool isDisabled;

  const DefaultButton1({
    required this.label,
    required this.onPressed,
    this.isDisabled = false,
    Key? key,
    this.size = const Size(187, 47),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return isDisabled ? AppColors.disabled : AppColors.primary;
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            //When button is hovered and not disabled we need to show additional shadow
            if (states.contains(MaterialState.hovered) && !isDisabled) {
              return 20.0;
            }

            return 0;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
          (Set<MaterialState> states) {
            return EdgeInsets.zero; // No padding
          },
        ),
      ),
      onPressed: onPressed,
      child: Container(
        height: size.height,
        width: size.width,
        child: Center(
            child: Text(
          label,
          style: AppFonts.bodyBold.copyWith(color: AppColors.appWhite),
        )),
      ),
    );
  }
}
