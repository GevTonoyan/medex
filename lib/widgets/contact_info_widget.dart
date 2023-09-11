import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({Key? key}) : super(key: key);

  static const _itemsPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final blockPadding = uiOrientedSwitch(16.0, 24.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'address'.tr,
          style: AppFonts.bodyBold,
        ),
        const SizedBox(height: _itemsPadding),
        ClickableText(
          label: 'Ազատության 4\nԵրևան, Հայաստան',
          textStyle: AppFonts.body,
          isUnderline: true,
          onPressed: () {
            UrlHelper.openUrl(
                url:
                    'https://yandex.com/maps/org/medex/220943845110/?display-text=%D5%B4%D5%A5%D5%A4%D5%A5%D6%84%D5%BD&ll=44.521133%2C40.200226&mode=search&sctx=ZAAAAAgBEAAaKAoSCfFmDd5XtSVAEXmxMEROl0hAEhIJ9N4YAoCWVkAR8dQjDW7bQUAiBgABAgMEBSgKOABAkE5IAWISbGV0b192X2dvcm9kZT10cnVlagV3b3JsZJ0BzcxMPaABAKgBAL0Bc2rtEsIBBvaNnoq3BuoBAPIBAPgBAIICDNW01aXVpNWl1oTVvYoCAJICAJoCDGRlc2t0b3AtbWFwcw%3D%3D&sll=44.521133%2C40.200226&sspn=0.014057%2C0.006470&text=%D5%B4%D5%A5%D5%A4%D5%A5%D6%84%D5%BD&z=16.65');
          },
        ),
        SizedBox(height: blockPadding),
        Text(
          'working_hours'.tr,
          style: AppFonts.bodyBold,
        ),
        const SizedBox(height: _itemsPadding),
        const Text(
          'Երկուշաբթի-ուրբաթ՝ 09։00-18։00\nՇաբաթ՝ 12։00-14։00',
          style: AppFonts.body,
        ),
        SizedBox(height: blockPadding),
        Text(
          'phone_number'.tr,
          style: AppFonts.bodyBold,
        ),
        const SizedBox(height: _itemsPadding),
        ClickableText(
          label: '+374(96) 203 301\n+374(10) 203 301',
          textStyle: AppFonts.body,
          onPressed: () {
            UrlHelper.openUrl(url: 'tel://+37496203301');
          },
        ),
        SizedBox(height: blockPadding),
        Text(
          'email'.tr,
          style: AppFonts.bodyBold,
        ),
        const SizedBox(height: _itemsPadding),
        ClickableText(
          label: 'info@medex.clinic',
          textStyle: AppFonts.body,
          onPressed: () {
            UrlHelper.openUrl(url: 'mailto:info@medex.clinic');
          },
        )
      ],
    );
  }
}
