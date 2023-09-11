import 'package:flutter/material.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/widgets/ui_components/app_loading.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;

  const AppNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.fill,
        loadingBuilder: (_, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Center(
            child: const AppLoading(color: AppColors.appWhite),
          );
        },
        errorBuilder: (_, __, ___) {
          return Image.asset(
            'assets/item_not_found.png',
            height: height,
            width: width,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
