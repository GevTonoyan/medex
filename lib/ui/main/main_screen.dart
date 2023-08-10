import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/ui/main/main_blog_widget.dart';
import 'package:medex/ui/main/main_news_widget.dart';
import 'package:medex/ui/main/main_services_widget.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/default_button_2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: pageContentLeftPadding,
            top: pageContentTopPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'main_title_text'.tr,
                          style: AppFonts.title,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 24),
                        DefaultButton2(
                          label: 'main_see_more'.tr,
                          onPressed: () {
                            final HomeViewModel viewModel = Get.find();
                            viewModel.changePage(AppPages.sales);
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(child: Image.asset('main_picture.png'))
                ],
              ),
              const SizedBox(height: contentSeparationPadding),
              const MainServicesWidget(),
              const SizedBox(height: contentSeparationPadding),
            ],
          ),
        ),
        const Column(
          children: [
            MainAboutWidget(),
            SizedBox(height: contentSeparationPadding),
            MainBlogWidget(),
            SizedBox(height: 166),
            MainNewsWidget(),
            SizedBox(height: contentSeparationPadding),
          ],
        )
      ],
    );
  }
}
