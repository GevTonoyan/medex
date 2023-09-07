import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/footer_icons.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/widgets/app_icon.dart';

const _footerIconRightPadding = 40.0;
const _footerTextRightPadding = 32.0;

class FooterWidgetMobile extends StatelessWidget {
  const FooterWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.find();

    return Container(
      height: 164.0,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
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
          ),
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
