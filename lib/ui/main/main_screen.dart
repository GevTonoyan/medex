import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/ui/main/main_blog_widget.dart';
import 'package:medex/ui/main/main_news_widget.dart';
import 'package:medex/ui/main/main_services_widget.dart';
import 'package:medex/widgets/default_button_2.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'main_title_text'.tr,
                      style: AppFonts.title,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    DefaultButton2(
                      label: 'main_see_more'.tr,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Image.asset('main_background.png'))
          ],
        ),
        const MainServicesWidget(),
        MainAboutWidget(),
        MainBlogWidget(),
        MainNewsWidget(),
      ],
    );
  }
}
