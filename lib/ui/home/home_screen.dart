import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/ui/about_us/about_us_screen.dart';
import 'package:medex/ui/blog/blog_screen.dart';
import 'package:medex/ui/contact_us/contact_us_screen.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/main_screen.dart';
import 'package:medex/ui/news/news_detail_screen.dart';
import 'package:medex/ui/news/news_screen.dart';
import 'package:medex/ui/sales/sales_screen.dart';
import 'package:medex/ui/services/services_screen.dart';
import 'package:medex/widgets/footer_widget.dart';
import 'package:medex/widgets/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final viewModel = Get.put(HomeViewModel());

  static  Map<AppPages, Widget> pagesMap = { //todo add consts
    AppPages.main: const MainScreen(),
    AppPages.about: AboutUsScreen(),
    AppPages.services: ServicesScreen(),
    AppPages.sales: SalesScreen(),
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
          const HeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    return pagesMap[viewModel.currentPage.value] ?? const MainScreen();
                  }),
                  const FooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
