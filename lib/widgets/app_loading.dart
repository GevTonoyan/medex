import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medex/theming/app_colors.dart';

class AppLoading extends StatelessWidget {
  final double size;
  final Color color;

  const AppLoading({
    Key? key,
    this.size = 81,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: color,
      size: size,
    );
  }
}
