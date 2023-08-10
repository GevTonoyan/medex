import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/clickable_text.dart';

const aboutPicturePath = 'about_picture.png';
const _aboutBackgroundPath = 'background_1.svg';

class MainAboutWidget extends StatelessWidget {
  const MainAboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(pageContentLeftPadding, 60, 0, 60),
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
                  style: AppFonts.title.copyWith(
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
                    viewModel.changePage(AppPages.about);
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 890.0,
                  height: 477.0,
                  child: Image.asset(aboutPicturePath),
                )
              ],
            ),
          ),
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
        ],
      ),
    );
  }
}
