import 'package:flutter/material.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/ui/main/views/main_about_widget.dart';
import 'package:medex/ui/main/views/main_news_widget.dart';
import 'package:medex/ui/main/views/main_offers_widget.dart';
import 'package:medex/ui/main/views/main_services_widget.dart';

class MainScreenMobile extends StatelessWidget {
  const MainScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding:
                EdgeInsets.symmetric(horizontal: pageHorizontalPaddingMobile),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/main_picture.png',
                    fit: BoxFit.contain,
                    height: 416,
                    width: double.maxFinite,
                  ),
                ),
                const SizedBox(height: 24),
                const MainOffersWidget(),
                const SizedBox(height: contentSeparationPaddingMobile),
                const MainServicesWidget(),
                const SizedBox(height: contentSeparationPaddingMobile),
              ],
            )),
        const MainAboutWidget(),
        const SizedBox(height: contentSeparationPaddingMobile),
        // const MainBlogWidget(),
        // const SizedBox(height: contentSeparationPaddingMobile),
        const MainNewsWidget(),
      ],
    );
  }
}
