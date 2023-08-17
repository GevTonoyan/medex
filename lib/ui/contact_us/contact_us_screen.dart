import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/widgets/contact_info_widget.dart';

const _backgroundAssetPath = 'assets/contact_us_picture.png';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'contact'.tr,
                  style: AppFonts.title,
                ),
                const SizedBox(height: 24.0),
                const ContactInfoWidget(),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(_backgroundAssetPath),
          ),
        ],
      ),
    );
  }
}
