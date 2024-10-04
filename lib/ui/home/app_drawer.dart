import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_locales.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/url_helper.dart';
import 'package:medex/widgets/ui_components/app_icon.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';
import 'package:medex/widgets/phone_number_row_widget.dart';
import 'package:medex/widgets/ui_components/default_button_1.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = Get.find();

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(blurRadius: 5),
        ],
      ),
      child: Drawer(
        backgroundColor: AppColors.appWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppIcon(
                iconData: Icons.clear,
                iconColor: AppColors.primary,
                size: Size(30, 30),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 30),
              DefaultButton1(
                label: 'prices'.tr,
                size: Size(double.maxFinite, 44),
                onPressed: () {
                  UrlHelper.openUrl(
                      url:
                          'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/prices.pdf?alt=media&token=6b05a836-4f72-4003-a145-896bf3d51a61');
                },
              ),
              const SizedBox(height: 24),
              for (final page in AppPages.values) ...[
                Obx(() => ClickableText(
                      label: page.toString().tr,
                      textStyle: AppFonts.bodyBold,
                      color: page == homeViewModel.currentPage
                          ? AppColors.primary
                          : null,
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (page == AppPages.services) {
                          UrlHelper.openUrl(
                            url: homeViewModel.currentLocale.servicesUrlPath(),
                          );
                        } else {
                          homeViewModel.currentPage = page;
                        }
                      },
                    )),
                if (page != AppPages.values.last) ...[
                  const SizedBox(height: 16),
                ]
              ],
              const SizedBox(height: 24),
              const PhoneNumberRowWidget(),
              const SizedBox(height: 24),
              Row(
                children: [
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
                      const SizedBox(width: 24),
                    ]
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
