import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/core/utils/utils.dart';
import 'package:medex/ui/news/models/news_item_model.dart';
import 'package:medex/core/utils/configuration.dart';
import 'package:medex/widgets/ui_components/app_icon.dart';
import 'package:medex/widgets/ui_components/app_network_image.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsItemModel newsItemModel;

  const NewsDetailScreen({
    Key? key,
    required this.newsItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          uiOrientedSwitch(
              pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
          uiOrientedSwitch(pageTopPaddingMobile, pageTopPaddingDesktop),
          uiOrientedSwitch(pageHorizontalPaddingMobile, 0),
          0,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'news'.tr,
                    style: uiOrientedSwitch(
                        AppFonts.titleMobile, AppFonts.titleDesktop),
                  ),
                  SizedBox(height: uiOrientedSwitch(16, 24)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newsItemModel.title,
                              style: AppFonts.subTitleDesktop,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              newsItemModel.description,
                              style: AppFonts.body,
                            ),
                            const SizedBox(height: 24),
                            AppNetworkImage(
                              imageUrl: newsItemModel.imageUrl,
                              height: 404,
                              width: 750,
                            ),
                          ],
                        ),
                      ),
                      if (Configuration().isDesktop) ...[
                        const SizedBox(width: 24),
                        SvgPicture.asset(
                          'assets/background_2.svg',
                          semanticsLabel: 'Medex',
                          height: uiOrientedSwitch(185.0, 827.0),
                          width: uiOrientedSwitch(double.maxFinite, 817.0),
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
