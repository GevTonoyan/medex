import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/ui/about_us/about_us_screen_desktop.dart';
import 'package:medex/ui/blog/blog_screen.dart';
import 'package:medex/ui/contact_us/contact_us_screen.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/main_screen_desktop.dart';
import 'package:medex/ui/news/news_screen.dart';
import 'package:medex/ui/sales/sales_screen_desktop.dart';
import 'package:medex/ui/services/services_screen.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/footer_widget_desktop.dart';
import 'package:medex/widgets/header_widget_desktop.dart';

class HomeScreenDesktop extends StatefulWidget {
  const HomeScreenDesktop({super.key});

  @override
  State<HomeScreenDesktop> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenDesktop> {
  final HomeViewModel viewModel = Get.find();

  static Map<AppPages, Widget> pagesMap = {
    //todo add consts
    AppPages.main: const MainScreenDesktop(),
    AppPages.about: AboutUsScreenDesktop(),
    AppPages.services: ServicesScreen(),
    AppPages.sales: SalesScreenDesktop(),
    AppPages.blog: BlogScreen(),
    AppPages.news: NewsScreen(),
    AppPages.contact: ContactUsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      body: Column(
        children: [
          const HeaderWidgetDesktop(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 120 - 192 - contentSeparationPaddingDesktop,
                    ), //TODO think better way
                    child: Obx(() {
                      return pagesMap[viewModel.currentPage] ?? const MainScreenDesktop();
                    }),
                  ),
                  const SizedBox(height: contentSeparationPaddingDesktop),
                  const FooterWidgetDesktop(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
