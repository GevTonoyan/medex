import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/default_button_1.dart';
import 'package:url_launcher/url_launcher.dart';

const _headerTextRightPadding = 24.0;
const _localeTextRightPadding = 24.0;

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = Get.find();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.appWhite,
        boxShadow: [
          BoxShadow(blurRadius: 15),
        ],
      ),
      height: 120.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: pageContentLeftPadding),
          InkWell(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Obx(() {
                return SvgPicture.asset(
                  'assets/medex_logo_${homeViewModel.currentLogoAssetPath}.svg',
                  semanticsLabel: 'Medex',
                  height: 62.0,
                  width: 191.0,
                );
              }),
            ),
            onTap: () {
              if (homeViewModel.currentPage.value != AppPages.main) {
                homeViewModel.changePage(AppPages.main);
              }
            },
          ),
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    onPressed: () async {
                      final Uri url = Uri.parse('tel://+37496203301');
                      if (!await launchUrl(url)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                  const SizedBox(width: 24),
                  for (final locale in AppLocales.values) ...[
                    Obx(() {
                      final isSelected = locale == homeViewModel.currentLocale.value;
                      return ClickableText(
                        label: locale.toString(),
                        textStyle: isSelected ? AppFonts.bodyBold : AppFonts.body,
                        color: isSelected ? AppColors.primary : null,
                        onPressed: () {
                          homeViewModel.changeLocale(locale);
                        },
                      );
                    }),
                    if (locale != AppLocales.values.last) ...[
                      const SizedBox(width: _localeTextRightPadding),
                    ]
                  ],
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (final page in AppPages.values) ...[
                    Obx(() => ClickableText(
                          label: page.toString().tr,
                          textStyle: AppFonts.bodyBold,
                          color: page == homeViewModel.currentPage.value ? AppColors.primary : null,
                          onPressed: () => homeViewModel.changePage(page),
                        )),
                    if (page != AppPages.values.last) ...[
                      const SizedBox(width: _headerTextRightPadding),
                    ]
                  ],
                ],
              ),
            ],
          ),
          const Spacer(),
          DefaultButton1(
            label: 'prices'.tr,
            onPressed: () async {
              final Uri url = Uri.parse(
                  'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/prices.pdf?alt=media&token=6b05a836-4f72-4003-a145-896bf3d51a61');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
          const SizedBox(width: 200),
        ],
      ),
    );
  }
}
