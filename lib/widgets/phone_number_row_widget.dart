import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/core/utils/url_helper.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

class PhoneNumberRowWidget extends StatelessWidget {
  const PhoneNumberRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.phone,
          size: 24.0,
          color: AppColors.appBlack.withOpacity(0.8),
        ),
        const SizedBox(width: 8),
        ClickableText(
          label: '+374(96) 203 301',
          textStyle: AppFonts.body,
          onPressed: () {
            UrlHelper.openUrl(url: 'tel://+37496203301');
          },
        ),
      ],
    );
  }
}
