import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_locales.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/n_tap_check.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';
import 'package:medex/widgets/ui_components/default_button_1.dart';
import 'package:medex/widgets/phone_number_row_widget.dart';

const _headerTextRightPadding = 24.0;
const _localeTextRightPadding = 24.0;

class HeaderWidgetDesktop extends StatefulWidget {
  final VoidCallback? onPageChanged;

  const HeaderWidgetDesktop({
    Key? key,
    this.onPageChanged,
  }) : super(key: key);

  @override
  State<HeaderWidgetDesktop> createState() => _HeaderWidgetDesktopState();
}

class _HeaderWidgetDesktopState extends State<HeaderWidgetDesktop> {
  final NTapCheck tapCheck = NTapCheck(n: 5);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = Get.find();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.appWhite,
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000), // 0D is the opacity for #0000000D
            offset: Offset(0, 5), // x and y offset
            blurRadius: 15, // blur value
            spreadRadius: 0, // spread value
          ),
        ],
      ),
      height: 120.0,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
              if (homeViewModel.currentPage != AppPages.main) {
                homeViewModel.currentPage = AppPages.main;
              }
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const PhoneNumberRowWidget(),
                  const SizedBox(width: 24),
                  for (final locale in AppLocales.values) ...[
                    Obx(() {
                      final isSelected = locale == homeViewModel.currentLocale;
                      return ClickableText(
                        label: locale.toString(),
                        textStyle:
                            isSelected ? AppFonts.bodyBold : AppFonts.body,
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
                          color: page == homeViewModel.currentPage
                              ? AppColors.primary
                              : null,
                          onPressed: () {
                            if (page == AppPages.services) {
                              UrlHelper.openUrl(
                                url: homeViewModel.currentLocale
                                    .servicesUrlPath(),
                              );
                            } else {
                              widget.onPageChanged?.call();
                              homeViewModel.currentPage = page;
                            }
                          },
                        )),
                    if (page != AppPages.values.last) ...[
                      const SizedBox(width: _headerTextRightPadding),
                    ]
                  ],
                ],
              ),
            ],
          ),
          DefaultButton1(
            label: 'prices'.tr,
            onPressed: () {
              UrlHelper.openUrl(
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/prices.pdf?alt=media&token=6b05a836-4f72-4003-a145-896bf3d51a61');
            },
          ),
        ],
      ),
    );
  }
}
