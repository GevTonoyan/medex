import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/admin/admin_screen.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/widgets/app_text_field/app_text_field.dart';
import 'package:medex/widgets/app_text_field/text_field_params.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/default_button_1.dart';

const _headerTextRightPadding = 24.0;
const _localeTextRightPadding = 24.0;

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = Get.find();
    final TextEditingController controller = TextEditingController();

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
                    onPressed: () {
                      UrlHelper.openUrl(url: 'tel://+37496203301');
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
                          onPressed: () {
                            if (page == AppPages.services) {
                              UrlHelper.openUrl(
                                url: homeViewModel.currentLocale.value.servicesUrlPath(),
                              );
                            } else {
                              homeViewModel.changePage(page);
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
          const Spacer(),
          DefaultButton1(
            label: 'prices'.tr,
            onPressed: () {
              UrlHelper.openUrl(
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/prices.pdf?alt=media&token=6b05a836-4f72-4003-a145-896bf3d51a61');
            },
          ),
          SizedBox(
            width: 200,
            child: GestureDetector(
              onTap: () {
                Get.dialog(
                  Dialog(
                    insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 400),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'enter_admin_code'.tr,
                            style: AppFonts.subTitle,
                          ),
                          SizedBox(height: 10),
                          AppTextField(params: TextFieldParams(controller: controller)),
                          SizedBox(height: 10),
                          DefaultButton1(
                              label: 'continue'.tr,
                              onPressed: () {
                                if (controller.text == '123123') {
                                  Get.to(() => const AdminScreen());
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
