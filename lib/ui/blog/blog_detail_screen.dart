import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/app_network_image.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogItemModel blog;

  const BlogDetailScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(pageContentLeftPadding, pageContentTopPadding, 0, contentSeparationPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'blog'.tr,
                style: AppFonts.title,
              ),
              const SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blog.title,
                          style: AppFonts.subTitle,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          blog.description,
                          style: AppFonts.body,
                        ),
                        const SizedBox(height: 24),
                        AppNetworkImage(imageUrl: blog.imageUrl, height: 404, width: 750),
                        const SizedBox(height: 24),
                        Text(
                          blog.description,
                          style: AppFonts.body,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  SizedBox(
                    height: 827.0,
                    width: 817.0,
                    child: SvgPicture.asset(
                      'assets/background_2.svg',
                      semanticsLabel: 'Medex',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: contentSeparationPadding),
            ],
          ),
        ),
      ),
    );
  }
}
