import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/footer_icons.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/widgets/ui_components/app_icon.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

const _footerIconRightPadding = 40.0;
const _footerTextRightPadding = 32.0;

class FooterWidgetDesktop extends StatelessWidget {
  const FooterWidgetDesktop({Key? key}) : super(key: key);

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
                    onPressed: () {
                      if (page == AppPages.services) {
                        UrlHelper.openUrl(
                          url: viewModel.currentLocale.servicesUrlPath(),
                        );
                      } else {
                        viewModel.currentPage = page;
                      }
                    },
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
              for (final icon in FooterIcons.values) ...[
                AppIcon(
                  assetPath: icon.assetPath(),
                  onPressed: () => UrlHelper.openUrl(url: icon.urlPath()),
                ),
                if (icon != FooterIcons.values.last) ...[
                  const SizedBox(width: _footerIconRightPadding),
                ]
              ],
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
