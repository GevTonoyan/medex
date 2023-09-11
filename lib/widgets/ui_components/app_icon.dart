import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medex/theming/app_colors.dart';

class AppIcon extends StatefulWidget {
  final String? assetPath;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final Color iconColor;
  final Color hoverColor;
  final bool disabled;
  final Size size;

  const AppIcon({
    this.assetPath,
    this.onPressed,
    Key? key,
    this.iconData,
    this.iconColor = AppColors.appWhite,
    this.hoverColor = AppColors.darkGreen,
    this.disabled = false,
    this.size = const Size(24, 24),
  })  : assert(iconData != null || assetPath != null),
        super(key: key);

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  var _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          height: widget.size.height,
          width: widget.size.width,
          child: widget.assetPath != null
              ? SvgPicture.asset(
                  widget.assetPath!,
                  colorFilter: ColorFilter.mode(
                    _getColor,
                    BlendMode.srcIn,
                  ),
                )
              : Icon(
                  widget.iconData,
                  size: 24,
                  color: _getColor,
                ),
        ),
      ),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }

  Color get _getColor {
    if (widget.disabled) {
      return AppColors.disabled;
    }
    if (_isHovering) {
      return widget.hoverColor;
    }

    return widget.iconColor;
  }
}
