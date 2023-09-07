import 'package:flutter/material.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/ui/main/main_blog_widget.dart';
import 'package:medex/ui/main/main_news_widget.dart';
import 'package:medex/ui/main/main_offers_widget.dart';
import 'package:medex/ui/main/main_services_widget.dart';
import 'package:medex/widgets/footer_widget_desktop.dart';
import 'package:medex/widgets/footer_widget_mobile.dart';

class MainScreenMobile extends StatelessWidget {
  const MainScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'main_picture.png',
                    fit: BoxFit.fill,
                    height: 416,
                    width: double.maxFinite,
                  ),
                ),
                const SizedBox(height: 24),
                const MainOffersWidget(),
                const SizedBox(height: 50),
                const MainServicesWidget(),
                const SizedBox(height: 50),
              ],
            )),
        const MainAboutWidget(),
        const SizedBox(height: 50),
        const MainBlogWidget(),
        const SizedBox(height: 50),
        const MainNewsWidget(),
        const SizedBox(height: 50),
        const FooterWidgetMobile(),
      ],
    );
  }
}
