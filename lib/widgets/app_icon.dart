import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medex/theming/colors.dart';

class AppIcon extends StatefulWidget {
  final String assetPath;
  final VoidCallback? onPressed;

  const AppIcon({
    required this.assetPath,
    this.onPressed,
    Key? key,
  }) : super(key: key);

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
        child: SvgPicture.asset(
          widget.assetPath,
          semanticsLabel: 'facebook',
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            _isHovering ? AppColors.darkGreen : AppColors.appWhite,
            BlendMode.srcIn,
          ),
        ),
      ),
      onTap: () {
        widget.onPressed?.call();
      },
    );
  }
}
