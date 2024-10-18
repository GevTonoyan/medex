import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';

class DefaultButton2 extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final Size size;
  final bool isDisabled;

  const DefaultButton2({
    required this.label,
    this.onPressed,
    this.isDisabled = false,
    Key? key,
    this.size = const Size(187, 52),
  }) : super(key: key);

  @override
  State<DefaultButton2> createState() => _DefaultButton2State();
}

class _DefaultButton2State extends State<DefaultButton2> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        cursor: SystemMouseCursors.click,
        child: Container(
          height: widget.size.height,
          width: widget.size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: widget.isDisabled ? AppColors.disabled : AppColors.primary,
            ),
            borderRadius: BorderRadius.circular(12),
            color: _isHovering && !widget.isDisabled ? AppColors.primary : AppColors.appWhite,
          ),
          child: Center(
              child: Text(
            widget.label,
            style: AppFonts.bodyBold.copyWith(color: _getTextColor()),
          )),
        ),
      ),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }

  Color _getTextColor() {
    if (widget.isDisabled) {
      return AppColors.disabled;
    }
    if (_isHovering) {
      return AppColors.appWhite;
    }
    return AppColors.primary;
  }
}
