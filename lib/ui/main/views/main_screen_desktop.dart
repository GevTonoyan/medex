import 'package:flutter/material.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/ui/main/views/main_about_widget.dart';
import 'package:medex/ui/main/views/main_news_widget.dart';
import 'package:medex/ui/main/views/main_services_widget.dart';

import 'main_offers_widget.dart';

class MainScreenDesktop extends StatelessWidget {
  const MainScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: pageHorizontalPaddingDesktop,
              top: pageTopPaddingDesktop,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: const MainOffersWidget()),
                    const SizedBox(width: 24),
                    Expanded(child: Image.asset('assets/main_picture.png'))
                  ],
                ),
                const SizedBox(height: contentSeparationPaddingDesktop),
                const MainServicesWidget(),
                const SizedBox(height: contentSeparationPaddingDesktop),
              ],
            ),
          ),
          Column(
            children: [
              MainAboutWidget(),
              SizedBox(height: contentSeparationPaddingDesktop),
              // MainBlogWidget(),
              // SizedBox(height: 166),
              MainNewsWidget(),
            ],
          )
        ],
      ),
    );
  }
}
