import 'package:flutter/material.dart';
import 'package:medex/theming/colors.dart';

class ClickableText extends StatefulWidget {
  final String label;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isUnderline;

  const ClickableText({
    required this.label,
    required this.textStyle,
    this.onPressed,
    this.color,
    this.isUnderline = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ClickableText> createState() => _ClickableTextState();
}

class _ClickableTextState extends State<ClickableText> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return Colors.transparent;  // Setting the overlay color to be transparent
        },
      ),
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        cursor: SystemMouseCursors.click,
        child: Text(
          widget.label,
          style: widget.textStyle.copyWith(
              color: _isHovering ? AppColors.darkGreen : widget.color,
              decoration: widget.isUnderline ? TextDecoration.underline : null,
              decorationColor: _isHovering ? AppColors.darkGreen : widget.color),
        ),
      ),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }
}
