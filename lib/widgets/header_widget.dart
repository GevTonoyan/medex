import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/default_button_1.dart';

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
                  const Text(
                    '+374(44) 001 001',
                    style: AppFonts.body,
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
            onPressed: () {},
          ),
          const SizedBox(width: 200),
        ],
      ),
    );
  }
}
