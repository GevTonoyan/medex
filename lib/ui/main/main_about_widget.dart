import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

const aboutPicturePath = 'about_picture.png';
const _aboutBackgroundPath = 'background_1.svg';

class MainAboutWidget extends StatelessWidget {
  const MainAboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: uiOrientedSwitch(
        const EdgeInsets.symmetric(vertical: 30, horizontal: pageHorizontalPaddingMobile),
        const EdgeInsets.fromLTRB(pageHorizontalPaddingDesktop, 60, 0, 60),
      ),
      color: AppColors.primary,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'about'.tr,
                  style: AppFonts.titleDesktop.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'main_about_description'.tr,
                  style: AppFonts.body.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
                const SizedBox(height: 20),
                ClickableText(
                  label: 'read_more'.tr,
                  textStyle: AppFonts.bodyBold,
                  color: AppColors.appWhite,
                  isUnderline: true,
                  onPressed: () {
                    final HomeViewModel viewModel = Get.find();
                    viewModel.currentPage = AppPages.about;
                  },
                ),
                const SizedBox(height: 24),
                Image.asset(
                  aboutPicturePath,
                  width: uiOrientedSwitch(double.maxFinite, 890.0),
                  height: uiOrientedSwitch(184, 477.0),
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
          if (Configuration().isDesktop) ...[
            Expanded(
              flex: 1,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 600),
                child: SvgPicture.asset(
                  _aboutBackgroundPath,
                  semanticsLabel: 'About',
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
