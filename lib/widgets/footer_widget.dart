import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/app_icon.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:url_launcher/url_launcher.dart';

const _footerIconRightPadding = 40.0;
const _footerTextRightPadding = 32.0;

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.find();

    return Container(
      height: 192.0,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final page in AppPages.values) ...[
                if (page != AppPages.main) ...[
                  ClickableText(
                    label: page.toString().tr,
                    textStyle: AppFonts.body.copyWith(
                      color: AppColors.appWhite,
                    ),
                    onPressed: () => viewModel.changePage(page),
                  ),
                ],
                if (page != AppPages.values.first && page != AppPages.values.last) ...[
                  const SizedBox(width: _footerTextRightPadding),
                ]
              ],
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                assetPath: 'assets/facebook_icon.svg',
                onPressed: () {},
              ),
              const SizedBox(width: _footerIconRightPadding),
              AppIcon(
                assetPath: 'assets/instagram_icon.svg',
                onPressed: () async {
                  final Uri url = Uri.parse('https://instagram.com');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(width: _footerIconRightPadding),
              AppIcon(
                assetPath: 'assets/telegram_icon.svg',
                onPressed: () {},
              ),
              const SizedBox(width: _footerIconRightPadding),
              AppIcon(
                assetPath: 'assets/viber_icon.svg',
                onPressed: () {},
              ),
              const SizedBox(width: _footerIconRightPadding),
              AppIcon(
                assetPath: 'assets/whats_app_icon.svg',
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          Divider(
            thickness: 1,
            color: AppColors.appWhite.withOpacity(0.2),
          ),
          Expanded(
            child: Center(
              child: Text(
                'footer_all_rights_reserved'.tr,
                style: AppFonts.body.copyWith(
                  color: AppColors.appWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
