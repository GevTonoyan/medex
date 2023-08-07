import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/clickable_text.dart';

const _aboutPicturePath = 'about_picture.png';
const _aboutBackgroundPath = 'about_background.svg';

class MainAboutWidget extends StatelessWidget {
  const MainAboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(38.0),
      height: 845.0,
      color: AppColors.primary,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'main_about'.tr,
                  style: AppFonts.title.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'main_about_description'.tr,
                  style: AppFonts.body.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                SizedBox(
                  width: 889.0,
                  height: 477.0,
                  child: Image.asset(_aboutPicturePath),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              _aboutBackgroundPath,
              semanticsLabel: 'About',
            ),
          ),
        ],
      ),
    );
  }
}
