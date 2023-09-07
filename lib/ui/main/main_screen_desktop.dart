import 'package:flutter/material.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/ui/main/main_blog_widget.dart';
import 'package:medex/ui/main/main_news_widget.dart';
import 'package:medex/ui/main/main_services_widget.dart';
import 'package:medex/utils/constants.dart';

import 'main_offers_widget.dart';

class MainScreenDesktop extends StatelessWidget {
  const MainScreenDesktop({Key? key}) : super(key: key);

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
                  Expanded(child: const MainOffersWidget()),
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
        Column(
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
