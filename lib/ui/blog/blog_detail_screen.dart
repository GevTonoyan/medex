import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/core/utils/extensions/string_extensions.dart';
import 'package:medex/core/utils/utils.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/core/utils/configuration.dart';
import 'package:medex/widgets/ui_components/app_icon.dart';
import 'package:medex/widgets/ui_components/app_network_image.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogItemModel blog;

  const BlogDetailScreen({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionFirstPart = blog.description.splitDescription().first;
    final descriptionSecondPart = blog.description.splitDescription().last;

    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          uiOrientedSwitch(
              pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
          uiOrientedSwitch(pageTopPaddingMobile, pageTopPaddingDesktop),
          uiOrientedSwitch(pageHorizontalPaddingMobile, 0),
          uiOrientedSwitch(
              contentSeparationPaddingMobile, contentSeparationPaddingDesktop),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'blog'.tr,
                    style: uiOrientedSwitch(
                        AppFonts.titleMobile, AppFonts.titleDesktop),
                  ),
                  SizedBox(height: uiOrientedSwitch(16, 24)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog.title,
                              style: uiOrientedSwitch(AppFonts.subTitleMobile,
                                  AppFonts.subTitleDesktop),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              descriptionFirstPart,
                              style: AppFonts.body,
                            ),
                            const SizedBox(height: 24),
                            AppNetworkImage(
                              imageUrl: blog.imageUrl,
                              height: uiOrientedSwitch(185, 404),
                              width: uiOrientedSwitch(double.maxFinite, 750),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              descriptionSecondPart,
                              style: AppFonts.body,
                            )
                          ],
                        ),
                      ),
                      if (Configuration().isDesktop) ...[
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 827.0,
                            width: 817.0,
                            child: SvgPicture.asset(
                              'assets/background_2.svg',
                              semanticsLabel: 'Medex',
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: uiOrientedSwitch(0, pageHorizontalPaddingDesktop),
              child: AppIcon(
                iconData: Icons.close,
                iconColor: AppColors.appBlack,
                hoverColor: AppColors.primary,
                size: uiOrientedSwitch(Size(24, 24), Size(48, 48)),
                onPressed: () {
                  Get.back<void>();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
