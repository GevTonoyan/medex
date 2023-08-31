import 'package:flutter/material.dart';
import 'package:medex/widgets/app_loading.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const AppNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          return Center(
            child: const AppLoading(),
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
