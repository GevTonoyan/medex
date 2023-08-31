import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medex/theming/app_colors.dart';

class AppLoading extends StatelessWidget {
  final double size;

  const AppLoading({
    Key? key,
    this.size = 81,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: AppColors.primary,
      size: size,
    );
  }
}
