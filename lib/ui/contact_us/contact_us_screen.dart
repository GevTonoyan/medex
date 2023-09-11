import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/contact_info_widget.dart';

const _backgroundAssetPath = 'assets/contact_us_picture.png';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: uiOrientedSwitch(pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        right: uiOrientedSwitch(pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        top: uiOrientedSwitch(pageTopPaddingMobile, pageTopPaddingDesktop),
        bottom: 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'contact'.tr,
                  style: uiOrientedSwitch(AppFonts.titleMobile, AppFonts.titleDesktop),
                ),
                SizedBox(height: uiOrientedSwitch(16, 24)),
                const ContactInfoWidget(),
              ],
            ),
          ),
          if (Configuration().isDesktop) ...[
            Expanded(child: Image.asset(_backgroundAssetPath)),
          ],
        ],
      ),
    );
  }
}
